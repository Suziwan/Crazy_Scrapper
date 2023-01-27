require_relative '../lib/dark_trader'

PAGE_URL = "https://coinmarketcap.com/all/views/all/"
page = Nokogiri::HTML(URI.open(PAGE_URL))

describe "the scrap_names method" do
  it "gives at least 3 names" do
    expect(scrap_names(page).length).to be > 3
  end
  it "gives the first name of crypto: BTC" do
    expect(scrap_names(page)[0]).to eq("BTC")
  end
end

describe "the scrap_values method" do
  it "gives at least 3 values" do
    expect(scrap_values(page).length).to be > 3
  end
  it "gives the value of the 3rd crypto (USDT): $1.00" do
    expect(scrap_values(page)[2]).to eq("$1.00")
  end
end

describe "the link_cryto method" do
  it "should be an hash" do
    expect((link_crypto(scrap_names(page), scrap_values(page))).class).to eq(Hash)
  end
  it "gives at least 10 values" do
    expect((link_crypto(scrap_names(page), scrap_values(page))).length).to be > 10
  end
end

describe "the perform method" do
  it "should not raise any error" do
    expect{perform(page)}.to_not raise_error
  end
  it "should not give empty values (nil)" do
    expect(perform(page)).to_not eq(nil)
  end
end
