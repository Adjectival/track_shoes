class Shoe < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  before_save(:capitalize_brand)
  validates(:brand, {:presence => true, :length => {:maximum => 60}})

   private
    define_method(:capitalize_brand) do
      self.brand = (brand.downcase.titleize())
    end
end
