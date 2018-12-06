require_relative './environment.rb'

require 'nokogiri'
require 'open-uri'
require 'pry'


class Scraper 
  
  attr_accessor :row_width
  
  def front_page 
    doc = Nokogiri::HTML(open("https://www.nutritionix.com/chick-fil-a/menu/premium/"))
    doc 
     
  end 
  
  def initialize 
    @row_width = 11 
  end 
  
  def create_breakfast_menu
    a = 0 
    15.times{
      if (front_page.css("td")[13 + (@row_width * a)].text != "0")
         x = Item.new 
         Item.breakfast_all << x 
         z = front_page.css("td")[3 + (@row_width * a)].text 
         z[0...11] = ""
         x.name = z 
         x.calories = front_page.css("td")[4 + (@row_width * a)].text.to_f.round(1)
         x.fat = front_page.css("td")[5 + (@row_width * a)].text.to_f.round(1)
         x.total_carbs = front_page.css("td")[10 + (@row_width * a)].text.to_f.round(1)
         x.sugar = front_page.css("td")[12 + (@row_width * a)].text.to_f.round(1)
         x.protein = front_page.css("td")[13 + (@row_width * a)].text.to_f.round(1)
        
         x.complex_carbs = (x.total_carbs - x.sugar).to_f.round(1)
        
         x.pct_cal_by_protein = (((x.protein * 4)/x.calories) * 100).round(1)
         x.pct_cal_by_fat = (((x.fat * 9)/x.calories) * 100).round(1)
         x.pct_cal_by_sc = (((x.sugar * 4)/x.calories) * 100).round(1)
         x.pct_cal_by_cc = (((x.complex_carbs * 4)/x.calories) * 100).round(1)
         x.pct_cal_by_tc = (((x.total_carbs * 4)/x.calories) * 100).round(1)
         x.cal_per_protein = (x.calories/x.protein).round(1)  
       end 
       
      a += 1
    }
     
  end 
  
  def create_entrees_menu
    a = 0 
    17.times{
      if (front_page.css("td")[179 + (@row_width * a)].text != "0")
         x = Item.new 
         Item.entrees_all << x 
         z = front_page.css("td")[169 + (@row_width * a)].text 
         z[0...11] = ""
         x.name = z 
         x.calories = front_page.css("td")[170 + (@row_width * a)].text
         x.fat = front_page.css("td")[171 + (@row_width * a)].text
         x.total_carbs = front_page.css("td")[176 + (@row_width * a)].text
         x.sugar = front_page.css("td")[178 + (@row_width * a)].text
         x.protein = front_page.css("td")[179 + (@row_width * a)].text
       end 
       
       a += 1
    }
     
  end 
  
  def create_salads_menu
    a = 0 
    4.times{
      if (front_page.css("td")[367 + (@row_width * a)].text != "0")
         x = Item.new 
         Item.salads_all << x 
         z = front_page.css("td")[357 + (@row_width * a)].text 
         z[0...11] = ""
         x.name = z 
         x.calories = front_page.css("td")[358 + (@row_width * a)].text
         x.fat = front_page.css("td")[359 + (@row_width * a)].text
         x.total_carbs = front_page.css("td")[364 + (@row_width * a)].text
         x.sugar = front_page.css("td")[366 + (@row_width * a)].text
         x.protein = front_page.css("td")[367 + (@row_width * a)].text
       end 
       
       a += 1
    }
     
  end 
  
  def create_sides_menu
    a = 0 
    10.times{
      if (front_page.css("td")[412 + (@row_width * a)].text != "0")
         x = Item.new 
         Item.sides_all << x 
         z = front_page.css("td")[402 + (@row_width * a)].text 
         z[0...11] = ""
         x.name = z 
         x.calories = front_page.css("td")[403 + (@row_width * a)].text
         x.fat = front_page.css("td")[404 + (@row_width * a)].text
         x.total_carbs = front_page.css("td")[409 + (@row_width * a)].text
         x.sugar = front_page.css("td")[411 + (@row_width * a)].text
         x.protein = front_page.css("td")[412 + (@row_width * a)].text
       end 
       
       a += 1
    }
     
  end 
  
  def create_treats_menu
    a = 0 
    18.times{
      if (front_page.css("td")[523 + (@row_width * a)].text != "0")
         x = Item.new 
         Item.treats_all << x 
         z = front_page.css("td")[513 + (@row_width * a)].text 
         z[0...11] = ""
         x.name = z 
         x.calories = front_page.css("td")[514 + (@row_width * a)].text
         x.fat = front_page.css("td")[515 + (@row_width * a)].text
         x.total_carbs = front_page.css("td")[520 + (@row_width * a)].text
         x.sugar = front_page.css("td")[522 + (@row_width * a)].text
         x.protein = front_page.css("td")[523 + (@row_width * a)].text
       end 
       
       a += 1
    }
     
  end 
  
  def create_drinks_menu
    b = 33
    c = 712
    a = 0 
    b.times{
      if (front_page.css("td")[c + 10 + (@row_width * a)].text != "0")
         x = Item.new 
         Item.drinks_all << x 
         z = front_page.css("td")[c + (@row_width * a)].text 
         z[0...11] = ""
         x.name = z 
         x.calories = front_page.css("td")[c + 1 + (@row_width * a)].text
         x.fat = front_page.css("td")[c + 2 + (@row_width * a)].text
         x.total_carbs = front_page.css("td")[c + 7 + (@row_width * a)].text
         x.sugar = front_page.css("td")[c + 9 + (@row_width * a)].text
         x.protein = front_page.css("td")[c + 10 + (@row_width * a)].text
       end 
       
       a += 1
    }
     
  end 
end  
 
