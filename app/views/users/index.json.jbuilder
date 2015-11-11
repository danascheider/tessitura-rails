json.array!(@users) do |user|
  json.extract! user, :id, :username, :password_digest, :email, :first_name, :last_name, :birthdate, :address_1, :address_2, :city, :state, :zip, :fach_id, :admin
  json.url user_url(user, format: :json)
end
