class AddGymToGymMembers < ActiveRecord::Migration[5.2]
  def change
    add_reference :gym_members, :gym, foreign_key: true
  end
end
