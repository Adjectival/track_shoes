class CreateShoes < ActiveRecord::Migration
  def change
    create_table(:shoes) do |t|
      t.column(:brand, :string)
    end
  end
end
