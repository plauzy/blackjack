assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null
  dealer = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()
    # dealer = deck.dealDealer()

  describe 'hit', ->
    it 'should give the last card from the deck', ->
      assert.strictEqual deck.length, 50
      assert.strictEqual deck.last(), hand.hit()
      assert.strictEqual deck.length, 49

  # describe 'stand', ->
  #   it 'should flip the dealers card', ->
  #     assert.strictEqual deck.length, 50
  #     hand.stand()
  #     dealer.
      # dealer should flip their card
      # assert.strictEqual deck.length, 49
