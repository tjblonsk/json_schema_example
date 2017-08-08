class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :name
      t.string :title
      t.integer :length

      t.timestamps
    end
  end
end
