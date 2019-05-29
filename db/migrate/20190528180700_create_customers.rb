class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.decimal :cpf
      t.string :address
      t.decimal :cep
      t.string :name
      t.string :lastName
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
