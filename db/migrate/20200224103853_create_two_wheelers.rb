class CreateTwoWheelers < ActiveRecord::Migration[5.2]
  def change
    create_table :two_wheelers do |t|
      t.string :title
      t.text :description
      t.text :specification
      t.string :price
      t.attachment :image 
      t.timestamps
    end
  end
end
