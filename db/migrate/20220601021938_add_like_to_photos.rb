class AddLikeToPhotos < ActiveRecord::Migration[6.1]
  def change
    add_column :photos, :like, :boolean
  end
end
