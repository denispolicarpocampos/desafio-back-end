class CreateTransactionValues < ActiveRecord::Migration[5.2]
  def change
    create_table :transaction_values do |t|
      t.datetime :date_occurrency, null: false
      t.decimal :value, null: false, precision: 15, scale: 2
      t.string :cpf, null: false
      t.string :card, null: false
      t.string :owner, null: false
      t.string :name, null: false
      t.references :user, foreign_key: true, null: false
      t.references :kind_transaction, foreign_key: true, null: false

      t.timestamps
    end
  end
end
