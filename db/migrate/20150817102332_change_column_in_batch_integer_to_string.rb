class ChangeColumnInBatchIntegerToString < ActiveRecord::Migration
  def change

    change_column :batches, :name, :string
    change_column :batches, :description, :string

  end
end
