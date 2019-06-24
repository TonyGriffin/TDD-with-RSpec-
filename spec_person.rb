# Use TDD principles to build out name functionality for a Person.
# Here are the requirements:
# - Add a method to return the full name as a string. A full name includes
#   first, middle, and last name. If the middle name is missing, there shouldn't
#   have extra spaces.
# - Add a method to return a full name with a middle initial. If the middle name
#   is missing, there shouldn't be extra spaces or a period.
# - Add a method to return all initials. If the middle name is missing, the
#   initials should only have two characters.
#
# We've already sketched out the spec descriptions for the #full_name. Try
# building the specs for that method, watch them fail, then write the code to
# make them pass. Then move on to the other two methods, but this time you'll
# create the descriptions to match the requirements above.

require 'rspec/autorun'

class Person

  def initialize(first_name:, middle_name: nil, last_name:)
    @first_name = first_name
    @middle_name = middle_name
    @last_name = last_name
  end

  # implement your behavior here
  def full_name
    [@first_name,@middle_name,@last_name].compact.join(' ')
    # compact removes instances of nil from arrays
  end

  def full_name_with_middle_initial
   [@first_name, @middle_name ? @middle_name[0] : nil,@last_name].compact.join(" ")
  end

  def initials
    [@first_name[0], @middle_name ? @middle_name[0] : nil, @last_name[0]].compact.join(' ').upcase
  end

end




RSpec.describe Person do

  describe "#full_name" do

    it "concatenates first name, middle name, and last name with spaces" do
     pers = Person.new(first_name: "Jay", middle_name: "Edgar", last_name: "Hoover")

     expect(pers.full_name).to eq("Jay Edgar Hoover")
    end

    it "does not add extra spaces if middle name is missing" do
     pers = Person.new(first_name: "Jay", last_name: "Hoover")

     expect(pers.full_name).to eq("Jay Hoover")
    end
  end   
  

  describe "#full_name_with_middle_initial" do

   it "concatenates first name and last name with spaces and places the first charachter of the middle name between them" do
     pers = Person.new(first_name: "Jay", middle_name: "Edgar", last_name: "Hoover")

     expect(pers.full_name_with_middle_initial).to eq("Jay E Hoover")
    end

   it "Returns the full name without  
       the middle name initial if no middle name argument has been provided" do
       pers = Person.new(first_name: "Jay", last_name: "Hoover")

       expect(pers.full_name_with_middle_initial).to eq("Jay Hoover")
    end
  end   

  
  describe "#initials" do 
    it "Returns only the first charachters of  
        the given arguments and concatenates them into a string with no extra spaces or periods, also ensures they are returned as capital letters" do
        pers = Person.new(first_name: "Jay", middle_name: "edgar", last_name: "Hoover")

        expect(pers.initials).to eq("J E H")
    end

  end 
end 