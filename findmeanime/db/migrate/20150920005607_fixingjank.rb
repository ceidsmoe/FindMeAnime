class Fixingjank < ActiveRecord::Migration
  def change
  end

  def up
    add_column :anime, :image_url, :string
    remove_column :anime, :rating
  end

end
