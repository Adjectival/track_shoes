class Store < ActiveRecord::Base
  has_and_belongs_to_many(:shoes)
  before_save(:capitalize_name)
  validates(:name, {:presence => true, :length => {:maximum => 120}})

   private
    define_method(:capitalize_name) do
      self.name = (name.downcase.titlecase())
    end
end
