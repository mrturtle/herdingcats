class CreateHouseholds < ActiveRecord::Migration
  def change
    create_table :households do |t|
      t.string :street
      t.string :city
      t.string :zip
      t.string :phone
      t.string :email
      t.string :adult_one_firstname
      t.string :adult_one_lastname
      t.string :adult_one_email
      t.string :adult_one_phone
      t.boolean :adult_one_text
      t.string :adult_two_firstname
      t.string :adult_two_lastname
      t.string :adult_two_email
      t.string :adult_two_phone
      t.boolean :adult_two_text

      t.timestamps
    end
  end
end
