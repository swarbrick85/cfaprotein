require "cfaprotein/version"

module Cfaprotein
  class Error < StandardError; end
  
  def create_menu
    a = 0 
    b.times{
      if (front_page.css("td")[c + 10 + (11 * a)].text != "0")
         x = Item.new 
         Item."#{d}"_all << x 
         z = front_page.css("td")[c + (11 * a)].text 
         z[0...11] = ""
         x.name = z 
         x.calories = front_page.css("td")[c + 1 + (11 * a)].text
         x.fat = front_page.css("td")[c + 2 + (11 * a)].text
         x.total_carbs = front_page.css("td")[c + 7 + (11 * a)].text
         x.sugar = front_page.css("td")[12 + (c + 9 * a)].text
         x.protein = front_page.css("td")[c + 10 + (11 * a)].text
       end 
       
      a += 1
    }
     
  end
  
  def calculate 
    :pct_cal_by_protein, :pct_cal_by_fat, :pct_cal_by_sc, :pct_cal_by_cc, :pct_cal_by_tc, :cal_per_protein
    
    x.
  end 
end
