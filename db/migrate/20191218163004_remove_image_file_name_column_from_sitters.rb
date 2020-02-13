class RemoveImageFileNameColumnFromSitters < ActiveRecord::Migration[5.0]
  def change
    remove_column :sitters, :image_file_name, :string
  end
end
