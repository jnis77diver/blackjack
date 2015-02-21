class window.HandView extends Backbone.View
  className: 'hand'

  template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)</h2>'

  initialize: ->
    @collection.on 'add remove change', => @render()
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @collection
    @$el.append @collection.map (card, index, array) ->
      #new CardView(model: card).$el
      if index is array.length-1
        new CardView(model: card).$el.fadeIn(1500)
      else
        new CardView(model: card).$el
    @$('.score').text @collection.scores()[0]


#.animate({ "opacity": 0.5, "color": "red"}, 1000)

