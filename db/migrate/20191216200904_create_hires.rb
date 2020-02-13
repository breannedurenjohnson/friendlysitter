class CreateHires < ActiveRecord::Migration[5.0]
  def change
    create_table :hires do |t|
      t.references :parent, foreign_key: true
      t.references :sitter, foreign_key: true

      t.timestamps
    end
  end
end
