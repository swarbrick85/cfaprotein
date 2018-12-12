require_relative './cfaprotein.rb'

class Cli 
  
  attr_accessor :selected_menu
  
  def display_menu(item_all_class_variable)
    counter = 1 
    puts "Please select one of the following options:"
    item_all_class_variable.each do |item|
      puts "#{a}. #{item.name}"
      counter += 1 
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
    input = gets.strip
    if input == "1" 
      individual_item_path
    elsif input == "2" 
      asc_desc
    elsif input == "3"
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
    input = gets.strip.to_f 
    if input != input.to_i || input < 1 || input > 99 || (input > 7 && input < 99)
      puts "I'm sorry, that's not an option here."
      asc_desc
    end 
    if input == 1 
      @selected_menu = Item.entrees_all 
    elsif input == 2 
      @selected_menu = Item.salads_all 
    elsif input == 3 
      @selected_menu = Item.sides_all 
    elsif input == 4 
      @selected_menu = Item.treats_all 
    elsif input == 5 
      @selected_menu = Item.drinks_all 
    elsif input == 6 
      @selected_menu = Item.breakfast_all 
    elsif input == 7 
      @selected_menu = Item.all 
    elsif input == 99 
      start 
    end 
   
    input2 = asc_desc_input 
    until (input2 == "1" || input2 == "2" || input2 == "99")
      puts "I'm sorry, that's not an option here."
      input2 = asc_desc_input 
    end 
    
    if input2 == "1"
      
       input3 = asc_desc_attr_input
       until ((input3 == input3.to_i && input3 > 0 && input3 < 13) || (input3 == 99))
         puts "I'm sorry, that's not an option here."
         input3 = asc_desc_attr_input
       end 
    if input3 == 1 
      sorted = (@selected_menu.sort_by {|item| item.protein}).reverse
      sorted.each do |item|
        puts "#{item.name} - #{item.protein}g protein"
      end 
    elsif input3 == 2 
       sorted = (@selected_menu.sort_by {|item| item.calories}).reverse
       sorted.each do |item|
        puts "#{item.name} - #{item.calories} calories"
       end
    elsif input3 == 3 
       sorted = (@selected_menu.sort_by {|item| item.fat}).reverse
       sorted.each do |item|
        puts "#{item.name} - #{item.fat}g fat"
       end
    elsif input3 == 4 
       sorted = (@selected_menu.sort_by {|item| item.sugar}).reverse
       sorted.each do |item|
        puts "#{item.name} - #{item.sugar}g sugar"
       end
    elsif input3 == 5 
       sorted = (@selected_menu.sort_by {|item| item.complex_carbs}).reverse
       sorted.each do |item|
        puts "#{item.name} - #{item.complex_carbs}g complex carbs"
       end
    elsif input3 == 6 
       sorted = (@selected_menu.sort_by {|item| item.total_carbs}).reverse
       sorted.each do |item|
        puts "#{item.name} - #{item.total_carbs}g total carbs"
       end
    elsif input3 == 7 
       sorted = (@selected_menu.sort_by {|item| item.pct_cal_by_protein}).reverse
       sorted.each do |item|
        puts "#{item.name} - #{item.pct_cal_by_protein}% of calories from protein"
       end
    elsif input3 == 8 
       sorted = (@selected_menu.sort_by {|item| item.pct_cal_by_fat}).reverse
       sorted.each do |item|
        puts "#{item.name} - #{item.pct_cal_by_fat}% of calories from fat"
       end
    elsif input3 == 9  
       sorted = (@selected_menu.sort_by {|item| item.pct_cal_by_sc}).reverse
       sorted.each do |item|
        puts "#{item.name} - #{item.pct_cal_by_sc}% of calories from sugar"
       end
    elsif input3 == 10 
       sorted = (@selected_menu.sort_by {|item| item.pct_cal_by_cc}).reverse
       sorted.each do |item|
        puts "#{item.name} - #{item.pct_cal_by_cc}% of calories from complex carbs"
       end
    elsif input3 == 11 
       sorted = (@selected_menu.sort_by {|item| item.pct_cal_by_tc}).reverse
       sorted.each do |item|
        puts "#{item.name} - #{item.pct_cal_by_tc}% of calories from total carbs"
       end
    elsif input3 == 12 
       sorted = (@selected_menu.sort_by {|item| item.cal_per_protein}).reverse
       sorted.each do |item|
        puts "#{item.name} - #{item.cal_per_protein} calories per gram of protein"
       end
    elsif input3 == 99 
      start 
    end 
    
    elsif input2 == "2"
       
       puts "Please select an attribute by which to sort this menu:"
       list_attributes
       puts "99. start the app over"
       input3 = gets.strip.to_f
       until ((input3 == input3.to_i && input3 > 0 && input3 < 13) || (input3 == 99))
         puts "I'm sorry, that's not an option here."
         puts "Please select an attribute by which to sort this menu:"
         list_attributes
         puts "99. start the app over"
         input3 = gets.strip.to_f
       end 
    if input3 == 1 
      sorted = @selected_menu.sort_by {|item| item.protein}
      sorted.each do |item|
        puts "#{item.name} - #{item.protein}g protein"
      end 
    elsif input3 == 2 
       sorted = @selected_menu.sort_by {|item| item.calories}  
       sorted.each do |item|
        puts "#{item.name} - #{item.calories} calories"
       end
    elsif input3 == 3 
       sorted = @selected_menu.sort_by {|item| item.fat}
       sorted.each do |item|
        puts "#{item.name} - #{item.fat}g fat"
       end
    elsif input3 == 4 
       sorted = @selected_menu.sort_by {|item| item.sugar}
       sorted.each do |item|
        puts "#{item.name} - #{item.sugar}g sugar"
       end
    elsif input3 == 5 
       sorted = @selected_menu.sort_by {|item| item.complex_carbs}
       sorted.each do |item|
        puts "#{item.name} - #{item.complex_carbs}g complex carbs"
       end
    elsif input3 == 6 
       sorted = @selected_menu.sort_by {|item| item.total_carbs}
       sorted.each do |item|
        puts "#{item.name} - #{item.total_carbs}g total carbs"
       end
    elsif input3 == 7 
       sorted = @selected_menu.sort_by {|item| item.pct_cal_by_protein}
       sorted.each do |item|
        puts "#{item.name} - #{item.pct_cal_by_protein}% of calories from protein"
       end
    elsif input3 == 8 
       sorted = @selected_menu.sort_by {|item| item.pct_cal_by_fat}
       sorted.each do |item|
        puts "#{item.name} - #{item.pct_cal_by_fat}% of calories from fat"
       end
    elsif input3 == 9  
       sorted = @selected_menu.sort_by {|item| item.pct_cal_by_sc}
       sorted.each do |item|
        puts "#{item.name} - #{item.pct_cal_by_sc}% of calories from sugar"
       end
    elsif input3 == 10 
       sorted = @selected_menu.sort_by {|item| item.pct_cal_by_cc}
       sorted.each do |item|
        puts "#{item.name} - #{item.pct_cal_by_cc}% of calories from complex carbs"
       end
    elsif input3 == 11 
       sorted = @selected_menu.sort_by {|item| item.pct_cal_by_tc}
       sorted.each do |item|
        puts "#{item.name} - #{item.pct_cal_by_tc}% of calories from total carbs"
       end
    elsif input3 == 12 
       sorted = @selected_menu.sort_by {|item| item.cal_per_protein}
       sorted.each do |item|
        puts "#{item.name} - #{item.cal_per_protein} calories per gram of protein"
       end
    elsif input3 == 99 
      start 
    end 
    
    elsif input2 == "99"
      start 
    end 
   
   puts " "
   puts "Enter anything to start the app over"
   gets.strip
   start 
   
  end 
  
  def individual_item_path_post_menu_select(item_all_orig_class_var)
    display_menu(item_all_orig_class_var)
      input = gets.strip.to_f  
        until (input.to_f == input.to_i && (input > 0 && input < item_all_orig_class_var.length + 1)) || input == 99
          puts "I'm sorry, that's not an option here."
          display_menu(item_all_orig_class_var)
          input = gets.strip.to_f
        end 
        if input == 99 
          start 
        end 
        counter = 1 
          item_all_orig_class_var.length.times {
            if input == a 
              display_item(item_all_orig_class_var[a-1])
            end 
            counter += 1
          }
  end 
  
  def individual_item_path 
    list_menus
    puts "99. Start the app over"
    input = gets.strip 
    if input == "1" 
      individual_item_path_post_menu_select(Item.entrees_all_orig)
    elsif input == "2" 
      individual_item_path_post_menu_select(Item.salads_all_orig)
    elsif input == "3" 
      individual_item_path_post_menu_select(Item.sides_all_orig)
    elsif input == "4" 
      individual_item_path_post_menu_select(Item.treats_all_orig)
    elsif input == "5" 
      individual_item_path_post_menu_select(Item.drinks_all_orig)
    elsif input == "6" 
      individual_item_path_post_menu_select(Item.breakfast_all_orig)
    elsif input == "99" 
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
    input = gets.strip.to_f
    if input != input.to_i || input < 1 || input > 99 || (input > 7 && input < 99)
      puts "I'm sorry, that's not an option here."
      find_in_range
    end 
    if input == 1 
      @selected_menu = Item.entrees_all_orig 
    elsif input == 2 
      @selected_menu = Item.salads_all_orig 
    elsif input == 3 
      @selected_menu = Item.sides_all_orig 
    elsif input == 4 
      @selected_menu = Item.treats_all_orig 
    elsif input == 5 
      @selected_menu = Item.drinks_all_orig 
    elsif input == 6 
      @selected_menu = Item.breakfast_all_orig 
    elsif input == 7 
      @selected_menu = Item.all_orig  
    elsif input == 99 
      start 
    end 
    
    puts "Please select the nutritional attribute you'd like to find items for:"
    list_attributes
    puts "99. Start the app over"
    input2 = gets.strip.to_f
     
    until ((input2 == input2.to_i && input2 > 0 && input2 < 13) || input2 == 99) 
      puts "Sorry, that is not an option here."
      list_attributes
      puts "99. Start the app over"
      input2 = gets.strip.to_f
    end 
    
    if input2 == 99 
      start
    end
    
    puts "Please enter the number for the low end of the range you are looking for items within:"
    input3 = gets.strip.to_f
    
    until input3 > 0 
      puts "Sorry, that is not an option here."
      puts "Please enter the number for the low end of the range you are looking for items within:"
      input3 = gets.strip.to_f
    end 
    
    puts "Please enter the number for the high end of the range you are looking for items within:"
    input4 = gets.strip.to_f
    
    until input4 > input3
      puts "Sorry, that is not an option here."
      puts "Please enter the number for the high end of the range you are looking for items within:"
      input4 = gets.strip.to_f
    end 
    
    if input2 == 1
      b = @selected_menu.find_all {|item| item.protein >= input3 && item.protein <= input4} 
      b.each do |item|
        puts "#{item.name} - #{item.protein}g protein"
      end 
    elsif input2 == 2
      b = @selected_menu.find_all {|item| item.calories >= input3 && item.calories <= a} 
      b.each do |item|
        puts "#{item.name} - #{item.calories} calories"
      end 
     elsif input2 == 3
      b = @selected_menu.find_all {|item| item.fat >= input3 && item.fat <= a} 
      b.each do |item|
        puts "#{item.name} - #{item.fat}g fat"
      end 
     elsif input2 == 4
      b = @selected_menu.find_all {|item| item.sugar >= input3 && item.sugar <= a} 
      b.each do |item|
        puts "#{item.name} - #{item.sugar}g sugar"
      end 
     elsif input2 == 5
      b = @selected_menu.find_all {|item| item.complex_carbs >= input3 && item.complex_carbs <= a} 
      b.each do |item|
        puts "#{item.name} - #{item.complex_carbs}g complex carbs"
      end 
     elsif input2 == 6
      b = @selected_menu.find_all {|item| item.total_carbs >= input3 && item.total_carbs <= a} 
      b.each do |item|
        puts "#{item.name} - #{item.total_carbs}g total carbs"
      end 
     elsif input2 == 7
      b = @selected_menu.find_all {|item| item.pct_cal_by_protein >= input3 && item.pct_cal_by_protein <= a} 
      b.each do |item|
        puts "#{item.name} - #{item.pct_cal_by_protein}% of calories from protein"
      end 
     elsif input2 == 8
      b = @selected_menu.find_all {|item| item.pct_cal_by_fat >= input3 && item.pct_cal_by_fat <= a} 
      b.each do |item|
        puts "#{item.name} - #{item.pct_cal_by_fat}% of calories from fat"
      end 
     elsif input2 == 9
      b = @selected_menu.find_all {|item| item.pct_cal_by_sc >= input3 && item.pct_cal_by_sc <= a} 
      b.each do |item|
        puts "#{item.name} - #{item.pct_cal_by_sc}% of calories from sugar"
      end 
     elsif input2 == 10
      b = @selected_menu.find_all {|item| item.pct_cal_by_cc >= input3 && item.pct_cal_by_cc <= a} 
      b.each do |item|
        puts "#{item.name} - #{item.pct_cal_by_cc}% of calories from complex carbs"
      end 
     elsif input2 == 11
      b = @selected_menu.find_all {|item| item.pct_cal_by_tc >= input3 && item.pct_cal_by_tc <= a} 
      b.each do |item|
        puts "#{item.name} - #{item.pct_cal_by_tc}% of calories from total carbs"
      end 
     elsif input2 == 12
      b = @selected_menu.find_all {|item| item.cal_per_protein >= input3 && item.cal_per_protein <= a} 
      b.each do |item|
        puts "#{item.name} - #{item.cal_per_protein} calories per gram of protein"
      end 
     end 
      puts "Please enter anything to start the app over."
      c = gets.strip 
      start 
  end
  
end 