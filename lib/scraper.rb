require_relative './cfaprotein.rb'



class Scraper 
  
  attr_accessor :row_width
  
  def front_page 
    doc = Nokogiri::HTML(open("https://www.nutritionix.com/chick-fil-a/menu/premium/"))
    doc 
     
  end 
  
  def create_breakfast_menu
    create_menu(15, 3, Item.breakfast_all, Item.breakfast_all_orig)
  end 
  
  def create_entrees_menu
    create_menu(17, 169, Item.entrees_all, Item.entrees_all_orig)
  end 
  
  def create_salads_menu
     create_menu(4, 357, Item.salads_all, Item.salads_all_orig)
  end 
  
  def create_sides_menu
    create_menu(10, 402, Item.sides_all, Item.sides_all_orig)
  end 
  
  def create_treats_menu
    create_menu(18, 513, Item.treats_all, Item.treats_all_orig)
  end 
  
  def create_drinks_menu
    create_menu(33, 712, Item.drinks_all, Item.drinks_all_orig)
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
        
         complex_carbs = (x.total_carbs - x.sugar).to_f.round(1)
        
         pct_cal_by_protein = (((x.protein * 4)/x.calories) * 100).round(1)
         pct_cal_by_fat = (((x.fat * 9)/x.calories) * 100).round(1)
         pct_cal_by_sc = (((x.sugar * 4)/x.calories) * 100).round(1)
         pct_cal_by_cc = (((x.complex_carbs * 4)/x.calories) * 100).round(1)
         pct_cal_by_tc = (((x.total_carbs * 4)/x.calories) * 100).round(1)
         cal_per_protein = (x.calories/x.protein).round(1) 
         
         Item.new(item_all_class_variable, item_all_original_class_variable, name, protein, calories, fat, sugar, complex_carbs, total_carbs, pct_cal_by_protein, pct_cal_by_fat, pct_cal_by_sc, pct_cal_by_cc, pct_cal_by_tc, cal_per_protein)
       end 
       
      a += 1
    }
    nil
  end
  
  
  
end  
 
