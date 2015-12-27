require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :password => "String256",
      :email => "user@example.com",
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

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

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
