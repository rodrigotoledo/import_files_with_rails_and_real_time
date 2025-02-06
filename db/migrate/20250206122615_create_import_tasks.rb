class CreateImportTasks < ActiveRecord::Migration[7.2]
  def change
    create_table :import_tasks do |t|
      t.datetime :status_at

      t.timestamps
    end
  end
end
