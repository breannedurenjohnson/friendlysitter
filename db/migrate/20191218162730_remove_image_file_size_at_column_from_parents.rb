class RemoveImageFileSizeAtColumnFromParents < ActiveRecord::Migration[5.0]
  def change
    remove_column :parents, :image_file_size, :megabytes
  end
end
