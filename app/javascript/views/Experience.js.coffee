class InterviewBot.Views.Experience extends Backbone.View
  @wrapFor: {el: '.js-experience'}

  events:
    'change .js-level': 'onLevelChange'
    'change .js-number-of-projects': 'onNumberOfProjectsChange'
    'change .js-total-experience': 'onTotalExperienceChange'

  onLevelChange: ->
    @level = @levelSelect.val()
    if @level == '0'
      @numberOfProjects = 'no experience'
      @totalExperience = 'no experience'

    @render()

  onNumberOfProjectsChange: ->
    @numberOfProjects = @numberOfProjectsSelect.val()

    if @numberOfProjects == 'no experience'
      @level = '0'
      @totalExperience = 'no experience'

    @render()

  onTotalExperienceChange: ->
    @totalExperience = @totalExperienceSelect.val()

    if @totalExperience == 'no experience'
      @level = '0'
      @numberOfProjects = 'no experience'

    @render()

  initialize: ->
    @levelSelect = @$('.js-level')
    @numberOfProjectsSelect = @$('.js-number-of-projects')
    @totalExperienceSelect = @$('.js-total-experience')

    @level = @levelSelect.val()
    @numberOfProjects = @numberOfProjectsSelect.val()
    @totalExperience = @totalExperienceSelect.val()

  render: ->
    @levelSelect.val(@level)
    @numberOfProjectsSelect.val @numberOfProjects
    @totalExperienceSelect.val @totalExperience
