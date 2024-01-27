
import cv2
import numpy as np
import tensorflow as tf
import math
import statistics

CONFIDENCE_THRESHOLD = 0.4

# Dictionary that maps from joint names to keypoint indices.
KEYPOINT_DICT = {
        "nose": 0,
        "left_eye": 1,
        "right_eye": 2,
        "left_ear": 3,
        "right_ear": 4,
        "left_shoulder": 5,
        "right_shoulder": 6,
        "left_elbow": 7,
        "right_elbow": 8,
        "left_wrist": 9,
        "right_wrist": 10,
        "left_hip": 11,
        "right_hip": 12,
        "left_knee": 13,
        "right_knee": 14,
        "left_ankle": 15,
        "right_ankle": 16,
    }

    # Maps bones to a matplotlib color name.
KEYPOINT_EDGE_INDS_TO_COLOR = {
        (0, 1): (255, 0, 255),
        (0, 2): (0, 255, 255),
        (1, 3): (255, 0, 255),
        (2, 4): (0, 255, 255),
        (0, 5): (255, 0, 255),
        (0, 6): (0, 255, 255),
        (5, 7): (255, 0, 255),
        (7, 9): (255, 0, 255),
        (6, 8): (0, 255, 255),
        (8, 10): (0, 255, 255),
        (5, 6): (255, 255, 0),
        (5, 11): (255, 0, 255),
        (6, 12): (0, 255, 255),
        (11, 12): (255, 255, 0),
        (11, 13): (255, 0, 255),
        (13, 15): (255, 0, 255),
        (12, 14): (0, 255, 255),
        (14, 16): (0, 255, 255),
}

