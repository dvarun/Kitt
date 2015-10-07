class AddIsCompleteInBatch < ActiveRecord::Migration
  def change
   add_column :batches,:is_complete,:boolean,default: false
  end
end
