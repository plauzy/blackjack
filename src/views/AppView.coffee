class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button> <button class="round-button">Play Again</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @model.get('playerHand').stand()
    'click .round-button': ->
      @model.reset()
      @render()

  initialize: ->
    @model.on 'all', @updateGameStatus, @
    @render()

  # disable: ->
  #   debugger

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

  updateGameStatus: (status) ->
    if status is 'win:player' then alert('You won!')
    if status is 'win:dealer' then alert('Dealer won.')
    if status is 'push' then alert('push)')
