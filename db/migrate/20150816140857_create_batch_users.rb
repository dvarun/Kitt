class CreateBatchUsers < ActiveRecord::Migration
  def change
    create_table :batch_users do |t|
      t.integer :user_id
      t.integer :batch_id

      t.timestamps null: false
    end
  end
end
