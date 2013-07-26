class AddAnswersUsersTable < ActiveRecord::Migration
  def change
    create_table :answers_users, id: false do |t|
      t.integer :answer_id
      t.integer :user_id
    end
  end
end
