class AddContactRefToInformation < ActiveRecord::Migration[6.0]
  def change
    add_reference :information, :contact, null: false, foreign_key: true
  end
end
