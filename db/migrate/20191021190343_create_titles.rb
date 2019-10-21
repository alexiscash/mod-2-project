class CreateTitles < ActiveRecord::Migration[6.0]
  def change
    create_table :titles do |t|
      t.string :name
      t.text :description
      t.string :quote
      t.string :character
      t.integer :writer_id

      t.timestamps
    end
  end
end
