# spec/models/task_spec.rb
require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'callbacks' do
    xit 'broadcasts update to total_of_tasks after create' do
      expect {
        Task.create!(title: 'New Task', description: 'Task description')
      }.to have_broadcast_to('total_of_tasks')
    end
  end
end
