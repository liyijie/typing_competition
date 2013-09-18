require 'spec_helper'

describe Sentence do
  let(:sentence) { Sentence.new } 
  it "should caculate the english content" do
    sentence.content = "here is the, so good."
    sentence.save

    sentence.word_count.should == 5
  end

  it "should caculate the chinese content" do
    sentence.content = "我爱北京天安门，天安门上太阳升……"
    sentence.save

    sentence.word_count.should == 14
  end

  it "should caculate the number content" do
    sentence.content = "1234 5678"
    sentence.save

    sentence.word_count.should == 2
  end

  it "should caculate the mix content" do
    sentence.content = "我爱北京123 beijing123 ，今天是56 78。"
    sentence.save

    sentence.word_count.should == 11
  end
end