class ComputerVision():

    def __init__(self):
        # Load model
        self.model = tf.lite.Interpreter(
            model_path="src_computer_vision/models/movenet_singlepose_lightning.tflite"
        )
        self.model.allocate_tensors()

        # Get video input from primary camera
        self.cap = cv2.VideoCapture(1)

    def run(self):
        # Capture frame-by-frame
        ret, frame = self.cap.read()
        if ret:
            img = frame.copy()
            # Resize the frame
            img = tf.image.resize_with_pad(
                np.expand_dims(img, axis=0), target_height=192, target_width=192
            )
            # Type convert to tf.float32
            img = tf.cast(img, dtype=tf.float32)
            # Set up input and output formats for image
            input_details = self.model.get_input_details()
            output_details = self.model.get_output_details()
            # Pass the frame in the desired input format
            self.model.set_tensor(input_details[0]["index"], np.array(img))
            # Make the predictions
            self.model.invoke()
            # Get the keypoints with confindence scores in the desired output format
            keypoints_with_scores = self.model.get_tensor(output_details[0]["index"])

            # Draw the edges
            self.draw_connections(
                frame, keypoints_with_scores, KEYPOINT_EDGE_INDS_TO_COLOR
            )
            # Draw the keypoints
            keypoints = self.draw_keypoints(frame, keypoints_with_scores)

            angles = self.calculate_angles(keypoints)


            # Display the resulting frame
            cv2.imshow("Pose Estimation", frame)
            # Press Q on keyboard to  exit
            if cv2.waitKey(25) & 0xFF == ord("q"):
                return
        
            return angles


    def destroy(self):
        # Release video capture object
        self.cap.release()
        # Close all windows
        cv2.destroyAllWindows()

    def calculate_angles(self, keypoints):

        """
        angles we need

        left knee to left ankle
        right knee to right ankle

        left hip to left knee
        right hip to right knee

        left shoulder to left elbow
        right shoulder to right elbow

        left elbow to left wrist
        right elbow to right wrist

        midpoint of shoulders to (average of nose, left eye, right eye, left ear, right ear)
        """

        # keypoint in the format y, x, conf

        angle_dict = {}

        # do it from shoulder midpoint
        # do it from the hip midpoint

        left_hip_to_left_knee = self.calculate_angle(keypoints, "left_hip", "left_knee")
        angle_dict["h2lk"] = left_hip_to_left_knee

        right_hip_to_right_knee = self.calculate_angle(keypoints, "right_hip", "right_knee")
        angle_dict["h2rk"] = right_hip_to_right_knee


        left_knee_to_left_ankle = self.calculate_angle(keypoints, "left_knee", "left_ankle")

        if(left_knee_to_left_ankle == -1):
            left_knee_to_left_ankle = left_hip_to_left_knee

        angle_dict["lk2lf"] = left_knee_to_left_ankle

        right_knee_to_right_ankle = self.calculate_angle(keypoints, "right_knee", "right_ankle")

        if(right_knee_to_right_ankle == -1):
            right_knee_to_right_ankle = right_hip_to_right_knee

        angle_dict["rk2rf"] = right_knee_to_right_ankle

        

        left_shoulder_to_left_elbow = self.calculate_angle(keypoints, "left_shoulder", "left_elbow")
        angle_dict["s2le"] = left_shoulder_to_left_elbow

        right_shoulder_to_right_elbow = self.calculate_angle(keypoints, "right_shoulder", "right_elbow")
        angle_dict["s2re"] = right_shoulder_to_right_elbow

        left_elbow_to_left_wrist = self.calculate_angle(keypoints, "left_elbow", "left_wrist")
        angle_dict["le2lw"] = left_elbow_to_left_wrist

        right_elbow_to_right_wrist = self.calculate_angle(keypoints, "right_elbow", "right_wrist")
        angle_dict["re2rw"] = right_elbow_to_right_wrist

        shoulder_to_head = self.calculate_shoulder_to_head(keypoints)
        angle_dict["s2h"] = shoulder_to_head

        shoulder_to_hip = self.calculate_hip_to_shoulder(keypoints)
        angle_dict["s2w"] = shoulder_to_hip

        

        return angle_dict





    def calculate_angle(self, keypoints, keypoint_start, keypoint_end):

        start_y, start_x, start_conf = keypoints[KEYPOINT_DICT[keypoint_start]]
        end_y, end_x, end_conf = keypoints[KEYPOINT_DICT[keypoint_end]]

        if(start_conf < CONFIDENCE_THRESHOLD or end_conf < CONFIDENCE_THRESHOLD):
            return -1
        
        angle = math.degrees(math.atan2(end_y - start_y, end_x - start_x)) + 180

        print(f"{keypoint_start} to {keypoint_end}: {angle}")

        return angle

    def calculate_shoulder_to_head(self, keypoints):
        left_shoulder_y, left_shoulder_x, left_shoulder_conf = keypoints[KEYPOINT_DICT["left_shoulder"]]
        right_shoulder_y, right_shoulder_x, right_shoulder_conf = keypoints[KEYPOINT_DICT["right_shoulder"]]

        if(left_shoulder_conf < CONFIDENCE_THRESHOLD or right_shoulder_conf < CONFIDENCE_THRESHOLD):
            return -1
        
        shoulder_x_midpoint = (left_shoulder_x + right_shoulder_x) / 2
        shoulder_y_midpoint = (left_shoulder_y + right_shoulder_y) / 2

        positions_x = []
        positions_y = []

        nose_y, nose_x, nose_conf = keypoints[KEYPOINT_DICT["nose"]]
        if nose_conf > CONFIDENCE_THRESHOLD:
            positions_x.append(nose_x)
            positions_y.append(nose_y)

        left_eye_y, left_eye_x, left_eye_conf = keypoints[KEYPOINT_DICT["left_eye"]]
        if left_eye_conf > CONFIDENCE_THRESHOLD:
            positions_x.append(left_eye_x)
            positions_y.append(left_eye_y)

        right_eye_y, right_eye_x, right_eye_conf = keypoints[KEYPOINT_DICT["right_eye"]]
        if right_eye_conf > CONFIDENCE_THRESHOLD:
            positions_x.append(right_eye_x)
            positions_y.append(right_eye_y)

        left_ear_y, left_ear_x, left_ear_conf = keypoints[KEYPOINT_DICT["left_ear"]]
        if left_ear_conf > CONFIDENCE_THRESHOLD:
            positions_x.append(left_ear_x)
            positions_y.append(left_ear_y)

        right_ear_y, right_ear_x, right_ear_conf = keypoints[KEYPOINT_DICT["right_ear"]]
        if right_ear_conf > CONFIDENCE_THRESHOLD:
            positions_x.append(right_ear_x)
            positions_y.append(right_ear_y)

        if len(positions_x) == 0:
            return -1
        
        head_x = statistics.fmean(positions_x)
        head_y = statistics.fmean(positions_y)

        # shoulder to head

        angle = math.degrees(math.atan2(head_y - shoulder_y_midpoint, head_x - shoulder_x_midpoint)) + 180

        print(f"shoulder to head: {angle}")

        return angle

    def calculate_hip_to_shoulder(self, keypoints):
        left_shoulder_y, left_shoulder_x, left_shoulder_conf = keypoints[KEYPOINT_DICT["left_shoulder"]]
        right_shoulder_y, right_shoulder_x, right_shoulder_conf = keypoints[KEYPOINT_DICT["right_shoulder"]]

        if(left_shoulder_conf < CONFIDENCE_THRESHOLD or right_shoulder_conf < CONFIDENCE_THRESHOLD):
            return -1
        
        shoulder_x_midpoint = (left_shoulder_x + right_shoulder_x) / 2
        shoulder_y_midpoint = (left_shoulder_y + right_shoulder_y) / 2

        left_hip_y, left_hip_x, left_hip_conf = keypoints[KEYPOINT_DICT["left_hip"]]
        right_hip_y, right_hip_x, right_hip_conf = keypoints[KEYPOINT_DICT["right_hip"]]

        if(left_hip_conf < CONFIDENCE_THRESHOLD or right_hip_conf < CONFIDENCE_THRESHOLD):
            return -1
        
        hip_x_midpoint = (left_hip_x + right_hip_x) / 2
        hip_y_midpoint = (left_hip_y + right_hip_y) / 2

        angle = math.degrees(math.atan2(hip_y_midpoint - shoulder_y_midpoint, hip_x_midpoint - shoulder_x_midpoint)) + 180

        print(f"shoulder to hip: {angle}")

        return angle






    def draw_keypoints(self, frame, keypoints):
        """
        Method to draw the appropriate keypoints for each frame
        """
        # Get the dimensions of the frame
        y, x, _ = frame.shape
        # Normalizing the Keypoint Coordinates according to the image size
        new_keypoints = np.squeeze(np.multiply(keypoints, np.array([y, x, 1])))
        for keypoint in new_keypoints:
            # Getting the coordinates and the confidence coordinates for each keypoint
            ky, kx, kp_conf = keypoint
            # if the confidence score is less than the threshold, just ignore the keypoint detection altogether.
            if kp_conf > CONFIDENCE_THRESHOLD:
                # Draw a circle filled with green color at the keypoint location with a radius of 3
                cv2.circle(frame, (int(kx), int(ky)), 3, (0, 255, 0), -1)
        return new_keypoints


    def draw_connections(self, frame, keypoints, edges):
        """
        Method to draw the edges between the appropriate keypoints for each frame
        """
        # Get the dimensions of the frame
        y, x, _ = frame.shape
        # Normalizing the Keypoint Coordinates according to the image size
        new_keypoints = np.squeeze(np.multiply(keypoints, np.array([y, x, 1])))

        for vertices, edge_color in edges.items():
            # Grab the vertices for a particular edge
            v1, v2 = vertices
            # Get the coordinates and confidence score for first vertex
            y1, x1, c1 = new_keypoints[v1]
            # Get the coordinates and confidence score for second vertex
            y2, x2, c2 = new_keypoints[v2]
            # Check if the confidence score of both vertices is above the required threshold
            if (c1 > CONFIDENCE_THRESHOLD) & (c2 > CONFIDENCE_THRESHOLD):
                # Draw line of width 2 from the first vertex to the second vertex
                cv2.line(frame, (int(x1), int(y1)), (int(x2), int(y2)), edge_color, 2)





if __name__ == "__main__":
    computer_vis = ComputerVision()

    while True:
        computer_vis.run()