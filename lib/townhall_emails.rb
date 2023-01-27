require 'nokogiri'
require 'open-uri'

department_url = Nokogiri::HTML(URI.open('https://www.annuaire-des-mairies.com/val-d-oise.html'))
townhall_url = Nokogiri::HTML(URI.open('https://www.annuaire-des-mairies.com/95/avernes.html'))

def get_townhall_email(townhall_url)
  townhall_url.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
end

def get_townhall_urls(department_url)
  urls_array = []
  department_url.xpath('//tr[3]/td//td[2]//td//a/@href').each do |link|
    urls_array << link.content
  end
  urls_array.map! { |string| string.delete_prefix('.') } # Remove the initial "."
  urls_array.map! { |hash| hash.to_s.prepend("http://annuaire-des-mairies.com") } # Add the general url
  return urls_array
end

=begin
def get_all_emails(url_to_use)
  emails_array = []
  url_to_use.each do |link|
    emails_array << link.content
  end
  puts emails_array
end

def perform(department_url)
  get_all_emails(get_townhall_urls(department_url))
end
=end 

get_townhall_email(townhall_url)
get_townhall_urls(department_url)
#get_all_emails(url_to_use)
#perform(department_url)