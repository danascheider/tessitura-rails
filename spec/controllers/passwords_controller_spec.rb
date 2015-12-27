require 'rails_helper'

RSpec.describe Users::PasswordsController, type: :controller do 
  include Devise::TestHelpers

  describe 'POST#create' do 
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
    end

    it "sends reset instructions" do 
      allow_any_instance_of(Devise::PasswordsController).to receive(:successfully_sent?)
      expect(User).to receive(:send_reset_password_instructions)
      post :create
    end

    context "reset e-mail sent" do 
      it "renders the :new template" do 
        allow_any_instance_of(Devise::PasswordsController).to receive(:successfully_sent?).and_return(true)
        allow(User).to receive(:send_reset_password_instructions)
        post :create
        expect(response).to render_template :new
      end
    end

    context "reset e-mail not sent" do 
      it "renders the :new template" do 
        allow_any_instance_of(Devise::PasswordsController).to receive(:successfully_sent?).and_return(false)
        allow(User).to receive(:send_reset_password_instructions)
        post :create
        expect(response).to render_template(:new)
      end
    end
  end
end