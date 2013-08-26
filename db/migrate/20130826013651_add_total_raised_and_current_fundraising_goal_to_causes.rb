class AddTotalRaisedAndCurrentFundraisingGoalToCauses < ActiveRecord::Migration
  def change
  	add_column :causes, :total_raised, :integer
  	add_column :causes, :current_fundraising_goal, :integer
  end
end
