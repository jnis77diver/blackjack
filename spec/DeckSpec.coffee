assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'hit', ->
    it 'should give the last card from the deck', ->
      assert.strictEqual deck.length, 50 #this should be 48 right? 52 - 2 for each dealer and player
      assert.strictEqual deck.last(), hand.hit()
      assert.strictEqual deck.length, 49
