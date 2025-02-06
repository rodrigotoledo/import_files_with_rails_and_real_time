class Task < ApplicationRecord
  after_create :sync_without_refresh

  def sync_without_refresh
    Turbo::StreamsChannel.broadcast_update_to(
      "total_of_tasks",
      target: "total_of_tasks",
      partial: "tasks/total_of_tasks"
    )
  end
end
