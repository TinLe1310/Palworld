class CreatePalDrops < ActiveRecord::Migration[7.1]
  def change
    create_table :pal_drops do |t|
      t.references :pal, null: false, foreign_key: true
      t.references :drop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
