class Profile < ActiveRecord::Base
	belongs_to :user
	validate :name_not_null
	validates_inclusion_of :gender, :in => ["male" , "female"]
	validate :no_boy_sue
	def name_not_null
		if first_name.nil? and last_name.nil?
			errors.add(:first_name, "First and last Name Both Can't be null")
		end
	end
	def no_boy_sue
		if gender == "male" and first_name == "Sue"
			errors.add(:first_name, "********* no_boy_sue <<<<<<<<<<<<<<")
		end
	end
	def self.get_all_profiles(min_year , max_year)
		Profile.where("birth_year BETWEEN ? and ? ", min_year, max_year).order(:birth_year).to_a
	end
end
