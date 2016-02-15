class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :profile, index: true, foreign_key: true
      t.references :stock, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
