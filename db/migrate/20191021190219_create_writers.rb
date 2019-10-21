class CreateWriters < ActiveRecord::Migration[6.0]
  def change
    create_table :writers do |t|
      t.string :name
      t.integer :genre_id

      t.timestamps
    end
  end
end
