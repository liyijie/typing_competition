require 'spec_helper'

describe Game do
  context "validation" do
    it "should have user_id" do
      game = Game.new
      game.save.should == false
    end
  end

  context "score" do

    it "should get the score by sentence" do
      game = FactoryGirl.build(:game) do |g|
        g.game_relations << (FactoryGirl.create(:game_relation, word_count: 100, duration_time: 2))
        g.game_relations << (FactoryGirl.create(:game_relation, word_count: 200, duration_time: 3))
      end
      game.save

      game.game_relations.size.should == 2
      game.word_count.should == 300
      game.duration_time.should == 5
      game.score.should == game.word_count / game.duration_time
    end

    it "should get 100 when the score is bigger than 100" do
     game = FactoryGirl.build(:game) do |g|
       g.game_relations << (FactoryGirl.build(:game_relation, word_count: 100, duration_time: 1))
       g.game_relations << (FactoryGirl.build(:game_relation, word_count: 200, duration_time: 0))
     end
     game.save

      game.game_relations.size.should == 2
      game.word_count.should == 300
      game.duration_time.should == 1
      game.score.should == 100      
    end
  end
end