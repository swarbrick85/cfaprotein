require_relative './environment.rb'

require 'nokogiri'
require 'open-uri'
require 'pry'


class Scraper 
  
  def front_page 
    doc = Nokogiri::HTML(open("https://www.nutritionix.com/chick-fil-a/menu/premium/"))
    doc 
     
  end 
  
  def create_breakfast
    x = Item.new 
    y = Item.breakfast_all
    y << x 
    z = front_page.css("td")[3].text 
    z[0...11] = ""
    x.name = z 
    
    binding.pry 
  end 
  
  
  
end 
