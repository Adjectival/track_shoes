class Shoe < ActiveRecord::Base
  has_and_belongs_to_many(:store)

  validates(:name, {:presence => true, :length => {:maximum => 60}})

  before_save(:upcase_name)
   private
    define_method(:upcase_name) do
      self.name=(name().upcase())
    end
end
