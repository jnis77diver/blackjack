class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop()) #what exactly does add do here? I see, sends out a trigger that is received by handView
    @checkSum()
    console.log @scores()

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
    if @scores()[0] > 21 and @scores()[1] > 21
      delay = (ms, func) -> setTimeout func, ms
      delay 500, -> alert('You Busted!')
    # disable click
    # else if 21
    if @scores()[0] is 21 or @scores()[1] is 21
      # allow dealer to hit
      @trigger('21', @) #this is undefined for some reason and not calling .hit()
    # else < 21
      # continue

  stand: ->
    #flip card
    @trigger('compareScores', @)
    # @trigger('stand', @)

  dealerHit: ->
    #check dealer score
    tempScores = @scores()
    #if score > 21 alert dealer busts
    if tempScores[0] > 21 and tempScores[1] > 21 then alert('Dealer Busted!')
    # if one of the scores is 21 alert(dealer wins or ties)
    if tempScores[0] is 21 or tempScores[1] is 21
      @trigger('compareScores', @)
    #if 17 < score dealer holds
    if tempScores[0] >= 17 or tempScores[1] >= 17
      # score comparison
      @trigger('compareScores', @)
    # if 17 > score dealer hits
    if tempScores[0] < 17 and tempScores[1] < 17
      # call stand
      @hit()



