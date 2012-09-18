module ApplicationHelper
  # Gibt des vollständigen Titel zurück
  def full_title(page_title)
    base_title = "RailsCalendar"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end
