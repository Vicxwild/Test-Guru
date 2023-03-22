class AddPublishedAtToTests < ActiveRecord::Migration[6.1]
  def change
        add_column :tests, :published_at, :datetime
  end
end
