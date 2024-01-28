from flask import Flask, request, jsonify
import threading
import time

app = Flask(__name__)

ready_a = False
ready_b = False
accuracy_a = -1
accuracy_b = -1

@app.route('/api/submitReady', methods=['POST'])
def submit_ready():
    global ready_a, ready_b
    identifier = request.json['ID']
    if identifier == 'A':
        ready_a = True
    elif identifier == 'B':
        ready_b = True

    def reset_ready():
        time.sleep(15)
        print("Thread woke up after 15 seconds, now set both to false")
        ready_a = False
        ready_b = False

    threading.Thread(target=reset_ready).start()

    return jsonify({"Received": True})

@app.route('/api/getReady', methods=['GET'])
def get_ready():
    global ready_a, ready_b
    ready = ready_a and ready_b
    return jsonify({"Ready": ready})

@app.route('/api/submitAccuracy', methods=['POST'])
def submit_accuracy():
    global accuracy_a, accuracy_b
    identifier = request.json['ID']
    accuracy = float(request.json['Accuracy'])
    if identifier == 'A':
        accuracy_a = accuracy
    elif identifier == 'B':
        accuracy_b = accuracy

    def reset_accuracy():
        time.sleep(15)
        print("Thread woke up after 15 seconds, now set both to -1")
        accuracy_a = -1
        accuracy_b = -1

    threading.Thread(target=reset_accuracy).start()

    return jsonify({"Received": True})

@app.route('/api/getAccuracy', methods=['GET'])
def get_accuracy():
    global accuracy_a, accuracy_b
    winner = 'None'
    if accuracy_a > 0 and accuracy_b > 0:
        winner = 'A' if accuracy_a > accuracy_b else 'B'
    return jsonify({"Winner": winner})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8083)
