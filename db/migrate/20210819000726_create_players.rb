class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :age
      t.string :position
      t.integer :rating
      t.boolean :rookie
      t.belongs_to :team, foreign_key: true
    end
  end
end
