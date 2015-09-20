class RemoveAnimeranking < ActiveRecord::Migration
  def change
  end

  def up
    remove_column :animes, :rating
  end
end
