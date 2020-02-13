class AddCityColumnToSitters < ActiveRecord::Migration[5.0]
  def change
    add_column :sitters, :city, :string
  end
end
