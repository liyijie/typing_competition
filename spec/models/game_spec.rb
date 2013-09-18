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
    it "should get the score by sentence" do
      s1 = Sentence.new word_count: 100
      s2 = Sentence.new word_count: 300
      game.sentences << s1 << s2
      game.duration_time = 5
      game.save

      game.score.should == game.word_count / game.duration_time
    end

    it "should get 100 when the score is bigger than 100" do
      s1 = Sentence.new word_count: 100
      s2 = Sentence.new word_count: 300
      game.sentences << s1 << s2
      game.duration_time = 1
      game.save

      game.score.should == 100      
    end
  end
end