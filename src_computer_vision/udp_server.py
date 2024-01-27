import socket
import json
from computer_vision import ComputerVision

localIP = "127.0.0.1"
localPort = 8000
bufferSize = 1024

id_json = 1

# Create a datagram socket
UDPServerSocket = socket.socket(family=socket.AF_INET, type=socket.SOCK_DGRAM)

# Bind to address and ip
UDPServerSocket.bind((localIP, localPort))

print("UDP server up and listening")

computer_vision = ComputerVision()

# Listen for incoming datagrams
while(True):
        data = json.dumps(computer_vision.run())

        print(f"sending {data}")

        bytesAddressPair = UDPServerSocket.recvfrom(bufferSize)
        message = bytesAddressPair[0].decode("latin-1")
        address = bytesAddressPair[1]

        # assumes 4 byte unsigned integer
        clientMsg = "Message from Client:{}".format(message[9:])
        clientIP  = "Client IP Address:{}".format(address)
        
        print(clientMsg)
        print(clientIP)

        # Sending a reply to client
        UDPServerSocket.sendto(str.encode(data), address)