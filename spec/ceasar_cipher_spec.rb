require_relative "../lib/caesar_cipher"

RSpec.describe "#caesar_cipher" do
  context "when shift is 3" do
    it "returns def from abc" do
      expect(caesar_cipher("abc", 3)).to eq("def")
    end
    it "returns ghi from def" do
      expect(caesar_cipher("def", 3)).to eq("ghi")
    end
  end

  context "when shift is 26" do
    it "returns abc from abc" do
      expect(caesar_cipher("abc", 26)).to eq("abc")
    end

    it "returns def from def" do
      expect(caesar_cipher("def", 26)).to eq("def")
    end
  end


  context "when shift is 150" do  
    it "returns uvw from abc" do
      expect(caesar_cipher("abc", 150)).to eq("uvw")
    end

    it "returns xyz from def" do
      expect(caesar_cipher("def", 150)).to eq("xyz")
    end
  end
end