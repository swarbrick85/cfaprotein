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
    create_menu(10, 402, Item.sides_all)
  end 
  
  def create_treats_menu
    create_menu(18, 513, Item.treats_all)
  end 
  
  def create_drinks_menu
    create_menu(33, 712, Item.drinks_all)
  end 
  
  
  def create_entire_menu 
    create_breakfast_menu
    create_entrees_menu
    create_salads_menu
    create_sides_menu
    create_treats_menu
    create_drinks_menu
  end 
end  
 
