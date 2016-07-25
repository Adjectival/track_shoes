class AddNameToShoes < ActiveRecord::Migration
  def change
    add_column(:shoes, :name, :string)
  end
end
