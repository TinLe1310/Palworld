class CreatePalTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :pal_types do |t|
      t.references :pal, null: false, foreign_key: true
      t.references :type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
