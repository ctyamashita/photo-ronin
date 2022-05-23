class CreateMetaData < ActiveRecord::Migration[6.1]
  def change
    create_table :meta_data do |t|
      t.integer :aperture
      t.integer :shutter_speed
      t.integer :ISO
      t.date :taken_on
      t.references :photo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
