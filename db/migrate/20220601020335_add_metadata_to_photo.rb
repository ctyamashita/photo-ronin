class AddMetadataToPhoto < ActiveRecord::Migration[6.1]
  def change
    add_column :photos, :aperture, :float
    add_column :photos, :taken_on, :date
    add_column :photos, :exposure, :string
    add_column :photos, :camera, :string
    add_column :photos, :latitude, :float
    add_column :photos, :longitude, :float
  end
end
