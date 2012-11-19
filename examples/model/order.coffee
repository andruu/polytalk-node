class Order
  @findBySize: (size, limit) ->
    orders = [
      {id: 1, name: 'Order 1', size: 'large'}
      {id: 2, name: 'Order 2', size: 'small'}
      {id: 3, name: 'Order 3', size: 'large'}
      {id: 4, name: 'Order 4', size: 'large'}
      {id: 5, name: 'Order 5', size: 'medium'}
      {id: 6, name: 'Order 6', size: 'medium'}
      {id: 7, name: 'Order 7', size: 'small'}
    ]
    ordersBySize = orders.filter (order) ->
      return order if order.size is size
    ordersBySize.slice(0, limit)

module.exports = Order