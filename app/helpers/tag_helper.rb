module TagHelper
  def tag_class(name)
    case name.downcase
      when "city" then "fas fa-city"
      when "nature" then "fas fa-tree"
      when "modern" then "fa fa-globe"
      when "traditional" then "fas fa-torii-gate"
      when "landscape" then "fas fa-image"
      when "portrait" then "fas fa-camera"
    end
  end
end
