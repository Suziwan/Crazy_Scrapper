require_relative '../lib/townhall_emails'

department_url = Nokogiri::HTML(URI.open('https://www.annuaire-des-mairies.com/val-d-oise.html'))
townhall_url = Nokogiri::HTML(URI.open('https://www.annuaire-des-mairies.com/95/avernes.html'))

describe "the get_townhall_email method" do
  it "should give me the email address of Avernes" do
    expect(get_townhall_email(townhall_url)).to eq("mairie.avernes@orange.fr")
  end
end

describe "the get_townhall_url method" do
  it "should give me the URL of the first townhall" do
    expect(get_townhall_urls(department_url)[0]).to eq("http://annuaire-des-mairies.com/95/ableiges.html")
  end
end

#describe "the get_all_emails method" do
#  it "should get an email address" do
#    expect(get_all_emails(url_to_use)).to eq("Something")
#  end
#end

#describe "the perform method" do
#  it "should test something" do
#    expect(perform(department_url)).to eq("Something")
#  end
#end