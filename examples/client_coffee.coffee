Client = require '../lib/Polytalk/client'

request = 
  class: 'Model::Order'
  method: 'findBySize'
  arguments:
    size: 'large'
    limit: 3

request2 = 
  class: 'Test'
  method: 'add'
  arguments:
    a: 2
    b: 3

request3 = 
  class: 'Test'
  method: 'shout'
  arguments:
    words: 'how are you doing today?'

client = new Client port: 9090

client.call request, (response) ->
  console.log response

client.call request2, (response) ->
  console.log response

client.call request3, (response) ->
  console.log response