class ChangeUrlOnPictureLinkAttributeInBadges < ActiveRecord::Migration[6.1]
  def change
    rename_column :badges, :url, :picture_link
  end
end
