class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop())
    @checkSum()

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]

  checkSum: ->
    # Check the score (see if there is an ace or not)
    # If minscore greater than 21, disable clicks
    if @scores[0] > 21 and @scores[1] > 21 then alert('You Busted!')
    # disable click
    # else if 21
    if @scores[0] is 21 or @scores[1] is 21
      # allow dealer to hit
      window.App.dealerHand.hit()
    # else < 21
      # continue
