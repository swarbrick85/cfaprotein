require_relative './environment'

require 'pry'
require 'nokogiri'
requrie 'open-uri'


class Scraper 
  
  def front_page 
    doc = Nokogiri::HTML(open("https://m.nutritionix.com/chick-fil-a/menu/premium/"))
    doc 
    binding.pry 
  end 
  
  
  
  
  
end 