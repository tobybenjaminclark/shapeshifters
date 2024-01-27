import socket
import threading

# Function to handle incoming packets from client1 and forward them to client2
def handle_client1(client1_socket, client2_socket):
  while True:
    data = client1_socket.recv(1024)
    print(data)
    client2_socket.sendall(data)
    print("SENT")
    

# Function to handle incoming packets from client2 and forward them to client1
def handle_client2(client1_socket, client2_socket):
  while True:
    data = client2_socket.recv(1024)
    print(data)
    client1_socket.sendall(data)
    print("SENT2")

# Main function to start the server
def main():
  # Server settings
  host = '0.0.0.0'
  port1 = 12345  # Port for client 1
  port2 = 12346  # Port for client 2

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
      client1_thread = threading.Thread(target=handle_client1, args=(conn1, conn2))
      client1_thread.start()
      print("STARTED THREAD 1")

      # Start thread to handle communication with client2
      client2_thread = threading.Thread(target=handle_client2, args=(conn1, conn2))
      client2_thread.start()
      print("STARTED THREAD 2")
      break

if __name__ == "__main__":
  main()
  # Client1 then client2 for connection (IN THAT ORDER)