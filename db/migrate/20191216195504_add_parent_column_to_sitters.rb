class AddParentColumnToSitters < ActiveRecord::Migration[5.0]
  def change
    add_reference :sitters, :parent, foreign_key: true
  end
end
