net = require 'net'

class Server
  constructor: (config) ->
    @exposes = config.exposes
    @port = config.port or 9090
    @host = config.host or '127.0.0.1'

  run: (callback) ->
    server = net.createServer()

    server.on 'connection', (connection) ->
      connection.on 'data', (request) ->
        callback(connection, JSON.parse(request))

    server.listen @port, @host

  call: (request, callback) ->
    className = request['class'].replace('::', '.')
    args = for key, value of request.arguments
      value
    response = @exposes[className][request.method].apply(null, args)
    callback(response)

  push: (connection, response) ->
    connection.write(JSON.stringify(response))
    connection.end()
     
module.exports = Server