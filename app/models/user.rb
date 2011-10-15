class User < ActiveRecord::Base
  
  has_one :score
  accepts_nested_attributes_for :score
  alias score_attributes :score
  
  def to_xml(options ={})
    super(options.merge({:methods => :score_attributes}))
  end
  
end
