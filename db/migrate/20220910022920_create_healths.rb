class CreateHealths < ActiveRecord::Migration[6.1]
  def change
    create_table :healths do |t|
      t.references :user, null: false, foreign_key: true
      t.references :pet, null: false, foreign_key: true
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
