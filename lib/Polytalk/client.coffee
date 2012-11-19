net = require 'net'

class Client
  constructor: (config) ->
    @port = config.port or 9090
    @host = config.host or '127.0.0.1'

  call: (request, callback) ->
    client = new net.Socket()
    client.connect @port, @host, ->
      client.write JSON.stringify request

    client.on 'data', (data) ->
      callback JSON.parse(data)
    
module.exports = Client