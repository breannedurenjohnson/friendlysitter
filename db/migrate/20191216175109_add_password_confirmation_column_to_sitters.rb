class AddPasswordConfirmationColumnToSitters < ActiveRecord::Migration[5.0]
  def change
    add_column :sitters, :password_confirmation, :string
  end
end
