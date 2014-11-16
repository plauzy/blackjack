class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    return if @scores()[0] >= 21
    card = @deck.pop()
    @add(card)
    card

  stand: ->
    if !@isDealer and @minScore() < 21 then @trigger 'turnover'

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: ->     @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    if @isDealer
      if @minScore() >= 17 and @minScore() <= 21 then @trigger 'end'
      if @minScore() >= 21 then @trigger 'dealerBust'

    if !@isDealer
      if @minScore() == 21 then @trigger 'blackjack'
      if @minScore() > 21 then @trigger 'playerBust'


    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]


