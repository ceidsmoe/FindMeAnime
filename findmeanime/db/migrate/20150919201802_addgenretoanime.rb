class Addgenretoanime < ActiveRecord::Migration
  def change
  end

  def up
    add_column :animes, :genre, :string
  end
end
