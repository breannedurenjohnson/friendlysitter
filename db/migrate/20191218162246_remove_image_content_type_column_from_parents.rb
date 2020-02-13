class RemoveImageContentTypeColumnFromParents < ActiveRecord::Migration[5.0]
  def change
    remove_column :parents, :image_content_type, :string
  end
end
