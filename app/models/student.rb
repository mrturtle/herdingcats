class Student < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :primary_household_id, :school_class_id, :secondary_household_id
  
  belongs_to :school_class
  belongs_to :primary_household, :class_name => "Household"
  belongs_to :secondary_household, :class_name => "Household"
  
  
  def fullname
    "#{firstname} #{lastname}"
  end
end
