require_relative './cfaprotein.rb'

class Cli 
  
  attr_accessor :selected_menu, :selected_attr, :selected_asc_desc
  
  def display_menu(item_all_class_variable)
    a = 1 
    puts "Please select one of the following options:"
    item_all_class_variable.each do |item|
      puts "#{a}. #{item.name}"
      a += 1 
    end 
    puts "30. Start the app over"
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
  
  def sort_asc(item_all_class_variable, attribute)
    x = item_all_class_variable.sort_by {|item| item.attribute}
    x
  end
  
  def sort_desc(item_all_class_variable, attribute)
    x = (item_all_class_variable.sort_by {|item| item.attribute}).reverse 
    x
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
  
  def start 
    puts "Hi, welcome to CFA Protein!"
    puts "This app exclusively addresses items on the menu that have at least 1 gram of protein."
    puts "It allows you to look at nutritional information about individual menu items. It also allows you to list menu items according to a particular nutritional attribute, in either ascending or descending order. Additionally you can search for menu items within a given range for a particular nutritional attribute."
    puts "When you see a numbered list please enter the number of the option you'd like to select."
    puts "If you make a selection and are returned to a prior menu, it means:"
    puts "  1. There are no items within the parameters you set out."
    puts "  2. You made an invalid entry of some kind."
    puts "  3. Our app is out of date. Please feel free to email me at fakeemail@gmail.com"
    puts "At any time you can press ctrl + C to exit the app."
    puts "Please make a selection from the following:"
    puts "  1. I'd like to look at individual menu items."
    puts "  2. I'd like to list menu items according to an attribute, in ascending or descending order (for example, you can list menu items with the most protein to the item with the least protein)."
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

  def asc_desc
    list_menus
    puts "7.  The entire menu"
    puts "30. Start the app over"
    x = gets.strip.to_f 
    if x != x.to_i || x < 1 || x > 30 || (x > 7 && x < 30)
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
    elsif x == 30 
      start 
    end 
    
    puts "Please select from the following:"
    puts "1.  Sort the menu in descending order"
    puts "2.  Sort the menu in ascending order"
    puts "30. Start the app over"
    z = gets.strip 
    until (z == "1" || z == "2" || z == "30")
      puts "I'm sorry, that's not an option here."
      puts "Please select from the following:"
      puts "1.  Sort in descending order"
      puts "2.  Sort in ascending order"
      puts "30. Start the app over"
    end 
    if z == "1"
      @selected_asc_desc = "desc"
    elsif z == "2"
      @selected_asc_desc = "asc"
    elsif z == "30"
      start
    end 
    
    
    puts "Please select an attribute by which to sort this menu:"
    list_attributes
    puts "30. start the app over"
    y = gets.strip.to_f
    until ((y == y.to_i && y > 0 && y < 13) || (y == 30))
      puts "I'm sorry, that's not an option here."
      puts "Please select an attribute by which to sort this menu:"
      list_attributes
       puts "30. start the app over"
      y = gets.strip.to_f
    end 
    if y == 1 
      @selected_attr = "protein"
    elsif y == 2 
      @selected_attr = "calories"
    elsif y == 3 
      @selected_attr = "fat"
    elsif y == 4 
      @selected_attr = "sugar"
    elsif y == 5 
      @selected_attr = "complex_carbs"
    elsif y == 6 
      @selected_attr = "total_carbs"
    elsif y == 7 
      @selected_attr = "pct_cal_by_protein"
    elsif y == 8 
      @selected_attr = "pct_cal_by_fat"
    elsif y == 9  
      @selected_attr = "pct_cal_by_sc"
    elsif y == 10 
      @selected_attr = "pct_cal_by_cc"
    elsif y == 11 
      @selected_attr = "pct_cal_by_tc" 
    elsif y == 12 
      @selected_attr = "cal_per_protein"
    elsif y == 30 
      start 
    end 
    
  end 
  
  def individual_item_path 
    list_menus
    puts "30. Start the app over"
    x = gets.strip 
    if x == "1" 
      display_menu(Item.entrees_all_orig)
      y = gets.strip.to_f  
        until (y.to_f == y.to_i && (y > 0 && y < 18)) || y == 30
          puts "I'm sorry, that's not an option here."
          display_menu(Item.entrees_all_orig)
          y = gets.strip.to_f
        end 
        if y == 30 
          start 
        end 
        a = 1 
          17.times {
            if y == a 
              display_item(Item.entrees_all_orig[a-1])
            end 
            a += 1
          }
    elsif x == "2" 
      display_menu(Item.salads_all_orig)
        z = gets.strip.to_f  
          until (z.to_f == z.to_i && (z > 0 && z < 5)) || z == 30
            puts "I'm sorry, that's not an option here."
            display_menu(Item.salads_all_orig)
            z = gets.strip.to_f
          end
          if z == 30 
            start 
          end
        b = 1 
          4.times {
            if z == b 
              display_item(Item.salads_all_orig[b-1])
            end 
            b += 1
          }
    elsif x == "3" 
      display_menu(Item.sides_all_orig)
        w = gets.strip.to_f  
          until (w.to_f == w.to_i && (w > 0 && w < 9)) || w == 30
            puts "I'm sorry, that's not an option here."
            display_menu(Item.sides_all_orig)
            w = gets.strip.to_f
          end
          if w == 30 
            start 
          end
        c = 1 
          8.times {
            if w == c 
              display_item(Item.sides_all_orig[c-1])
            end 
            c += 1
          }
    elsif x == "4" 
      display_menu(Item.treats_all_orig)
        v = gets.strip.to_f  
          until (v.to_f == v.to_i && (v > 0 && v < 19)) || v == 30
            puts "I'm sorry, that's not an option here."
            display_menu(Item.treats_all_orig)
            v = gets.strip.to_f
          end
          if v == 30 
            start 
          end
        d = 1 
          18.times {
            if v == d 
              display_item(Item.treats_all_orig[d-1])
            end 
            d += 1
          }
    elsif x == "5" 
      display_menu(Item.drinks_all_orig)
        u = gets.strip.to_f  
          until (u.to_f == u.to_i && (u > 0 && u < 8)) || u == 30
            puts "I'm sorry, that's not an option here."
            display_menu(Item.drinks_all_orig)
            u = gets.strip.to_f
          end  
          if u == 30 
            start 
          end
        e = 1 
          7.times {
            if u == e 
              display_item(Item.drinks_all_orig[e-1])
            end 
            e += 1
          }
    elsif x == "6" 
      display_menu(Item.breakfast_all_orig)
        t = gets.strip.to_f  
          until (t.to_f == t.to_i && (t > 0 && t < 16)) || t == 30
            puts "I'm sorry, that's not an option here."
            display_menu(Item.breakfast_all_orig)
            t = gets.strip.to_f
          end  
          if t == 30 
            start 
          end
        f = 1 
          15.times {
            if t == f 
              display_item(Item.breakfast_all_orig[f-1])
            end 
            f += 1
          }
          
    elsif x == "30" 
      start 
    else 
      puts "I'm sorry, that's not an option here."
      individual_item_path 
    end
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
  
  
  
  
  
  
  
end 