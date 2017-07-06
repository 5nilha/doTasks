class AddImageUrlToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :image_url, :string
  end
end
