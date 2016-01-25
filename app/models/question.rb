class Question < ActiveRecord::Base
	validates_presence_of :que_content
	
	belongs_to :survey
	has_many :given_answers 
	has_many :given_answers , through: :survey
	accepts_nested_attributes_for :given_answers
end
