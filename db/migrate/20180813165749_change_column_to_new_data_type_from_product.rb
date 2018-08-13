class ChangeColumnToNewDataTypeFromProduct < ActiveRecord::Migration[5.2]
  def change
  	change_column :products, :price, 'integer USING price::integer'
  end
end
