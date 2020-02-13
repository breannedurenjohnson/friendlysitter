class RemoveImageFileSizeAtColumnFromSitters < ActiveRecord::Migration[5.0]
  def change
    remove_column :sitters, :image_file_size, :megabytes
  end
end
