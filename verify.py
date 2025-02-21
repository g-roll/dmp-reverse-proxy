from http.server import HTTPServer, BaseHTTPRequestHandler
import socket
from urllib.parse import parse_qs, urlparse
import os

EXPECTED_IP = os.getenv('EXPECTED_IP')

class VerifyHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        try:
            query = parse_qs(urlparse(self.path).query)
            domain = query.get('domain', [None])[0]
            
            if not domain:
                self.send_response(400)
                self.end_headers()
                return

            ip = socket.gethostbyname(domain)
            
            if ip == EXPECTED_IP:
                self.send_response(200)
            else:
                self.send_response(403)
                
        except Exception:
            self.send_response(400)
            
        self.end_headers()

server = HTTPServer(('0.0.0.0', 5000), VerifyHandler)
server.serve_forever() 