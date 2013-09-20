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

  context "randome records" do
    let(:type1) { FactoryGirl.create(:type, lang: "english") } 
    let(:type2) { FactoryGirl.create(:type, lang: "chinese") } 
    # let(:en_sentences) { FactoryGirl.create_list(:sentence, 5, type: type1) } 
    # let(:cn_sentences) { FactoryGirl.create_list(:sentence, 5, type: type2) } 
    it "should get a random record" do
      type1.sentences = FactoryGirl.create_list(:sentence, 5)
      type2.sentences = FactoryGirl.create_list(:sentence, 5)
      type1.save
      type2.save
      rand_record = Sentence.rand_record type1
      rand_record.should_not be_new_record
    end

    it "should get random records by size" do
      type1.sentences = FactoryGirl.create_list(:sentence, 5)
      type2.sentences = FactoryGirl.create_list(:sentence, 5)
      rand_records = Sentence.rand_records 5
      rand_records.size.should == 10
    end

    it "should get no record when the size is 0" do
      rand_records = Sentence.rand_records 0
      rand_records.size.should == 0
    end
  end

  
end

