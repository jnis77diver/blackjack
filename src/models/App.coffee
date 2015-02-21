# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on('21', =>
      @get('dealerHand').hit()
      return )
    # @get('playerHand').on('stand', =>
    #   @get('dealerHand').dealerHit()
    #   return )
    @get('playerHand').on('compareScores', =>
      # tempDealerScore = 0
      dealerScore = @get('dealerHand').scores().map(function(a, b) {
        b = b > 21 || b === undefined? 0; b;
        return Math.max(a, b);
      }, 0);
      console.log("dealerScore is ", dealerScore);
      # for i in dealerScore by 1
      #   if dealerScore[i] <= 21 and dealerScore[i] > tempDealerScore
      #     tempDealerScore = dealerScore[i]

      playerScore = @get('playerHand').scores().map(function(a, b) {
        b = b > 21 || b === undefined? 0; b;
        return Math.max(a, b);
      }, 0);
      console.log("playerScore is ", playerScore);
      # tempPlayerScore = 0
      # for i in playerScore by 1
      #   if tempPlayerScore[i] <= 21 and tempPlayerScore[i] > tempPlayerScore
      #     tempPlayerScore = playerScore[i]
      if dealerScore > playerScore then alert("dealer wins")
      if playerScore > dealerScore then alert("You win Charlie")
      return )


#set up a hit method here that listens for 'click'
#call the playerHand.hit()
#perhaps change or add method to check if hit is necessary or if busted

# first we grab playerHand, .on 'something' --> grab dealerHand call hit

