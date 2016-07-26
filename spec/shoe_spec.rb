require "spec_helper"

describe (Shoe) do
  describe ('#stores') do
    it "returns the stores which sell this shoe" do
      test_shoe = Shoe.create({:brand => 'Muvo'})
      test_store1 = Store.create({:name => 'All Boots'})
      test_store2 = Store.create({:name => 'Best Kicks'})
      test_shoe.update({:stores => [test_store1, test_store2]})
      expect(test_shoe.stores()).to(eq([test_store1, test_store2]))
    end
  end

    it('validates the brand input') do
      test_shoe = Shoe.new({:brand => ''})
      expect(test_shoe.save()).to(eq(false))
    end

  describe (Shoe) do
    it { should have_and_belong_to_many(:stores) }
  end

end
