class DeleteBrandFromShoes < ActiveRecord::Migration
  def change
    remove_column(:shoes, :brand, :string)
  end
end
