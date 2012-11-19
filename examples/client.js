var Polytalk = require('../index');

var request = {
    class: 'Model::Order',
    method: 'findBySize',
    arguments: {
      size: 'large',
      limit: 3
    }
}

var request2 = {
    class: 'Test',
    method: 'add',
    arguments: {
      a: 2,
      b: 3
    }
}

var request3 = {
    class: 'Test',
    method: 'shout',
    arguments: {
      words: 'hello how are you doing?'
    }
}

var client = new Polytalk.Client({ port: 9090 });

client.call(request, function (response) {
  console.log(response);
});

client.call(request2, function (response) {
  console.log(response);
});

client.call(request3, function (response) {
  console.log(response);
});