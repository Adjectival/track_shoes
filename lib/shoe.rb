class Shoe < ActiveRecord::Base
  has_and_belongs_to_many(:stores)

  validates(:brand, {:presence => true, :length => {:maximum => 60}})

  before_save(:titlecase_name)
   private
    define_method(:titlecase_name) do
      self.brand = (brand.titlecase())
    end
end
