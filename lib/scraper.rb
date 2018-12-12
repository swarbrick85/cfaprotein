require_relative './cfaprotein.rb'



class Scraper 
  
  attr_accessor :row_width
  
  @@breakfast_scrapable_item_num = 15
  @@entrees_scrapable_item_num = 17 
  @@salads_scrapable_item_num = 4
  @@sides_scrapable_item_num = 10 
  @@treats_scrapable_item_num = 18 
  @@drinks_scrapable_item_num = 33
  
  @@breakfast_first_name_location = 3
  @@entrees_first_name_location = 169 
  @@salads_first_name_location = 357
  @@sides_first_name_location = 402
  @@treats_first_name_location = 513
  @@drinks_first_name_location = 712

  def front_page 
    doc = Nokogiri::HTML(open("https://www.nutritionix.com/chick-fil-a/menu/premium/"))
    doc 
     
  end 
  
  def create_breakfast_menu
    create_menu(breakfast_scrapable_item_num, breakfast_first_name_location, Item.breakfast_all, Item.breakfast_all_orig)
  end 
  
  def create_entrees_menu
    create_menu(entrees_scrapable_item_num, entrees_first_name_location, Item.entrees_all, Item.entrees_all_orig)
  end 
  
  def create_salads_menu
     create_menu(salads_scrapable_item_num, salads_first_name_location, Item.salads_all, Item.salads_all_orig)
  end 
  
  def create_sides_menu
    create_menu(sides_scrapable_item_num, salads_first_name_location, Item.sides_all, Item.sides_all_orig)
  end 
  
  def create_treats_menu
    create_menu(treats_scrapable_item_num, treats_first_name_location, Item.treats_all, Item.treats_all_orig)
  end 
  
  def create_drinks_menu
    create_menu(drinks_scrapable_item_num, drinks_first_name_location, Item.drinks_all, Item.drinks_all_orig)
  end 
  
  
  def create_entire_menu 
    create_breakfast_menu
    create_entrees_menu
    create_salads_menu
    create_sides_menu
    create_treats_menu
    create_drinks_menu
  end 
  
  def initialize 
    @row_width = 11 
   
  end
  
  #
  #
  #
  
  def create_menu(b, c, item_all_class_variable, item_all_original_class_variable)
    
      # b is number of items in that menu section 
    # c is the location of the first name of the first item in that menu section 
    # @row_width tells you how many spots are in each item's row, so to move from name to name within a menu section add @row_width. Same for protein to protein, etc. 
    
    a = 0 
     b.times{
      if (front_page.css("td")[c + 10 + (@row_width * a)].text != "0")
         z = front_page.css("td")[c + (@row_width * a)].text 
         z[0...11] = ""
         
         name = z 
         calories = front_page.css("td")[c + 1 + (@row_width * a)].text.to_f.round(1)
         fat = front_page.css("td")[c + 2 + (@row_width * a)].text.to_f.round(1)
         total_carbs = front_page.css("td")[c + 7 + (@row_width * a)].text.to_f.round(1)
         sugar = front_page.css("td")[c + 9 + (@row_width * a)].text.to_f.round(1)
         protein = front_page.css("td")[c + 10 + (@row_width * a)].text.to_f.round(1)
         
         Item.new(item_all_class_variable, item_all_original_class_variable, name, protein, calories, fat, sugar, total_carbs)
       end 
       
      a += 1
    }
    nil
  end
  
  
  
end  
 
