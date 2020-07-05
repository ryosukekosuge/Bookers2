class IntroductionToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :Introduction, :text
  end
end
