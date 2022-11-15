class AddTestTitleNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null :tests, :title, false
    change_column_null :tests, :level, false
    change_column_default :tests, :level, 0
    add_reference :tests, :category, foreign_key: true
  end
end
