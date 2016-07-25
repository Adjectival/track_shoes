require "spec_helper"

describe (Shoe) do
  describe ('#stores') do
    it "returns the stores which sell this shoe" do
      test_shoe = Shoe.create({:brand => 'Muvo'})
      test_store = Store.create({:name => 'All Boots'})
      test_store2 = Store.create({:name => 'Best Kicks'})
      expect(test_shoe.stores()).to(eq([test_store, test_store2]))
    end
  end
end

describe (Shoe) do
  it { should have_and_belong_to_many(:stores) }
end
