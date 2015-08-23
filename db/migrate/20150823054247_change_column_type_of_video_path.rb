class ChangeColumnTypeOfVideoPath < ActiveRecord::Migration
  def change
   change_column :videos, :file_path, :string
  end
end
