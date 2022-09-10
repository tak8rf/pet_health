class AddPetRefToTasks < ActiveRecord::Migration[6.1]
  def change
    add_reference :tasks, :pet, null: false, foreign_key: true
  end
end
