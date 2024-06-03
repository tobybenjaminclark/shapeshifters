import json
import time
import socket
import threading

A_ready = "false"
B_ready = "false"

A_1_accuracy = -1.0
A_2_accuracy = -1.0
A_3_accuracy = -1.0

B_1_accuracy = -1.0
B_2_accuracy = -1.0
B_3_accuracy = -1.0

def threadFuse():
  global A_ready
  global B_ready
  time.sleep(15)
  A_ready = "false"
  B_ready = "false"

def handle_client(client_socket):
  global A_ready
  global B_ready
  global A_1_accuracy
  global A_2_accuracy
  global A_3_accuracy
  global B_1_accuracy
  global B_2_accuracy
  global B_3_accuracy
  
  while True:
    data = client_socket.recv(1024)
    # data = extract_json(data)
    json_string = data.decode('latin-1')  # Assuming UTF-8 encoding
    print("Recieved JSON: " + json_string)
    real_json = extract_between_curly_brackets(json_string)
    data = json.loads(real_json)
    print(data)
    
    if data["readya"] == "true":
       A_ready = "true"
    if data["readyb"] == "true":
      B_ready = "true"
      
    if A_ready=="true" and B_ready=="true":
      thread = threading.Thread(target=threadFuse)
      thread.start()
      
    if data["a_1_accuracy"] > 0:
      A_1_accuracy = data["b_1_accuracy"]
    if data["a_2_accuracy"] > 0:
      A_1_accuracy = data["b_2_accuracy"]
    if data["a_3_accuracy"] > 0:
      A_1_accuracy = data["b_3_accuracy"]
      
    if data["b_1_accuracy"] > 0:
      A_1_accuracy = data["b_1_accuracy"]
    if data["b_2_accuracy"] > 0:
      A_1_accuracy = data["b_2_accuracy"]
    if data["b_3_accuracy"] > 0:
      A_1_accuracy = data["b_3_accuracy"] 
      
def extract_between_curly_brackets(input_string):
    start_index = input_string.find('{') + 1  # Find the index of the first '{' and move one position forward
    end_index = input_string.find('}', start_index)  # Find the index of the first '}' after the start index

    if start_index != -1 and end_index != -1:
        result = input_string[start_index:end_index]
        return "{"+result+"}"
    else:
        return None   
      
def update_clients(client1_socket, client2_socket):
  global A_ready
  global B_ready
  global A_1_accuracy
  global A_2_accuracy
  global A_3_accuracy
  global B_1_accuracy
  global B_2_accuracy
  global B_3_accuracy
  
  while True:
    time.sleep(0.5)
    data = {
      "readya": A_ready,
      "readyb": B_ready,
      "a_1_accuracy": A_1_accuracy,
      "a_2_accuracy": A_2_accuracy,
      "a_3_accuracy": A_3_accuracy,
      "b_1_accuracy": B_1_accuracy,
      "b_2_accuracy": B_2_accuracy,
      "b_3_accuracy": B_3_accuracy
    }
    
    json_string = json.dumps(data)
    print("Sent JSON: " + json_string)
    client1_socket.sendall(json_string.encode())
    client2_socket.sendall(json_string.encode())
  
    if A_3_accuracy > 0 and B_3_accuracy > 0:
      A_1_accuracy = -1.0
      A_2_accuracy = -1.0
      A_3_accuracy = -1.0
      B_1_accuracy = -1.0
      B_2_accuracy = -1.0
      B_3_accuracy = -1.0
    

def extract_json(binary_data):
  # Find the index of the null character '\x00'
  null_char_index = binary_data.find(b'\x00')

  # Extract the binary part
  binary_part = binary_data[null_char_index:]

  # Extract the JSON part
  json_part = b'{' + binary_part.split(b'{')[-1]

  # Optionally, you can remove any trailing null characters or whitespaces
  json_part = json_part.rstrip(b'\x00').strip()

  return json_part


# Main function to start the server
def main():
  # Server settings
  host = '0.0.0.0'
  port1 = 12347  # Port for client 1
  port2 = 12348  # Port for client 2

  # Create sockets
  server_socket1 = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
  server_socket2 = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

  # Bind sockets to ports
  server_socket1.bind((host, port1))
  server_socket2.bind((host, port2))

  print("Server started")

  # Accept connections from clients
  client1_addr = None
  client2_addr = None
  
  conn1 = None
  conn2 = None
  
  while True:
    if conn1 is None:
      server_socket1.listen()
      conn1, client1_addr = server_socket1.accept()
      print("Client 1 connected from:", client1_addr)

    if conn2 is None:
      server_socket2.listen()
      conn2, client2_addr = server_socket2.accept()
      print("Client 2 connected from:", client2_addr)

    if conn1 and conn2:
      # Start thread to handle communication with client1
      client1_thread = threading.Thread(target=handle_client, args=(conn1,))
      client1_thread.start()
      print("STARTED THREAD 1")

      # Start thread to handle communication with client2
      client2_thread = threading.Thread(target=handle_client, args=(conn2,))
      client2_thread.start()
      print("STARTED THREAD 2")
      
      # Start thread to update both clients 
      client12_thread = threading.Thread(target=update_clients, args=(conn1, conn2))
      client12_thread.start()
      print("START THREAD 3")
      break

if __name__ == "__main__":
  main()
  # Client1 then client2 for connection (IN THAT ORDER)