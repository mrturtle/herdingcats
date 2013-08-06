class HouseholdMailer < ActionMailer::Base
  
  def verify_information(household)
      @household = household
      recipients = [@household.email, @household.adult_one_email, @household.adult_two_email].compact.join(",")
      mail(to: recipients, subject: Rails.configuration.email_subject) do |format|
        format.text
        format.html
      end
    end
end
