window.Backbone = require 'backbone'

window.InterviewBot =
  Views: {}

  initialize: ->
    InterviewBot.initializeElement document

    InterviewBot.BootstrapTooltips.initialize document

  initializeElement: (element) ->
    @initializeViews(element)

  initializeViews: (element) ->
    @forEachWrapFor element, InterviewBot.Views, (key, element, view) ->
      options = {}
      options[key] = element
      new view(options).render()

  forEachWrapFor: (element, namespace, iterator) ->
    for name, object of namespace when object.wrapFor
      unless _.keys(object.wrapFor).length is 1
        throw new Error("#{name}.wrapFor should have exactly one key")

      [name, selector] = _.toPairs(object.wrapFor)[0]

      element = $(element)
      elements = element.find(selector)
      elements = elements.add(element) if element.is(selector)

      elements.each ->
        iterator name, this, object

requireTree = (r) -> r.keys().forEach(r)
requireTree require.context('modules', true)
requireTree require.context('views', true)

$(document).ready ->
  InterviewBot.initialize()
