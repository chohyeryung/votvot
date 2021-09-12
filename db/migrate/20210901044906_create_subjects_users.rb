class CreateSubjectsUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :subjects_users do |t|
      t.references :subject, index: {:unique=>true}, null: false, foreign_key: true
      t.references :user, index: {:unique=>true}, null: false, foreign_key: true

      t.timestamps
    end
  end
end
