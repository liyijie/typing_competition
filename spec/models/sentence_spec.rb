require 'spec_helper'

describe Sentence do
  it "should caculate the english content" do
    sentence = FactoryGirl.create(:sentence, content: "here is the, so good.")
    sentence.word_count.should == 5
  end

  it "should caculate the chinese content" do
    sentence = FactoryGirl.create(:sentence, content: "我爱北京天安门，天安门上太阳升……")
    sentence.word_count.should == 14
  end

  it "should caculate the number content" do
    sentence = FactoryGirl.create(:sentence, content: "1234 5678")
    sentence.word_count.should == 2
  end

  it "should caculate the mix content" do
    sentence = FactoryGirl.create(:sentence, content: "我爱北京123 beijing123 ，今天是56 78。")
    sentence.word_count.should == 11
  end
end

