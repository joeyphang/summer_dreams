class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
    	t.belongs_to :user, index: true
    	t.string :title
    	t.string :description
    	t.string :price
    	t.json :avatar

      t.timestamps
    end
  end
end
