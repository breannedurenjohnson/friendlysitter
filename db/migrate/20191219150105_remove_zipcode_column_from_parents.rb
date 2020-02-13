class RemoveZipcodeColumnFromParents < ActiveRecord::Migration[5.0]
  def change
    remove_column :parents, :zipcode, :string
  end
end
