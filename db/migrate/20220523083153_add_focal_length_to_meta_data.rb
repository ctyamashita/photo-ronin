class AddFocalLengthToMetaData < ActiveRecord::Migration[6.1]
  def change
    add_column :meta_data, :focal_length, :integer
  end
end
