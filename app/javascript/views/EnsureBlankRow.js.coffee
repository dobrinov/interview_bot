class InterviewBot.Views.EnsureBlankRow extends Backbone.View
  @wrapFor: {el: '.js-ensure-blank-row'}

  events:
    'change select': 'onChange'

  onChange: ->
    @render()

  initialize: ->

  blankRow: ->
    rows = @$('tbody tr')
    index = rows.length
    row = rows.last().clone()
    row.find('select option').prop 'selected', false

    _.forEach row.find('select'), (select) ->
      $(select).attr('id', $(select).attr('id').replace(/_\d+_/, "_#{index}_"))
      $(select).attr('name', $(select).attr('name').replace(/\[\d+\]/, "[#{index}]"))

    row

  lastRowNotEmpty: ->
    !_.every @$('tbody tr').last().find('select').map (i, el) -> $(el).val() == ""

  render: ->
    @$('tbody').append @blankRow() if @lastRowNotEmpty()
