class CreateInformation < ActiveRecord::Migration[6.0]
  def change
    create_table :information do |t|
      t.bigint :telephone
      t.text :address
      t.string :email

      t.timestamps
    end
  end
end
