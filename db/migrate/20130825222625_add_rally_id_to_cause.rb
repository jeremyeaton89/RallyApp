class AddRallyIdToCause < ActiveRecord::Migration
  def change
  	add_column :causes, :rally_id, :string
  end
end
