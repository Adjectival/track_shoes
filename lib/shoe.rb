class Shoe < ActiveRecord::Base
  has_and_belongs_to_many(:stores)

  validates(:brand, {:presence => true, :length => {:maximum => 60}})

  before_save(:upcase_brand)
   private
    define_method(:upcase_brand) do
      self.brand = (brand.upcase())
    end
end
