require_relative './environment.rb'

require 'nokogiri'
require 'open-uri'
require 'pry'


class Scraper 
  
  def front_page 
    doc = Nokogiri::HTML(open("https://www.nutritionix.com/chick-fil-a/menu/premium/"))
    doc 
    binding.pry 
  end 
  
  def create_from_page 
    
    
    
  end 
  
  
  
end 

# for wwww, the first item is on "a" 15