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
    Item.breakfast_all << x 
    y = front_page.css("td")[3].text 
    y[0...11] = ""
    x.name = y 
    
    binding.pry 
  end 
  
  
  
end 
