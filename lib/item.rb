require_relative './cfaprotein.rb'


class Item 
  
  attr_accessor :name, :protein, :fat, :complex_carbs, :sugar, :total_carbs, :calories, :pct_cal_by_protein, :pct_cal_by_fat, :pct_cal_by_sc, :pct_cal_by_cc, :pct_cal_by_tc, :cal_per_protein
  
  def initialize(item_all_class_variable, item_all_original_class_variable, name, protein, calories, fat, sugar, complex_carbs, total_carbs, pct_cal_by_protein, pct_cal_by_fat, pct_cal_by_sc, pct_cal_by_cc, pct_cal_by_tc, cal_per_protein)
    
    item_all_class_variable << x 
    item_all_original_class_variable << x
    Item.all << x 
    Item.all_orig << x
    
    @name = name 
    @protein = protein 
    @calories = calories 
    @fat = fat 
    @sugar = sugar 
    @complex_carbs = complex_carbs 
    @total_carbs = total_carbs 
    @pct_cal_by_protein = pct_cal_by_protein 
    @pct_cal_by_fat = pct_cal_by_fat 
    @pct_cal_by_sc = pct_cal_by_sc 
    @pct_cal_by_cc = pct_cal_by_cc 
    @pct_cal_by_tc = pct_cal_by_tc 
    @cal_per_protein = cal_per_protein
  end 
  
  
  @@breakfast_all = []
  @@entrees_all = [] 
  @@salads_all = []
  @@sides_all = []
  @@treats_all = []
  @@drinks_all = []
  @@all = []
  
  @@breakfast_all_orig = []
  @@entrees_all_orig = []
  @@salads_all_orig = []
  @@sides_all_orig = []
  @@treats_all_orig = []
  @@drinks_all_orig = []
  @@all_orig = []
  
  def self.breakfast_all
    @@breakfast_all
  end
  
  def self.entrees_all
    @@entrees_all
  end
  
  def self.salads_all
    @@salads_all
  end
  
  def self.sides_all
    @@sides_all
  end
  
  def self.treats_all
    @@treats_all
  end
  
  def self.drinks_all
    @@drinks_all
  end
  
  def self.all 
    @@all 
  end   
  
  def self.breakfast_all_orig
    @@breakfast_all_orig
  end
  
  def self.entrees_all_orig
    @@entrees_all_orig
  end
  
  def self.salads_all_orig
    @@salads_all_orig
  end
  
  def self.sides_all_orig
    @@sides_all_orig
  end
  
  def self.treats_all_orig
    @@treats_all_orig
  end
  
  def self.drinks_all_orig
    @@drinks_all_orig
  end
  
  def self.all_orig 
    @@all_orig 
  end   
  
  def self.clear_all 
    @@breakfast_all = []
    @@entrees_all = [] 
    @@salads_all = []
    @@sides_all = []
    @@treats_all = []
    @@drinks_all = []
    @@all = []
    @@breakfast_all_orig = []
    @@entrees_all_orig = []
    @@salads_all_orig = []
    @@sides_all_orig = []
    @@treats_all_orig = []
    @@drinks_all_orig = []
    @@all_orig = []
  end
end 