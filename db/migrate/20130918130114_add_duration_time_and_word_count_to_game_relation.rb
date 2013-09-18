class AddDurationTimeAndWordCountToGameRelation < ActiveRecord::Migration
  def change
    add_column :game_relations, :duration_time, :integer
    add_column :game_relations, :word_count, :integer
  end
end
