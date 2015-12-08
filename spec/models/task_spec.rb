require 'rails_helper'

RSpec.describe Task, type: :model do
  it { is_expected.to respond_to :title }
  it { is_expected.to respond_to :deadline }
  it { is_expected.to respond_to :status }
  it { is_expected.to respond_to :priority }
  it { is_expected.to respond_to :notes }
  it { is_expected.to respond_to :user_id }
  it { is_expected.to respond_to :display_deadline }
  it { is_expected.to respond_to :short_title }

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

    context 'title' do 
      it 'is invalid without a title' do 
        task.title = nil
        expect(task).not_to be_valid
      end
    end
  end

  describe 'display_deadline' do 
    context 'when the deadline is present' do 
      it 'returns the date in human readable form' do 
        task = FactoryGirl.create(:task, deadline: '2015-10-22 18:12:00')
        expect(task.display_deadline).to eql 'Thursday, October 22, 2015'
      end
    end

    context 'when the task has no deadline' do 
      it 'returns nil' do 
        task = FactoryGirl.create(:task, deadline: nil)
        expect(task.display_deadline).to eql nil
      end
    end
  end

  describe 'short_title' do 
    it 'cuts off at the end of the nearest word' do 
      task = FactoryGirl.create(:task, title: 'Find out how much wood a woodchuck would chuck if a woodchuck could chuck wood')
      expect(task.short_title(60)).to eql 'Find out how much wood a woodchuck would chuck if a ...'
    end
  end
end
