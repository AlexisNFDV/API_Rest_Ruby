class AddUserIdToComputers < ActiveRecord::Migration[6.0]
  def change
    add_reference :computers, :user, index: true
  end
end
