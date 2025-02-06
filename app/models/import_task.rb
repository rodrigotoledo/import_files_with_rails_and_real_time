class ImportTask < ApplicationRecord
  has_one_attached :file

  after_commit :enqueue_import_job, on: :create

  private

  def enqueue_import_job
    ImportJob.perform_later(self.id)
  end
end
