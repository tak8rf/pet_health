class AddColumnHealths < ActiveRecord::Migration[6.1]
  def change
    add_column :healths, :start_time, :datetime, null: false
  end
end
