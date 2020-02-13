class RemoveImageUpdatedAtColumnFromSitters < ActiveRecord::Migration[5.0]
  def change
    remove_column :sitters, :image_updated_at, :datetime
  end
end
