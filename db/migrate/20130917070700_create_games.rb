class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :score
      t.integer :user_id
      t.integer :duration_time
      t.integer :word_count

      t.timestamps
    end
  end
end
