class AddPostIdToSubjects < ActiveRecord::Migration[6.1]
  def change
    add_column :subjects, :post_id, :integer
    add_index :subjects, :post_id
  end
end
