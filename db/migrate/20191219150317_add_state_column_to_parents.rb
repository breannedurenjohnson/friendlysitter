class AddStateColumnToParents < ActiveRecord::Migration[5.0]
  def change
    add_column :parents, :state, :string
  end
end
