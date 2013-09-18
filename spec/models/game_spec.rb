require 'spec_helper'

describe Game do
  context "validation" do
    it "should have user_id" do
      game = Game.new
      game.save.should == false
    end
  end

  context "score" do
    let(:game) { Game.new(user_id: 1) } 
    let(:s1) { Sentence.create word_count: 100 } 
    let(:s2) { Sentence.create word_count: 200 } 
    let(:r1) { GameRelation.new word_count: 100 } 
    let(:r2) { GameRelation.new word_count: 200 } 

    it "should get the score by sentence" do
      r1.duration_time = 2
      r2.duration_time = 3
      game.game_relations << r1
      game.game_relations << r2
      game.save

      game.game_relations.size.should == 2
      game.word_count.should == 300
      game.duration_time.should == 5
      game.score.should == game.word_count / game.duration_time
    end

    it "should get 100 when the score is bigger than 100" do
      r1.duration_time = 1
      r2.duration_time = 0
      game.game_relations << r1 << r2
      game.save

      game.game_relations.size.should == 2
      game.word_count.should == 300
      game.duration_time.should == 1
      game.score.should == 100      
    end
  end
end