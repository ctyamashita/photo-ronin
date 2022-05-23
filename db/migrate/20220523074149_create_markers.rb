class CreateMarkers < ActiveRecord::Migration[6.1]
  def change
    create_table :markers do |t|
      t.references  :place
      t.references  :list

      t.timestamps
    end
  end
end
