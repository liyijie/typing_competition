require 'spec_helper'

describe Game do
  it "should have user_id" do
    game = Game.new
    game.save.should == false
  end

end