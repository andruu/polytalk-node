# Polytalk

Polytalk is a simple protocol which allows communication between different languages via TCP.

Polytalk currently supports PHP, Node.js and Ruby.

## Protocol

The protocol is a simple language agnostic JSON object containing the class, method and arguments. It will then return an response as either a string or JSON object.

Key          | Value
------------ | ------------- 
class        | The class to call the method on. Namespaced classes require the `::` separator.
method       | The method you want to call.
arguments    | The arguments to inject into the method in key value pairs.

## Installation

via npm:

```shell
$ npm install polytalk
```
    
## Server Example

Be sure that any classes you want to be exposed by the server to the client are exposed to the the servers constructor.

### JavaScript

```javascript
var Polytalk = require('polytalk');

var exposes = {};
exposes['Model.Order'] = require('./model/order');

var server = new Polytalk.Server({ port: 9090, exposes: exposes });

server.run(function(connection, request) {
  server.call(request, function (response) {
    server.push(connection, response);
  });
});
```

### Coffeescript

```coffeescript
Polytalk = require 'polytalk'

exposes = {}
exposes['Model.Order'] = require './model/order'

server = new Polytalk.Server port: 9090, exposes: exposes

server.run (connection, request) ->
  server.call request, (response) ->
    server.push(connection, response)
```

## Client Example

### JavaScript
  
```javascript
var Polytalk = require('polytalk');

var request = {
    class: 'Model::Order',
    method: 'findBySize',
    arguments: {
      size: 'large',
      limit: 3
    }
}

var client = new Polytalk.Client({ port: 9090 });

client.call(request, function (response) {
  console.log(response);
});
```

### Coffeescript

```coffeescript
Polytalk = require 'polytalk'

request = 
  class: 'Model::Order'
  method: 'findBySize'
  arguments:
    size: 'large'
    limit: 3

client = new Polytalk.Client port: 9090

client.call request, (response) ->
  console.log response
```

### License

MIT, see LICENSE.