require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :password => "String245",
      :email => "MyString",
      :first_name => "MyString",
      :last_name => "MyString",
      :address_1 => "MyString",
      :address_2 => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip => "MyString",
      :fach_id => 1,
      :admin => false
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input#user_password[name=?]", "user[password]"

      assert_select "input#user_password_confirmation[name=?]", "user[password_confirmation]"

      assert_select "input#user_email[name=?]", "user[email]"

      assert_select "input#user_email_confirmation[name=?]", "user[email_confirmation]"

      assert_select "input#user_first_name[name=?]", "user[first_name]"

      assert_select "input#user_last_name[name=?]", "user[last_name]"

      assert_select "input#user_address_1[name=?]", "user[address_1]"

      assert_select "input#user_address_2[name=?]", "user[address_2]"

      assert_select "input#user_city[name=?]", "user[city]"

      assert_select "select#user_state[name=?]", "user[state]"

      assert_select "input#user_zip[name=?]", "user[zip]"
    end
  end
end
