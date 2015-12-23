module ListingHelper
  def description_html(description)
    array = description.split("\n")
    array.map! {|paragraph| "<div>" + paragraph + "</div>" }
    array.join
  end
end