class ImportJob < ApplicationJob
  queue_as :default

  def perform(import_task_id)
    import_task = ImportTask.find_by(id: import_task_id)
    return unless import_task&.file.attached?

    import_task.update!(status_at: nil)

    require 'csv'
    csv_data = import_task.file.download

    CSV.parse(csv_data, headers: true) do |row|
      Task.create!(
        title: row['title'],
        description: row['description'],
        ends_at: row['ends_at']
      )
    end

    import_task.update!(status_at: Time.current)
  end
end
