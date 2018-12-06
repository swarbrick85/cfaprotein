Module clifunctions 
  def display_menu(item_all_class_variable)
    a = 1 
    item_all_class_variable.each do |item|
      puts "#{a}. #{item.name}"
      a += 1 
    end 
  end 
  
  def sort_asc(item_all_class_variable, attribute)
    item_all_class_variable.sort_by {|item| item.attribute}
  end
  
  def sort_desc(item_all_class_variable, attribute)
    (item_all_class_variable.sort_by {|item| item.attribute}).reverse 
  end

  def start 
    puts "Hi, welcome to CFA Protein!"
    puts "This app exclusively addresses items on the menu that have at least 1 gram of protein."
    puts "It allows you to look at nutritional information about individual menu items. It also allows you to list menu items according to a particular nutritional attribute, in either ascending or descending order. Additionally you can search for menu items within a given range for a particular nutritional attribute."
    puts "When you see a numbered list please enter the number of the option you'd like to select."
    puts "If you make a selection and are returned to a prior menu, it means:"
    puts "  1. There are no items within the parameters you set out."
    puts "  2. You made an invalid entry of some kind."
    puts "  3. Our app is out of date. Please feel free to email us at"
    puts "Please make a selection from the following:"
    puts "  1. I'd like to look at individual menu items."
    puts "  2. I'd like to compare items."
    
  end 






end 