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








end 