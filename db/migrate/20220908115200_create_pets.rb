class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.text :image
      t.text :content
      t.references :family, null: false, foreign_key: true

      t.timestamps
    end
  end
end
