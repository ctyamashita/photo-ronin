module TagHelper
  def tag_class(name)
    case name.downcase
      when "urban" then "fas fa-city"
      when "nature" then "fas fa-tree"
      when "modern" then "fa fa-globe"
      when "traditional" then "fab fa-fort-awesome"
      when "day" then "fas fa-sun"
      when "night" then "fas fa-moon"
    else
      "fas fa-star"
    end
  end
end
