var Polytalk = require('../index');

var exposes = {};
exposes['Model.Order'] = require('./model/order');

var Test = {};

Test.add = function (a, b) {
  return a + b;
};

Test.shout = function (words) {
  return (words + '').toUpperCase();
};

exposes['Test'] = Test;

var server = new Polytalk.Server({ port: 9090, exposes: exposes });
console.log("Node Server running on port 9090. PID=" + process.pid);
server.run(function(connection, request) {
  server.call(request, function (response) {
    server.push(connection, response);
  });
});