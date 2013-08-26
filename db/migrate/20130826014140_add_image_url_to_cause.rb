class AddImageUrlToCause < ActiveRecord::Migration
  def change
  	add_column :causes, :image_url, :string
  end
end
