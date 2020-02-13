class RemoveImageFileNameColumnFromParents < ActiveRecord::Migration[5.0]
  def change
    remove_column :parents, :image_file_name, :string
  end
end
