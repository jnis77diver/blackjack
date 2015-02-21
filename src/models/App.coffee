# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

#set up a hit method here that listens for 'click'
#call the playerHand.hit()
#perhaps change or add method to check if hit is necessary or if busted
