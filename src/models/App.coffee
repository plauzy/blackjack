# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    @get('playerHand').on 'turnover', =>
      console.log('here')
      dealer = @get 'dealerHand'
      card = dealer.where revealed : false
      if card.length
        card[0].set revealed : true
      else
        if dealer.minScore() < 17
          dealer.hit()

    #map end function to gamewide method called compute to figure out winner
    @get('dealerHand').on 'dealerBust', =>
      alert('Dealer has bust! You win.')
      # how would i signal to view to chagne that class

    @get('dealerHand').on 'end', =>
      @computeWinner()

    @get('playerHand').on 'playerBust', =>
      alert("You busted! You lose this round.")

    @get('playerHand').on 'blackjack', =>
      alert('BlackJack!')
      setTimeout @get('dealerHand').hit(), 1000


  computeWinner: ->
    player = @get('playerHand')
    dealer = @get('dealerHand')
    playerScore = player.minScore()
    dealerScore = dealer.minScore()
    if playerScore < dealerScore then alert ('You lost')
    if playerScore == dealerScore then alert ('You get your chips back')

  reset: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()



