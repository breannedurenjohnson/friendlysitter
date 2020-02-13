class RemoveImageContentTypeColumnFromSitters < ActiveRecord::Migration[5.0]
  def change
    remove_column :sitters, :image_content_type, :string
  end
end
