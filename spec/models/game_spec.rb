require 'spec_helper'

describe Game do

  it { should validate_presence_of(:user_id).with_message("You must login first") }

  context "score" do
    let(:game) { FactoryGirl.build(:game) } 
    before(:each) {game.game_relations.destroy_all}

    it "should get the score by sentence" do
      game.game_relations << (FactoryGirl.create(:game_relation, word_count: 100, duration_time: 2))
      game.game_relations << (FactoryGirl.create(:game_relation, word_count: 200, duration_time: 3))
      game.save

      game.game_relations.size.should == 2
      game.word_count.should == 300
      game.duration_time.should == 5
      game.score.should == game.word_count / game.duration_time
    end

    it "should get score 0 when has no game_relations" do
      game.save
      game.game_relations.size.should == 0
      game.score.should == 0
    end

    it "should get 100 when the score is bigger than 100" do
      game.game_relations << (FactoryGirl.build(:game_relation, word_count: 100, duration_time: 1))
      game.game_relations << (FactoryGirl.build(:game_relation, word_count: 200, duration_time: 0))
      game.save

      game.game_relations.size.should == 2
      game.word_count.should == 300
      game.duration_time.should == 1
      game.score.should == 100      
   end
 end

 context "new a game" do
  let(:type1) { FactoryGirl.create(:type, lang: "english") } 
  let(:type2) { FactoryGirl.create(:type, lang: "chinese") }
  
  it "should have game relation size is the same as sentence_size attribute" do
    type1.sentences = FactoryGirl.create_list(:sentence, 5)
    type2.sentences = FactoryGirl.create_list(:sentence, 5)
    type1.save
    type2.save
    game = FactoryGirl.create(:game)

    game.game_relations.size.should == game.sentence_size * 2
    game.sentences.size.should == game.sentence_size * 2
  end
end
end