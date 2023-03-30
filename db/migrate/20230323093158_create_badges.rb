class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false, unique: true
      t.string :picture_link, null: false
      t.string :description, null: false
      t.string :rule_type, null: false
      t.string :param

      t.timestamps
    end
  end
end
