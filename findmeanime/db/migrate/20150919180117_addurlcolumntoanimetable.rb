class Addurlcolumntoanimetable < ActiveRecord::Migration
  def change
  end

  def up
    add_column :animes, :image_url, :string
  end
end
