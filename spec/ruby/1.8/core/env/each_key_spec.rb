require File.dirname(__FILE__) + '/../../spec_helper'

describe "ENV#each_key" do

  it "returns each key" do
    e = []
    orig = ENV.to_hash
    begin
      ENV.clear
      ENV["1"] = "3"
      ENV["2"] = "4"
      ENV.each_key { |k| e << k }
      e.should == ["1", "2"]
    ensure
      ENV.replace orig
    end
  end

  it "raises LocalJumpError if no block given" do
    lambda { ENV.each_key }.should raise_error(LocalJumpError)
  end

end
