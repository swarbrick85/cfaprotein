require_relative './environment.rb'

require 'nokogiri'
require 'open-uri'
require 'pry'


class Scraper 
  
  include Cfaprotein
  
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
         calculate 
       end 
       
      a += 1
    }
     
  end 
  
  def create_entrees_menu
    a = 0 
    17.times{
      if (front_page.css("td")[179 + (11 * a)].text != "0")
         x = Item.new 
         Item.entrees_all << x 
         z = front_page.css("td")[169 + (11 * a)].text 
         z[0...11] = ""
         x.name = z 
         x.calories = front_page.css("td")[170 + (11 * a)].text
         x.fat = front_page.css("td")[171 + (11 * a)].text
         x.total_carbs = front_page.css("td")[176 + (11 * a)].text
         x.sugar = front_page.css("td")[178 + (11 * a)].text
         x.protein = front_page.css("td")[179 + (11 * a)].text
       end 
       
       a += 1
    }
     
  end 
  
  def create_salads_menu
    a = 0 
    4.times{
      if (front_page.css("td")[367 + (11 * a)].text != "0")
         x = Item.new 
         Item.salads_all << x 
         z = front_page.css("td")[357 + (11 * a)].text 
         z[0...11] = ""
         x.name = z 
         x.calories = front_page.css("td")[358 + (11 * a)].text
         x.fat = front_page.css("td")[359 + (11 * a)].text
         x.total_carbs = front_page.css("td")[364 + (11 * a)].text
         x.sugar = front_page.css("td")[366 + (11 * a)].text
         x.protein = front_page.css("td")[367 + (11 * a)].text
       end 
       
       a += 1
    }
     
  end 
  
  def create_sides_menu
    a = 0 
    10.times{
      if (front_page.css("td")[412 + (11 * a)].text != "0")
         x = Item.new 
         Item.sides_all << x 
         z = front_page.css("td")[402 + (11 * a)].text 
         z[0...11] = ""
         x.name = z 
         x.calories = front_page.css("td")[403 + (11 * a)].text
         x.fat = front_page.css("td")[404 + (11 * a)].text
         x.total_carbs = front_page.css("td")[409 + (11 * a)].text
         x.sugar = front_page.css("td")[411 + (11 * a)].text
         x.protein = front_page.css("td")[412 + (11 * a)].text
       end 
       
       a += 1
    }
     
  end 
  
  def create_treats_menu
    a = 0 
    18.times{
      if (front_page.css("td")[523 + (11 * a)].text != "0")
         x = Item.new 
         Item.treats_all << x 
         z = front_page.css("td")[513 + (11 * a)].text 
         z[0...11] = ""
         x.name = z 
         x.calories = front_page.css("td")[514 + (11 * a)].text
         x.fat = front_page.css("td")[515 + (11 * a)].text
         x.total_carbs = front_page.css("td")[520 + (11 * a)].text
         x.sugar = front_page.css("td")[522 + (11 * a)].text
         x.protein = front_page.css("td")[523 + (11 * a)].text
       end 
       
       a += 1
    }
     
  end 
  
  def create_drinks_menu
    a = 0 
    33.times{
      if (front_page.css("td")[722 + (11 * a)].text != "0")
         x = Item.new 
         Item.drinks_all << x 
         z = front_page.css("td")[712 + (11 * a)].text 
         z[0...11] = ""
         x.name = z 
         x.calories = front_page.css("td")[713 + (11 * a)].text
         x.fat = front_page.css("td")[714 + (11 * a)].text
         x.total_carbs = front_page.css("td")[719 + (11 * a)].text
         x.sugar = front_page.css("td")[721 + (11 * a)].text
         x.protein = front_page.css("td")[722 + (11 * a)].text
       end 
       
       a += 1
    }
     
  end 
end  
 
