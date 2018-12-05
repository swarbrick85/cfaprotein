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
    Item.breakfast_all << x 
    z = front_page.css("td")[3 + (11 * a)].text 
    z[0...11] = ""
    x.name = z 
    x.calories = front_page.css("td")[4 + (11 * a)].text
    x.fat = front_page.css("td")[5 + (11 * a)].text
    x.total_carbs = front_page.css("td")[10 + (11 * a)].text
    x.sugar
    a += 1
    }
     
  end 
  
  def create_entrees_menu
    a = 0 
    17.times{
    x = Item.new 
    y = Item.entrees_all
    y << x 
    z = front_page.css("td")[169 + (11 * a)].text 
    z[0...11] = ""
    x.name = z 
    a += 1
    }
    
  end 
  
end 
