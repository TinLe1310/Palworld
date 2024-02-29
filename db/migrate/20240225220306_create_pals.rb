class CreatePals < ActiveRecord::Migration[7.1]
  def change
    create_table :pals do |t|
      t.string :name
      t.string :title
      t.string :skill
      t.integer :hp
      t.integer :attack
      t.integer :speed
      t.integer :rarity
      t.references :region, null: false, foreign_key: true

      t.timestamps
    end
  end
end
