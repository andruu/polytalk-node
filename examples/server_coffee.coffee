Server = require '../lib/Polytalk/server'

exposes = {}
exposes['Model.Order'] = require './model/order'

class Test
  @add: (a, b) ->
    a + b
  @shout: (words) ->
    (words + '').toUpperCase()

exposes['Test'] = Test

server = new Server port: 9090, exposes: exposes

server.run (connection, request) ->
  server.call request, (response) ->
    server.push(connection, response)