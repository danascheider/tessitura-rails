require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  let(:user) { FactoryGirl.create(:user) }

  before(:each) do 
    UserMailer.deliveries = []
    ActionMailer::Base.perform_deliveries = true
    UserMailer.confirmation_instructions(user, 'foobar').deliver_now
  end

  after(:each) do 
    UserMailer.deliveries.clear
  end

  it 'sends an e-mail' do 
    pending 'TODO: Determine whether and why the mailer is delivering the email twice'
    expect(UserMailer.deliveries.count).to eql 1
  end

  it 'uses the user\'s e-mail address' do 
    expect(ActionMailer::Base.deliveries.last.to).to eql [user.email]
  end

  it 'has the correct subject line' do
    expect(ActionMailer::Base.deliveries.last.subject).to eql 'Tessitura e-mail verification'
  end
end
