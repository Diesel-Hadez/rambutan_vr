module ApplicationHelper
  def full_title(page_title= '')
    if page_title.blank?
      base_title = "RambutanVR"
    else
      page_title + ' | ' + base_title
    end
  end
end
