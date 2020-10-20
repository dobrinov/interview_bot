module ApplicationHelper
  def flash_notification
    if flash[:error]
      content_tag :div, flash[:error], class: 'alert alert-danger'
    elsif flash[:notice]
      content_tag :div, flash[:notice], class: 'alert alert-success'
    end
  end
end
