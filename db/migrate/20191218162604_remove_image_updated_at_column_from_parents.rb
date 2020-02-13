class RemoveImageUpdatedAtColumnFromParents < ActiveRecord::Migration[5.0]
  def change
    remove_column :parents, :image_updated_at, :datetime
  end
end
