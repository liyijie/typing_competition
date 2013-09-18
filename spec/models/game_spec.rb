require 'spec_helper'

describe Game do
  it "should have user_id" do
    game = Game.new
    game.save.should == false
  end
  context "score" do
    let(:game) { Game.new } 
    it "should get the score by sentence" do
      game.word_count = 400
      game.duration_time = 5
      game.score.should == game.word_count*1.0 / game.duration_time
    end

    it "should get 100 when the score is bigger than 100" do
      game.word_count = 400
      game.duration_time = 1
      game.score.should == 100      
    end
  end
end