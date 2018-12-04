require_relative './environment.rb'

require 'nokogiri'
require 'open-uri'
require 'pry'


class Scraper 
  
  def front_page 
    doc = Nokogiri::HTML(open("https://m.nutritionix.com/chick-fil-a/menu/premium/"))
    doc 
    binding.pry 
  end 
  
  
  
  
  
end 