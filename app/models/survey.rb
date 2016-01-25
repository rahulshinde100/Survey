class Survey < ActiveRecord::Base
  has_many :given_answers 
  has_many :questions
  
  
  validates_presence_of :name
end
