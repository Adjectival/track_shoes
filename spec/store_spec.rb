require "spec_helper"

describe (Store) do
  describe ('#shoes') do
    it "returns the shoes sold by this store" do
      test_store = Store.create({:name => 'All Boots'})
      test_shoe1 = Shoe.create({:brand => 'Muvo'})
      test_shoe2 = Shoe.create({:brand => 'Jumps'})
      test_store.update({:shoes => [test_shoe1, test_shoe2]})
      expect(test_store.shoes()).to(eq([test_shoe1, test_shoe2]))
    end
  end
  describe (Store) do
    it { should have_and_belong_to_many(:shoes) }
  end

end
