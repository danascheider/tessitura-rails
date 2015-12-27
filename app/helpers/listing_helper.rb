module ListingHelper
  def description_html(description)
    array = description.split("\n")
    array.map! {|paragraph| "<div>" + paragraph + "</div>" }
    array.join
  end

  def truncated_title(title, chars)
    return title if title.length <= chars
    
    ending = ' ...'
    array = title[0..chars - (ending.length + 1)].split(' ')
    array.pop
    array.join(' ') + ending
  end

  def user_is_eligible(user, listing)
    true unless !user.admin? && user_is_wrong_age(user, listing)
  end

  def user_is_wrong_age(user, listing)
    user_is_too_young(user, listing) || user_is_too_old(user, listing)
  end

  def user_is_too_young(user, listing)
    user.age && listing.minimum_age && user.age < listing.minimum_age
  end

  def user_is_too_old(user, listing)
    user.age && listing.maximum_age && user.age > listing.maximum_age
  end
end