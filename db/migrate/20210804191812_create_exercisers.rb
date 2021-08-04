class CreateExercisers < ActiveRecord::Migration[5.2]
  def change
    create_table :gym_members do |t|
      t.string :name
      t.string :focus
    end
  end
end
