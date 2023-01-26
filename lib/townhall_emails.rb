require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(URI.open('https://www.annuaire-des-mairies.com/val-d-oise.html'))
townhall_url = Nokogiri::HTML(URI.open('https://www.annuaire-des-mairies.com/95/avernes.html'))

def get_townhall_email(townhall_url)
  email = townhall_url.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
  puts email
end

def get_townhall_urls(page)
  urls = 
end

get_townhall_email(townhall_url)