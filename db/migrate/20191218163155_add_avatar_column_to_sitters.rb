class AddAvatarColumnToSitters < ActiveRecord::Migration[5.0]
  def change
    add_column :sitters, :avatar, :string
  end
end
