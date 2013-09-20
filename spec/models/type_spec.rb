require "spec_helper"

describe Type do
  let(:type) { FactoryGirl.build(:type) } 
  subject { type } 

  its(:to_s) { should == subject.lang }
end