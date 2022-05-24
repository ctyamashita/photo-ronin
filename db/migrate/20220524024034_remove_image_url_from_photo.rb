class RemoveImageUrlFromPhoto < ActiveRecord::Migration[6.1]
  def change
    remove_column :photos, :image_url
  end
end
