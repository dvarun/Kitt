class AddVideoCodeInVideoTable < ActiveRecord::Migration
  def change
   add_column :videos, :video_code, :string
  end
end
