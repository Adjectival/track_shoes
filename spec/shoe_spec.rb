require "spec_helper"

describe (Shoe) do
  it { should have_and_belong_to_many(:stores) }

    it('validates the brand input') do
      test_shoe = Shoe.new({:brand => ''})
      expect(test_shoe.save()).to(eq(false))
    end

    it('capitalizes brand') do
      test_shoe = Shoe.create({:brand => 'stabby lambdas'})
      expect(test_shoe.brand).to(eq('Stabby Lambdas'))
    end


end
