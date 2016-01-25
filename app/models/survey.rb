class Survey < ActiveRecord::Base
  has_many :given_answers 
  has_many :questions
  accepts_nested_attributes_for :given_answers
  
  validates_presence_of :name
end
