class Household < ActiveRecord::Base
  attr_accessible :adult_one_email, :adult_one_firstname, :adult_one_lastname, :adult_one_phone, :adult_one_text, :adult_two_email, :adult_two_firstname, :adult_two_lastname, :adult_two_phone, :adult_two_text, :city, :email, :phone, :street, :zip, :show_information
  
  has_many :students, :foreign_key => :primary_household_id
  has_many :secondary_students, :foreign_key => :secondary_household_id
  
  def adults
    if adult_one_lastname == adult_two_lastname
      "#{adult_one_firstname} & #{adult_two_firstname} #{adult_one_lastname}"
    elsif adult_two_firstname.blank? and adult_two_lastname.blank?
      "#{adult_one_firstname} #{adult_one_lastname}"
    elsif adult_one_lastname != adult_two_lastname
      "#{adult_one_firstname} #{adult_one_lastname} & #{adult_two_firstname} #{adult_two_lastname}"
    end
  end
  
  def address
    "#{street}, #{city} #{zip}"
  end
  
  def adult_one_fullname
    "#{adult_one_firstname} #{adult_one_lastname}"
  end

  def adult_two_fullname
    "#{adult_two_firstname} #{adult_two_lastname}"
  end
  
  def token
    Digest::MD5.hexdigest("#{students[0].firstname}#{id}#{Rails.configuration.secret_phrase}")
  end
end
