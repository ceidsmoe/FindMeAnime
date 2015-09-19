class CreateAnimes < ActiveRecord::Migration
  def change
    create_table :animes do |t|
      t.string :title
      t.text :synopsis
      t.integer :episodes
      t.float :rating

      t.timestamps null: false
    end
  end
end
