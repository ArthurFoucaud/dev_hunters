class AddAddressAndPriceToDevs < ActiveRecord::Migration[7.0]
  def change
    add_column :devs, :address, :string
    add_column :devs, :price, :float
  end
end
