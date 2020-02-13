class RemoveParentColumnFromSitters < ActiveRecord::Migration[5.0]
  def change
    remove_reference :sitters, :parent, foreign_key: true
  end
end
