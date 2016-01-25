class AddUserToSurveys < ActiveRecord::Migration
  def change
  		add_reference :surveys , :user, index: true
  end
end
9595069464

GRAB4
https://paytm.com/paytmwallet