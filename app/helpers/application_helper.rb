module ApplicationHelper
  def markdown(text)
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
    no_intra_emphasis: true,
    fenced_code_blocks: true,
    disable_indented_code_blocks: true,
    autolink: true,
    tables: true,
    underline: true,
    highlight: true
  )
  return markdown.render(text).html_safe
end

def form_group_tag(errors, &block)
  css_class = 'form-group'
  css_class << ' has-error' if errors.any?
  content_tag :div, capture(&block), class: css_class
end

end
