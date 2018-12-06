require_relative './environment.rb'

require 'nokogiri'
require 'open-uri'
require 'pry'


class Scraper 
  
  include Cfaprotein 
  attr_accessor :row_width
  
  def front_page 
    doc = Nokogiri::HTML(open("https://www.nutritionix.com/chick-fil-a/menu/premium/"))
    doc 
     
  end 
  
   # b is number of items in that menu section 
    # c is the location of the first name of the first item in that menu section 
    # @row_width tells you how many spots are in each item's row, so to move from name to name within a menu section add @row_width. Same for protein to protein, etc. 
   
  
  def create_breakfast_menu
    create_menu(15, 3, Item.breakfast_all)
  end 
  
  def create_entrees_menu
    create_menu(17, 169, Item.entrees_all)
  end 
  
  def create_salads_menu
     create_menu(4, 357, Item.salads_all)
  end 
  
  def create_sides_menu
    
    b = 10 
    c = 402
    
    a = 0 
     b.times{
      if (front_page.css("td")[c + 10 + (@row_width * a)].text != "0")
         x = Item.new 
         Item.sides_all << x 
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
  
  def create_treats_menu
   
    b = 18
    c = 513
   
    a = 0 
     b.times{
      if (front_page.css("td")[c + 10 + (@row_width * a)].text != "0")
         x = Item.new 
         Item.treats_all << x 
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
 
