module ApplicationHelper
  def page_title
    title = "CoffeeDiary"
    title = @page_title + "-" + title if @page_title
    title
  end

  def menu_link_to(text, path)
    link_to_unless_current(text, path) { content_tag(:span, text) }
  end

  def entry_image_tag(entry, options = {})#picture
    if entry.image.present?
      path = entry_path(entry, format: entry.image.extension)
      link_to(image_tag(path, {alt: entry.name }.merge(option)), path)
    else
      ""
    end
  end
end
