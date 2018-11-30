App.products = App.cable.subscriptions.create "ProductsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log('connected')

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    console.log 'testnig'
    document.getElementsByTagName('body')[0].innerHTML = data.html
    console.log('updated!');
