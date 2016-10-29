module ApplicationHelper
  def page_title
    title = "CoffeeDiary"
    title = @page_title + "-" + title title if @page_title
    title
  end
end
