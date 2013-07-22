module ApplicationHelper
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "Q_Plus_A").join(" - ")
      end
    end
  end
end
