module TagHelper
  def tag_class(name)
    case name.downcase
      when "rooftop" then "Rooftop"
      when "industrial" then "Industrial"
      when "modern" then "modern"
      when "traditional" then "traditional"
      when "landscape" then "landscape"
      when "portrait" then "portrait"
    end
  end
end
