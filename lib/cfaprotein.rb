require "cfaprotein/version"

module Cfaprotein
  class Error < StandardError; end
  def create_breakfast_menu
    a = 0 
    15.times{
      if (front_page.css("td")[13 + (11 * a)].text != "0")
         x = Item.new 
         Item.breakfast_all << x 
         z = front_page.css("td")[3 + (11 * a)].text 
         z[0...11] = ""
         x.name = z 
         x.calories = front_page.css("td")[4 + (11 * a)].text
         x.fat = front_page.css("td")[5 + (11 * a)].text
         x.total_carbs = front_page.css("td")[10 + (11 * a)].text
         x.sugar = front_page.css("td")[12 + (11 * a)].text
         x.protein = front_page.css("td")[13 + (11 * a)].text
       end 
       
      a += 1
    }
     
  end 
end
