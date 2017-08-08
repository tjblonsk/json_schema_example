class AddNullConstraintToComment < ActiveRecord::Migration[5.0]
  def change
    change_column_null(:comments, :title, false)
  end
end
