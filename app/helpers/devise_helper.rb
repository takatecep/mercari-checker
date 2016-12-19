module DeviseHelper
  def devise_error_messages!
    return '' unless devise_error_messages?

    messages = resource.errors.full_messages.map do |msg|
      content_tag(:span, msg, class: 'red-text text-lighten-1')
    end

    html = <<-HTML
    <div id="error_explanation" class="card-panel">
      #{messages.join('<br>')}
    </div>
    HTML

    html.html_safe
  end

  def devise_error_messages?
    !resource.errors.empty?
  end
end
