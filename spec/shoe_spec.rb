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

  describe ('#upcase_brand') do
    it "capitalizes the first letter of the shoe brand automatically" do
      test_brand = Store.create({name: 'gems'})
      expect(test_brand.name).to eq('Gems')
    end
  end

describe (Shoe) do
  it { should have_and_belong_to_many(:stores) }
end
