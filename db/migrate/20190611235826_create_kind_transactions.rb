class CreateKindTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :kind_transactions do |t|
      t.string :description, null: false
      t.integer :nature, null: false
      t.integer :signal, null: false

      t.timestamps
    end
  end
end
