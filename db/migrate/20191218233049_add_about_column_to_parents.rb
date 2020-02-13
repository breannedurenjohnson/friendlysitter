class AddAboutColumnToParents < ActiveRecord::Migration[5.0]
  def change
    add_column :parents, :about, :string
  end
end
