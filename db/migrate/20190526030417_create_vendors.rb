class CreateVendors < ActiveRecord::Migration[5.2]
  def change
    create_table :vendors do |t|
      t.string :name
      t.decimal :cnpj
      t.string :description
      t.string :cep

      t.timestamps
    end
  end
end
