require 'nokogiri'
require 'open-uri'
PAGE_URL = "https://coinmarketcap.com/all/views/all/"

page = Nokogiri::HTML(URI.open(PAGE_URL))

def scrap_names(page)
  names_array = [] # Creating an empty array for names
  names = page.xpath('//tbody//td[3]/div').each do |link| # Scraping the third column (cryptos' names)
    names_array << link.content
  end
  names_array
end

def scrap_values(page)
  values_array = [] # Creating an empty array for values
  values = page.xpath('//tbody//td[5]/div').each do |link| # Scraping the fifth column (cryptos' values)
    values_array << link.content
  end
  values_array
end

def link_crypto(names, values)
  crypto_hash = names.zip(values).to_h
  crypto_hash
end

def perform(page)
  link_crypto(scrap_names(page), scrap_values(page))
end

perform(page)
