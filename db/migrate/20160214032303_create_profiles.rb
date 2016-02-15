class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :firstname
      t.string :lastname
      t.string :jobtitle
      t.date :dob
      t.date :hired
      t.date :terminated
      t.string :workphone
      t.string :homephone
      t.string :email
      t.text :comments

      t.timestamps null: false
    end
  end
end
