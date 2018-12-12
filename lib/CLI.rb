require_relative './cfaprotein.rb'

class Cli 
  
  attr_accessor :selected_menu
  
  def display_menu(item_all_class_variable)
    a = 1 
    puts "Please select one of the following options:"
    item_all_class_variable.each do |item|
      puts "#{a}. #{item.name}"
      a += 1 
    end 
    puts "99. Start the app over"
  end 
  
  def list_menus 
    puts "Please select from the following menu options:"
    puts "1.  Entrees Menu"
    puts "2.  Salads Menu"
    puts "3.  Sides Menu"
    puts "4.  Treats Menu"
    puts "5.  Drinks Menu"
    puts "6.  Breakfast Menu"
  end 
  
  def list_attributes
    puts "1.  protein (g)"
    puts "2.  calories"
    puts "3.  fat (g)"
    puts "4.  sugar (g)"
    puts "5.  complex carbs (g)"
    puts "6.  total carbs (g)"
    puts "7.  percentage of calories from protein"
    puts "8.  percentage of calories from fat"
    puts "9.  percentage of calories from sugar"
    puts "10. percentage of calories from complex carbs"
    puts "11. percentage of calories from total carbs"
    puts "12. calories per gram of protein"
  end
  
  def display_item(item) 
    puts "#{item.name}"
    puts "#{item.protein}g protein"
    puts "#{item.calories} calories"
    puts "#{item.fat}g fat"
    puts "#{item.complex_carbs}g complex carbs"
    puts "#{item.sugar}g sugar"
    puts "#{item.total_carbs}g total carbs"
    puts "#{item.pct_cal_by_protein}% of calories from protein"
    puts "#{item.pct_cal_by_fat}% of calories from fat"
    puts "#{item.pct_cal_by_cc}% of calories from complex carbs"
    puts "#{item.pct_cal_by_sc}% of calories from sugar"
    puts "#{item.pct_cal_by_tc}% of calories from total carbs"
    puts "#{item.cal_per_protein} calories per gram of protein"
    puts " "
    puts "To return to the beginning of the app, enter anything."
    gets
    start
  end
  
  def start 
    puts "Hi, welcome to CFA Protein!"
    puts "This app exclusively addresses items on the menu that have at least 1 gram of protein."
    puts "It allows you to look at nutritional information about individual menu items. It also allows you to list menu items according to a particular nutritional attribute, in either ascending or descending order. Additionally you can search for menu items within a given range for a particular nutritional attribute."
    puts "When you see a numbered list please enter the number of the option you'd like to select."
    puts "If you make a selection and are returned to a prior menu, it means:"
    puts "  1. There are no items within the parameters you set out."
    puts "  2. You made an invalid entry of some kind."
    puts "  3. Our app is out of date. Please feel free to let us know at https://github.com/'swarbrick85'/cfaprotein"
    puts "At any time you can press ctrl + C to exit the app."
    puts "Please make a selection from the following:"
    puts "  1. I'd like to look at individual menu items."
    puts "  2. I'd like to list menu items according to an attribute, in ascending or descending order (for example, you can list menu items from the one most protein to the item with the least protein)."
    puts "  3. I'd like to find menu items within a range that I select for a given attribute."
    x = gets.strip
    if x == "1" 
      individual_item_path
    elsif x == "2" 
      asc_desc
    elsif x == "3"
      find_in_range
    else 
      puts "I'm sorry, that's not an option here."
      start 
    end 
  end 

  def asc_desc_input
    puts "Please select from the following:"
    puts "1.  Sort this menu in descending order"
    puts "2.  Sort this menu in ascending order"
    puts "99. Start the app over"
    gets.strip
  end 
  
  def asc_desc_attr_input
    puts "Please select an attribute by which to sort this menu:"
    list_attributes
    puts "99. start the app over"
    gets.strip.to_f
  end 
  
  def asc_desc
    list_menus
    puts "7.  The entire menu"
    puts "99. Start the app over"
    x = gets.strip.to_f 
    if x != x.to_i || x < 1 || x > 99 || (x > 7 && x < 99)
      puts "I'm sorry, that's not an option here."
      asc_desc
    end 
    if x == 1 
      @selected_menu = Item.entrees_all 
    elsif x == 2 
      @selected_menu = Item.salads_all 
    elsif x == 3 
      @selected_menu = Item.sides_all 
    elsif x == 4 
      @selected_menu = Item.treats_all 
    elsif x == 5 
      @selected_menu = Item.drinks_all 
    elsif x == 6 
      @selected_menu = Item.breakfast_all 
    elsif x == 7 
      @selected_menu = Item.all 
    elsif x == 99 
      start 
    end 
   
    z = asc_desc_input 
    until (z == "1" || z == "2" || z == "99")
      puts "I'm sorry, that's not an option here."
      z = asc_desc_input 
    end 
    
    if z == "1"
      
       y = asc_desc_attr_input
       until ((y == y.to_i && y > 0 && y < 13) || (y == 99))
         puts "I'm sorry, that's not an option here."
         y = asc_desc_attr_input
       end 
    if y == 1 
      f = (@selected_menu.sort_by {|item| item.protein}).reverse
      f.each do |item|
        puts "#{item.name} - #{item.protein}g protein"
      end 
    elsif y == 2 
       f = (@selected_menu.sort_by {|item| item.calories}).reverse
       f.each do |item|
        puts "#{item.name} - #{item.calories} calories"
       end
    elsif y == 3 
       f = (@selected_menu.sort_by {|item| item.fat}).reverse
       f.each do |item|
        puts "#{item.name} - #{item.fat}g fat"
       end
    elsif y == 4 
       f = (@selected_menu.sort_by {|item| item.sugar}).reverse
       f.each do |item|
        puts "#{item.name} - #{item.sugar}g sugar"
       end
    elsif y == 5 
       f = (@selected_menu.sort_by {|item| item.complex_carbs}).reverse
       f.each do |item|
        puts "#{item.name} - #{item.complex_carbs}g complex carbs"
       end
    elsif y == 6 
       f = (@selected_menu.sort_by {|item| item.total_carbs}).reverse
       f.each do |item|
        puts "#{item.name} - #{item.total_carbs}g total carbs"
       end
    elsif y == 7 
       f = (@selected_menu.sort_by {|item| item.pct_cal_by_protein}).reverse
       f.each do |item|
        puts "#{item.name} - #{item.pct_cal_by_protein}% of calories from protein"
       end
    elsif y == 8 
       f = (@selected_menu.sort_by {|item| item.pct_cal_by_fat}).reverse
       f.each do |item|
        puts "#{item.name} - #{item.pct_cal_by_fat}% of calories from fat"
       end
    elsif y == 9  
       f = (@selected_menu.sort_by {|item| item.pct_cal_by_sc}).reverse
       f.each do |item|
        puts "#{item.name} - #{item.pct_cal_by_sc}% of calories from sugar"
       end
    elsif y == 10 
       f = (@selected_menu.sort_by {|item| item.pct_cal_by_cc}).reverse
       f.each do |item|
        puts "#{item.name} - #{item.pct_cal_by_cc}% of calories from complex carbs"
       end
    elsif y == 11 
       f = (@selected_menu.sort_by {|item| item.pct_cal_by_tc}).reverse
       f.each do |item|
        puts "#{item.name} - #{item.pct_cal_by_tc}% of calories from total carbs"
       end
    elsif y == 12 
       f = (@selected_menu.sort_by {|item| item.cal_per_protein}).reverse
       f.each do |item|
        puts "#{item.name} - #{item.cal_per_protein} calories per gram of protein"
       end
    elsif y == 99 
      start 
    end 
    
    elsif z == "2"
       
       puts "Please select an attribute by which to sort this menu:"
       list_attributes
       puts "99. start the app over"
       y = gets.strip.to_f
       until ((y == y.to_i && y > 0 && y < 13) || (y == 99))
         puts "I'm sorry, that's not an option here."
         puts "Please select an attribute by which to sort this menu:"
         list_attributes
         puts "99. start the app over"
         y = gets.strip.to_f
       end 
    if y == 1 
      f = @selected_menu.sort_by {|item| item.protein}
      f.each do |item|
        puts "#{item.name} - #{item.protein}g protein"
      end 
    elsif y == 2 
       f = @selected_menu.sort_by {|item| item.calories}  
       f.each do |item|
        puts "#{item.name} - #{item.calories} calories"
       end
    elsif y == 3 
       f = @selected_menu.sort_by {|item| item.fat}
       f.each do |item|
        puts "#{item.name} - #{item.fat}g fat"
       end
    elsif y == 4 
       f = @selected_menu.sort_by {|item| item.sugar}
       f.each do |item|
        puts "#{item.name} - #{item.sugar}g sugar"
       end
    elsif y == 5 
       f = @selected_menu.sort_by {|item| item.complex_carbs}
       f.each do |item|
        puts "#{item.name} - #{item.complex_carbs}g complex carbs"
       end
    elsif y == 6 
       f = @selected_menu.sort_by {|item| item.total_carbs}
       f.each do |item|
        puts "#{item.name} - #{item.total_carbs}g total carbs"
       end
    elsif y == 7 
       f = @selected_menu.sort_by {|item| item.pct_cal_by_protein}
       f.each do |item|
        puts "#{item.name} - #{item.pct_cal_by_protein}% of calories from protein"
       end
    elsif y == 8 
       f = @selected_menu.sort_by {|item| item.pct_cal_by_fat}
       f.each do |item|
        puts "#{item.name} - #{item.pct_cal_by_fat}% of calories from fat"
       end
    elsif y == 9  
       f = @selected_menu.sort_by {|item| item.pct_cal_by_sc}
       f.each do |item|
        puts "#{item.name} - #{item.pct_cal_by_sc}% of calories from sugar"
       end
    elsif y == 10 
       f = @selected_menu.sort_by {|item| item.pct_cal_by_cc}
       f.each do |item|
        puts "#{item.name} - #{item.pct_cal_by_cc}% of calories from complex carbs"
       end
    elsif y == 11 
       f = @selected_menu.sort_by {|item| item.pct_cal_by_tc}
       f.each do |item|
        puts "#{item.name} - #{item.pct_cal_by_tc}% of calories from total carbs"
       end
    elsif y == 12 
       f = @selected_menu.sort_by {|item| item.cal_per_protein}
       f.each do |item|
        puts "#{item.name} - #{item.cal_per_protein} calories per gram of protein"
       end
    elsif y == 99 
      start 
    end 
    
    elsif z == "99"
      start 
    end 
   
   puts " "
   puts "Enter anything to start the app over"
   q = gets.strip
   start 
   
  end 
  
  def individual_item_path_post_menu_select(item_all_orig_class_var)
    display_menu(item_all_orig_class_var)
      y = gets.strip.to_f  
        until (y.to_f == y.to_i && (y > 0 && y < item_all_orig_class_var.length + 1)) || y == 99
          puts "I'm sorry, that's not an option here."
          display_menu(item_all_orig_class_var)
          y = gets.strip.to_f
        end 
        if y == 99 
          start 
        end 
        a = 1 
          item_all_orig_class_var.length.times {
            if y == a 
              display_item(item_all_orig_class_var[a-1])
            end 
            a += 1
          }
  end 
  
  def individual_item_path 
    list_menus
    puts "99. Start the app over"
    x = gets.strip 
    if x == "1" 
      individual_item_path_post_menu_select(Item.entrees_all_orig, 17)
    elsif x == "2" 
      individual_item_path_post_menu_select(Item.salads_all_orig, 4)
    elsif x == "3" 
      individual_item_path_post_menu_select(Item.sides_all_orig, 8)
    elsif x == "4" 
      individual_item_path_post_menu_select(Item.treats_all_orig, 18)
    elsif x == "5" 
      individual_item_path_post_menu_select(Item.drinks_all_orig, 7)
    elsif x == "6" 
      individual_item_path_post_menu_select(Item.breakfast_all_orig, 15)
    elsif x == "99" 
      start 
    else 
      puts "I'm sorry, that's not an option here."
      individual_item_path 
    end
  end 

  def find_in_range
    list_menus
    puts "7.  Entire menu"
    puts "99. Start the app over"
    x = gets.strip.to_f
    if x != x.to_i || x < 1 || x > 99 || (x > 7 && x < 99)
      puts "I'm sorry, that's not an option here."
      find_in_range
    end 
    if x == 1 
      @selected_menu = Item.entrees_all_orig 
    elsif x == 2 
      @selected_menu = Item.salads_all_orig 
    elsif x == 3 
      @selected_menu = Item.sides_all_orig 
    elsif x == 4 
      @selected_menu = Item.treats_all_orig 
    elsif x == 5 
      @selected_menu = Item.drinks_all_orig 
    elsif x == 6 
      @selected_menu = Item.breakfast_all_orig 
    elsif x == 7 
      @selected_menu = Item.all_orig  
    elsif x == 99 
      start 
    end 
    
    puts "Please select the nutritional attribute you'd like to find items for:"
    list_attributes
    puts "99. Start the app over"
    y = gets.strip.to_f
     
    until ((y == y.to_i && y > 0 && y < 13) || y == 99) 
      puts "Sorry, that is not an option here."
      list_attributes
      puts "99. Start the app over"
      y = gets.strip.to_f
    end 
    
    if y == 99 
      start
    end
    
    puts "Please enter the number for the low end of the range you are looking for items within:"
    z = gets.strip.to_f
    
    until z > 0 
      puts "Sorry, that is not an option here."
      puts "Please enter the number for the low end of the range you are looking for items within:"
      z = gets.strip
    end 
    
    puts "Please enter the number for the high end of the range you are looking for items within:"
    a = gets.strip.to_f
    
    until a > z
      puts "Sorry, that is not an option here."
      puts "Please enter the number for the high end of the range you are looking for items within:"
      a = gets.strip
    end 
    
    if y == 1
      b = @selected_menu.find_all {|item| item.protein >= z && item.protein <= a} 
      b.each do |item|
        puts "#{item.name} - #{item.protein}g protein"
      end 
    elsif y == 2
      b = @selected_menu.find_all {|item| item.calories >= z && item.calories <= a} 
      b.each do |item|
        puts "#{item.name} - #{item.calories} calories"
      end 
     elsif y == 3
      b = @selected_menu.find_all {|item| item.fat >= z && item.fat <= a} 
      b.each do |item|
        puts "#{item.name} - #{item.fat}g fat"
      end 
     elsif y == 4
      b = @selected_menu.find_all {|item| item.sugar >= z && item.sugar <= a} 
      b.each do |item|
        puts "#{item.name} - #{item.sugar}g sugar"
      end 
     elsif y == 5
      b = @selected_menu.find_all {|item| item.complex_carbs >= z && item.complex_carbs <= a} 
      b.each do |item|
        puts "#{item.name} - #{item.complex_carbs}g complex carbs"
      end 
     elsif y == 6
      b = @selected_menu.find_all {|item| item.total_carbs >= z && item.total_carbs <= a} 
      b.each do |item|
        puts "#{item.name} - #{item.total_carbs}g total carbs"
      end 
     elsif y == 7
      b = @selected_menu.find_all {|item| item.pct_cal_by_protein >= z && item.pct_cal_by_protein <= a} 
      b.each do |item|
        puts "#{item.name} - #{item.pct_cal_by_protein}% of calories from protein"
      end 
     elsif y == 8
      b = @selected_menu.find_all {|item| item.pct_cal_by_fat >= z && item.pct_cal_by_fat <= a} 
      b.each do |item|
        puts "#{item.name} - #{item.pct_cal_by_fat}% of calories from fat"
      end 
     elsif y == 9
      b = @selected_menu.find_all {|item| item.pct_cal_by_sc >= z && item.pct_cal_by_sc <= a} 
      b.each do |item|
        puts "#{item.name} - #{item.pct_cal_by_sc}% of calories from sugar"
      end 
     elsif y == 10
      b = @selected_menu.find_all {|item| item.pct_cal_by_cc >= z && item.pct_cal_by_cc <= a} 
      b.each do |item|
        puts "#{item.name} - #{item.pct_cal_by_cc}% of calories from complex carbs"
      end 
     elsif y == 11
      b = @selected_menu.find_all {|item| item.pct_cal_by_tc >= z && item.pct_cal_by_tc <= a} 
      b.each do |item|
        puts "#{item.name} - #{item.pct_cal_by_tc}% of calories from total carbs"
      end 
     elsif y == 12
      b = @selected_menu.find_all {|item| item.cal_per_protein >= z && item.cal_per_protein <= a} 
      b.each do |item|
        puts "#{item.name} - #{item.cal_per_protein} calories per gram of protein"
      end 
     end 
      puts "Please enter anything to start the app over."
      c = gets.strip 
      start 
  end
  
end 