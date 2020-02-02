class InterviewBot.Views.EnsureBlankRow extends Backbone.View
  @wrapFor: {el: '.js-ensure-blank-row'}

  events:
    'change select': 'onChange'

  onChange: ->
    @render()

  initialize: ->
    @renderBlank = false
    @initializeTemplate()

  initializeTemplate: ->
    t = @lastRow().clone()
    t.find('select option').prop 'selected', false

    _.forEach t.find('select'), (select) ->
      $(select).attr('id', $(select).attr('id').replace(/_\d+_/, '_{{index}}_'))
      $(select).attr('name', $(select).attr('name').replace(/\[\d+\]/, '[{{index}}]'))

    @template = t.prop 'outerHTML'

  blankRow: (index) ->
    row = $(@template)

    _.forEach row.find('select'), (select) ->
      $(select).attr('id', $(select).attr('id').replace('{{index}}', index))
      $(select).attr('name', $(select).attr('name').replace('{{index}}', index))

    row

  lastRow: ->
    @$('tbody tr').last()

  rowEmpty: (row) ->
    _.every row.find('select').map (i, el) -> $(el).val() == ""

  render: ->
    blankRowIndex = @$('tbody tr').length
    @$('tbody').append @blankRow(blankRowIndex) unless @rowEmpty(@lastRow())
