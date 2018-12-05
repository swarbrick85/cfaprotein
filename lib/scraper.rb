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
      if (front_page.css("td")[13 + (11 * a)].text != "0")
         x = Item.new 
         Item.breakfast_all << x 
         z = front_page.css("td")[3 + (11 * a)].text 
         z[0...11] = ""
         x.name = z 
         x.calories = front_page.css("td")[4 + (11 * a)].text
         x.fat = front_page.css("td")[5 + (11 * a)].text
         x.total_carbs = front_page.css("td")[10 + (11 * a)].text
         x.sugar = front_page.css("td")[12 + (11 * a)].text
         x.protein = front_page.css("td")[13 + (11 * a)].text
         a += 1
       end 
    }
     
  end 
  
  def create_entrees_menu
    a = 0 
    17.times{
      if (front_page.css("td")[179 + (11 * a)].text != "0")
         x = Item.new 
         Item.breakfast_all << x 
         z = front_page.css("td")[169 + (11 * a)].text 
         z[0...11] = ""
         x.name = z 
         x.calories = front_page.css("td")[170 + (11 * a)].text
         x.fat = front_page.css("td")[171 + (11 * a)].text
         x.total_carbs = front_page.css("td")[176 + (11 * a)].text
         x.sugar = front_page.css("td")[178 + (11 * a)].text
         x.protein = front_page.css("td")[179 + (11 * a)].text
         a += 1
       end 
    }
     
  end 
  
end 
