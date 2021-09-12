class CreateSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :subjects do |t|
      t.string :sub_con
      t.integer :votes

      t.timestamps
    end
  end
end
