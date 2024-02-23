"""Module for a basic client using sockets."""

import socket
from time import time
try:
    from basic.payload import builder
except ImportError:
    # Handle the error or provide a mock for demonstration
    pass

class BasicClient:
    """A simple client for communicating over sockets."""

    def __init__(self, name, ipaddr="127.0.0.1", port=2000):
        """Initialize the client with name, IP address, and port."""
        if not ipaddr:
            raise ValueError("IP address is missing or empty")
        if not port:
            raise ValueError("Port number is missing")

        self._clt = None
        self.name = name
        self.ipaddr = ipaddr
        self.port = port
        self.group = "public"
        self.connect()

    def __del__(self):
        """Ensure socket is closed when instance is deleted."""
        self.stop()

    def stop(self):
        """Stop the client by closing its socket."""
        if self._clt is not None:
            self._clt.close()
        self._clt = None

    def connect(self):
        """Connect the client to the server."""
        if self._clt is not None:
            return

        addr = (self.ipaddr, self.port)
        self._clt = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        try:
            self._clt.connect(addr)
        except ConnectionRefusedError:
            print("Connection failed - is the server running?")
        except socket.error as e:
            print(f"Socket error: {e}")
            self._clt = None


    def join(self, group):
        """Join a specific group."""
        self.group = group

    def send_msg(self, text):
        """Send a message to the server."""
        if self._clt is None:
            print("Failed to send message: No connection to server exists")
            self.stop()  # Close the socket if no connection exists
            return

        print(f"sending to group {self.group} from {self.name}: {text}")
        bldr = builder.BasicBuilder()
        message = bldr.encode(self.name, self.group, text)
        try:
            self._clt.send(bytes(message, "utf-8"))
            return True
        except (ConnectionResetError, ConnectionAbortedError, socket.error) as e:
            print(f"Connection error occurred: {e}")
            self.stop()
            return False
if __name__ == '__main__':
    clt = BasicClient("Charan", "127.0.0.1", 2000)
    while True:
        m = input("Enter message: ")
        if m in ('', 'exit'):
            break
        total_requests = int(input("enter number of times: "))
        success = 0
        failed = 0
        timestart = time()
        total = 2000 if total<0 or total <2000 else total
        for i in range(total):
            if clt.send_msg(m):
                success += 1
            else:
                failed += 1
        timeend = time()

        print("Successful Requests:", successful_requests)
        print("Failed Requests:", failed_requests)
        print("Throughput:", successful_requests / (timeend - timestart), "requests per second")
        print("Latency",(timeend - timestart)/total_requests)