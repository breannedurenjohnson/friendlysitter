class RemoveZipcodeColumnFromSitters < ActiveRecord::Migration[5.0]
  def change
    remove_column :sitters, :zipcode, :string
  end
end
