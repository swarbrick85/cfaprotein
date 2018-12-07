module Cfaprotein
  class Error < StandardError; end
  
  def initialize 
    @row_width = 11 
   
  end
  
  def create_menu(b, c, item_all_class_variable, item_all_original_class_variable)
    
      # b is number of items in that menu section 
    # c is the location of the first name of the first item in that menu section 
    # @row_width tells you how many spots are in each item's row, so to move from name to name within a menu section add @row_width. Same for protein to protein, etc. 
    
    a = 0 
     b.times{
      if (front_page.css("td")[c + 10 + (@row_width * a)].text != "0")
         x = Item.new 
         item_all_class_variable << x 
         item_all_original_class_variable << x
         Item.all << x 
         z = front_page.css("td")[c + (@row_width * a)].text 
         z[0...11] = ""
         x.name = z 
         x.calories = front_page.css("td")[c + 1 + (@row_width * a)].text.to_f.round(1)
         x.fat = front_page.css("td")[c + 2 + (@row_width * a)].text.to_f.round(1)
         x.total_carbs = front_page.css("td")[c + 7 + (@row_width * a)].text.to_f.round(1)
         x.sugar = front_page.css("td")[c + 9 + (@row_width * a)].text.to_f.round(1)
         x.protein = front_page.css("td")[c + 10 + (@row_width * a)].text.to_f.round(1)
        
         x.complex_carbs = (x.total_carbs - x.sugar).to_f.round(1)
        
         x.pct_cal_by_protein = (((x.protein * 4)/x.calories) * 100).round(1)
         x.pct_cal_by_fat = (((x.fat * 9)/x.calories) * 100).round(1)
         x.pct_cal_by_sc = (((x.sugar * 4)/x.calories) * 100).round(1)
         x.pct_cal_by_cc = (((x.complex_carbs * 4)/x.calories) * 100).round(1)
         x.pct_cal_by_tc = (((x.total_carbs * 4)/x.calories) * 100).round(1)
         x.cal_per_protein = (x.calories/x.protein).round(1)  
       end 
       
      a += 1
    }
    nil
  end
  
  
end
