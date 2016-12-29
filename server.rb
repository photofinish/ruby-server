require 'socket'
require 'pry'



module Mo
  class Server
    def parse request
      headers, body = request.split /\r\n\r\n/
      
      binding.pry
    end
    def initialize(host, port)
      server = TCPServer.open host,port
      loop do
        Thread.start(server.accept) do |client|
          puts "http-start"
          request =  client.recv 65535
          parse request
          puts "http-end"
          client.puts "hi"
          client.close
        end
      end
    end
  end
end
Mo::Server.new '127.0.0.1', 3000

