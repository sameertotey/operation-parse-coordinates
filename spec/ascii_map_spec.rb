require 'spec_helper'
require_relative '../lib/ascii_map'

describe AsciiMap do 

  context ".get_coordiates" do
    before(:all) do
      @map1 = <<DOC
+==========+
|X*********|
|**********|
|**********|
|**********|
|**********|
+==========+
DOC
      @map2 = <<-DOC
+======+
|******|
|******|
|*X****|
+======+
DOC
      @map3 = <<-DOC
+===================================+
|***********************************|
|***********************************|
|***********************************|
|******X****************************|
|***********************************|
|***********************************|
|***********************************|
|***********************************|
+===================================+
DOC
    end
    it "read 0-0 correctly" do
      expect(AsciiMap.parse(@map1)).to eq([0,0])
    end
    it "read 0-0 correctly" do
      expect(AsciiMap.parse(@map2)).to eq([1,-2])
    end
    it "read 0-0 correctly" do
      expect(AsciiMap.parse(@map3)).to eq([6,-3])
    end
  end

  context ".interpret_step" do
    it "outputs correctly the south movement" do
      prev = [0,0]
      nxt = [0,-1]
      expect(AsciiMap.interpret_step(prev, nxt)).to eq("moved south by 1")
    end
    it "outputs correctly the east movement" do
      prev = [0,-1]
      nxt = [1,-1]
      expect(AsciiMap.interpret_step(prev, nxt)).to eq("moved east by 1")
    end
    it "outputs correctly the west movement" do
      prev = [1,-1]
      nxt = [0,-1]
      expect(AsciiMap.interpret_step(prev, nxt)).to eq("moved west by 1")
    end
    it "outputs correctly the north movement" do
      prev = [0,-1]
      nxt = [0,0]
      expect(AsciiMap.interpret_step(prev, nxt)).to eq("moved north by 1")
    end
  end
  
end