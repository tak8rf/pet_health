class AddColumnTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :is_done, :boolean, default: false, null: false
    add_column :tasks, :mailer, :boolean, default: false, null: false
  end
end
