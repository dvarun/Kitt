class ChangeColumnNameInComment < ActiveRecord::Migration
  def change
   rename_column :comments,:Comments_tittle,:title
   rename_column :comments,:comments_body,:description
  end
end
