require "spec_helper"

describe (Store) do
  it { should have_and_belong_to_many(:shoes) }

    it('validates the name input') do
      test_store = Store.new({:name => ''})
      expect(test_store.save()).to(eq(false))
    end

    it('capitalizes name') do
      test_store = Store.create({:name => 'deuces'})
      expect(test_store.name).to(eq('Deuces'))
    end


end
