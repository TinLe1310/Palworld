class CreatePages < ActiveRecord::Migration[7.1]
  def change
    create_table :pages do |t|
      t.string :title
      t.text :context
      t.string :permalink

      t.timestamps
    end
  end
end
