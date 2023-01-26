require 'nokogiri'
require 'open-uri'
PAGE_URL = "http://annuaire-des-mairies.com/"

page = Nokogiri::HTML(URI.open(PAGE_URL))