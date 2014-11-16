# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on 'all', @playerEvents, @
    @get('dealerHand').on 'all', @dealerEvents, @

    # @get('playerHand').on 'turnover', =>
    #   console.log('here')


    # #map end function to gamewide method called compute to figure out winner
    # @get('dealerHand').on 'dealerBust', =>
    #   alert('Dealer has bust! You win.')
    #   # how would i signal to view to chagne that class

    # @get('dealerHand').on 'end', =>
    #   @computeWinner()

    # @get('playerHand').on 'playerBust', =>
    #   alert("You busted! You lose this round.")

    # @get('playerHand').on 'blackjack', =>
    #   alert('BlackJack!')
    #   setTimeout @get('dealerHand').hit(), 1000

  playerEvents: (status, currentHand) ->
    if status is 'stand' then @get('dealerHand').playRound()
    if status is 'bust' then @trigger 'win:dealer'

  dealerEvents: (status, currentHand) ->
    if status is 'stand' then @computeWinner()
    if status is 'bust' then @trigger 'win:player'

  computeWinner: ->
    player = @get('playerHand')
    dealer = @get('dealerHand')
    playerScore = player.minScore()
    dealerScore = dealer.minScore()
    if playerScore < dealerScore then @trigger 'win:dealer'
    if playerScore > dealerScore then @trigger 'win:player'
    if playerScore == dealerScore then @trigger 'push'

  reset: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()



