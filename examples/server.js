var Server = require('../lib/Polytalk/server');

var exposes = {};
exposes['Model.Order'] = require('./model/order');

var Test = {};

Test.add = function (a, b) {
  return a + b;
}

Test.shout = function (words) {
  return (words + '').toUpperCase();
}

exposes['Test'] = Test;

var server = new Server({ port: 9090, exposes: exposes });

server.run(function(connection, request) {
  server.call(request, function (response) {
    server.push(connection, response);
  });
});