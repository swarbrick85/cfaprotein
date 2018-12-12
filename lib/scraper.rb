require_relative './cfaprotein.rb'



class Scraper 
  
  attr_accessor :row_width
  
  @breakfast_scrapable_item_num = 15
  @entrees_scrapable_item_num = 17 
  @salads_scrapable_item_num = 4
  @sides_scrapable_item_num = 10 
  @treats_scrapable_item_num = 18 
  @drinks_scrapable_item_num = 33
  
  @breakfast_first_name_location = 3
  @entrees_first_name_location = 169 
  @salads_first_name_location = 357
  @sides_first_name_location = 402
  @treats_first_name_location = 513
  @drinks_first_name_location = 712

  def front_page 
    doc = Nokogiri::HTML(open("https://www.nutritionix.com/chick-fil-a/menu/premium/"))
    doc 
     
  end 
  
  def create_breakfast_menu
    create_menu(@breakfast_scrapable_item_num, @breakfast_first_name_location, Item.breakfast_all, Item.breakfast_all_orig)
  end 
  
  def create_entrees_menu
    create_menu(@entrees_scrapable_item_num, @entrees_first_name_location, Item.entrees_all, Item.entrees_all_orig)
  end 
  
  def create_salads_menu
     create_menu(@salads_scrapable_item_num, @salads_first_name_location, Item.salads_all, Item.salads_all_orig)
  end 
  
  def create_sides_menu
    create_menu(@sides_scrapable_item_num, @sides_first_name_location, Item.sides_all, Item.sides_all_orig)
  end 
  
  def create_treats_menu
    create_menu(@treats_scrapable_item_num, @treats_first_name_location, Item.treats_all, Item.treats_all_orig)
  end 
  
  def create_drinks_menu
    create_menu(@drinks_scrapable_item_num, @drinks_first_name_location, Item.drinks_all, Item.drinks_all_orig)
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
    @breakfast_scrapable_item_num = 15
    @entrees_scrapable_item_num = 17 
    @salads_scrapable_item_num = 4
    @sides_scrapable_item_num = 10 
    @treats_scrapable_item_num = 18 
    @drinks_scrapable_item_num = 33
  
    @breakfast_first_name_location = 3
    @entrees_first_name_location = 169 
    @salads_first_name_location = 357
    @sides_first_name_location = 402
    @treats_first_name_location = 513
    @drinks_first_name_location = 712
  end
  
  def create_menu(num_scrapable_items, first_name_location, item_all_class_variable, item_all_original_class_variable)
    
    counter = 0 
     num_scrapable_items.times{
      if (front_page.css("td")[first_name_location + 10 + (@row_width * counter)].text != "0")
         name_in_process = front_page.css("td")[first_name_location + (@row_width * counter)].text 
         name_in_process[0...11] = ""
         
         name = name_in_process 
         calories = front_page.css("td")[first_name_location + 1 + (@row_width * counter)].text.to_f.round(1)
         fat = front_page.css("td")[first_name_location + 2 + (@row_width * counter)].text.to_f.round(1)
         total_carbs = front_page.css("td")[first_name_location + 7 + (@row_width * counter)].text.to_f.round(1)
         sugar = front_page.css("td")[first_name_location + 9 + (@row_width * counter)].text.to_f.round(1)
         protein = front_page.css("td")[first_name_location + 10 + (@row_width * counter)].text.to_f.round(1)
         
         Item.new(item_all_class_variable, item_all_original_class_variable, name, protein, calories, fat, sugar, total_carbs)
       end 
       
      counter += 1
    }
    nil
  end
end  