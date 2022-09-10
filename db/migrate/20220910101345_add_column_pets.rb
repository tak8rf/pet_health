class AddColumnPets < ActiveRecord::Migration[6.1]
  def change
    add_column :pets, :birthday, :date, null: false
  end
end
