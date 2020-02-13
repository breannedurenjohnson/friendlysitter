class AddCityColumnToParents < ActiveRecord::Migration[5.0]
  def change
    add_column :parents, :city, :string
  end
end
