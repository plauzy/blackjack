# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    # @get 'dealerHand'.on 'flip' ->
    #   @set
    # @set 'game', game = new Game()

    @get('playerHand').on 'flip', =>
      # remove the covered class from the card
      dealer = @get 'dealerHand'
      card = dealer.where revealed : false
      card[0].set revealed : true

