class AddStateColumnToSitters < ActiveRecord::Migration[5.0]
  def change
    add_column :sitters, :state, :string
  end
end
