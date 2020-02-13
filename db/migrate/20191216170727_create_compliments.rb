class CreateCompliments < ActiveRecord::Migration[5.0]
  def change
    create_table :compliments do |t|
      t.string :content
      t.references :parent, foreign_key: true
      t.references :sitter, foreign_key: true

      t.timestamps
    end
  end
end
