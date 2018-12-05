require_relative './environment.rb'

require 'nokogiri'
require 'open-uri'
require 'pry'

class Item 
  
  attr_accessor :name, :protein, :fat, :complex_carbs, :sugar, :total_carbs, :calories, :pct_cal_by_protein, :pct_cal_by_fat, :pct_cal_by_sc, :pct_cal_by_cc, :pct_cal_by_tc, :cal_per_protein
  
  @@breakfast_all = []
  @@entrees_all = [] 
  @@salads_all = []
  @@sides_all = []
  @@treats_all = []
  @@drinks_all = []
  
  
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
end 