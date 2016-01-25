class Question < ActiveRecord::Base
	validates_presence_of :que_content
	
	belongs_to :survey
	has_many :given_answers
	
end
