class AddPasswordConfirmationColumnToParents < ActiveRecord::Migration[5.0]
  def change
    add_column :parents, :password_confirmation, :string
  end
end
