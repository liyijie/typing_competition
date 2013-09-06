class CreateSentences < ActiveRecord::Migration
  def change
    create_table :sentences do |t|
      t.text :content
      t.integer :word_count
      t.integer :type_id

      t.timestamps
    end
  end
end
