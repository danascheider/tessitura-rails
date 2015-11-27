require 'rails_helper'

RSpec.describe Task, type: :model do
  it { is_expected.to respond_to :title }
  it { is_expected.to respond_to :deadline }
  it { is_expected.to respond_to :status }
  it { is_expected.to respond_to :priority }
  it { is_expected.to respond_to :notes }
  it { is_expected.to respond_to :user_id }

  describe 'validations' do 
    let(:task) { FactoryGirl.create(:task) }

    context 'status' do 
      ['In Progress', 'Blocking', 'Complete'].each do |valid_status|
        it "is valid with status '#{valid_status}'" do 
          task.status = valid_status
          expect(task).to be_valid
        end
      end

      it 'is invalid with other status' do 
        task.status = 'foobar'
        expect(task).not_to be_valid
      end

      it 'can be blank' do 
        task.status = nil 
        expect(task).to be_valid
      end
    end

    context 'priority' do 
      ['Urgent', 'High', 'Normal', 'Low', 'Not Important'].each do |valid_priority|
        it "is valid with priority '#{valid_priority}'" do 
          task.priority = valid_priority
          expect(task).to be_valid
        end
      end

      it 'is invalid with another priority level' do 
        task.priority = 'foobar'
        expect(task).not_to be_valid
      end
    end
  end
end
