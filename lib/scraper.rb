require_relative './environment.rb'

require 'nokogiri'
require 'open-uri'
require 'pry'


class Scraper 
  
  def front_page 
    doc = Nokogiri::HTML(open("https://www.nutritionix.com/chick-fil-a/menu/premium/"))
    doc 
     
  end 
  
  def create_breakfast_menu
    a = 0 
    15.times{
    x = Item.new 
    y = Item.breakfast_all
    y << x 
    z = front_page.css("td")[3 + (11 * a)].text 
    z[0...11] = ""
    x.name = z 
    a += 1
    }
    binding.pry 
  end 
  
  
  
end 
