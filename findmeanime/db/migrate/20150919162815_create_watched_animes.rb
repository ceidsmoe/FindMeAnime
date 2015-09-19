class CreateWatchedAnimes < ActiveRecord::Migration
  def change
    create_table :watched_animes do |t|
      t.integer :rank
      t.references :user, index: true, foreign_key: true
      t.references :anime, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
