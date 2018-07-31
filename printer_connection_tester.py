import sys
import socket
nat_ip = raw_input('Enter the printer NAT IP: ')
port_min_value = int(input('Enter the port_min_range: '))
port_max_value = int(input('Enter the port_max_range: '))
new_max_value = port_max_value + 1
filename  = open("connection_test_result.txt",'w')
sys.stdout = filename
for port in range(port_min_value,new_max_value):
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.settimeout(2)
    result = sock.connect_ex((nat_ip, int(port)))
    if result == 0:
        print("Nat IP {0} and port {1} is UP".format(nat_ip,port))
        sock.close()
    else:
        print("Nat IP {0} and port {1} is DOWN".format(nat_ip,port))
        sock.close()
#TotestGit
