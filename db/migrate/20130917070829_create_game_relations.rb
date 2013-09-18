class CreateGameRelations < ActiveRecord::Migration
  def change
    create_table :game_relations do |t|
      t.integer :sentence_id
      t.integer :game_id

      t.timestamps
    end
  end
end
