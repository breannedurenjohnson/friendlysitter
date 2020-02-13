class CreateSitters < ActiveRecord::Migration[5.0]
  def change
    create_table :sitters do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :zipcode
      t.attachment :image
      t.string :about
      t.integer :hourly_rate

      t.timestamps
    end
  end
end
