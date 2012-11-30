Polytalk = require '../index'

exposes = {}
exposes['Model.Order'] = require './model/order'

class Test
  @add: (a, b) ->
    a + b
  @shout: (words) ->
    (words + '').toUpperCase()

exposes['Test'] = Test

server = new Polytalk.Server port: 9090, exposes: exposes
console.log "Node Coffee Server running on port 9090. PID=#{process.pid}"
server.run (connection, request) ->
  server.call request, (response) ->
    server.push(connection, response)