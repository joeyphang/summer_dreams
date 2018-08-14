class User < ApplicationRecord
	has_many :product, dependent: :destroy
	has_secure_password
 	validates :email,
 				presence: { message: "Email must be filled."},
 				format: { with: /\w+@\w+\.\w{2,}/, message: "Email must be in format abc@example.com"}

 	# before_create {generate_token(:remember_digest)}

 	# def generate_token(column)
 	# 	begin
 	# 		self[column] = SecureRandom.urlsafe_base64
 	# 	end while User.exists?(column => self[column])
 	# end

	 def self.create_with_auth_and_hash(authentication, auth_hash)
	   user = self.create!(
		 first_name: auth_hash["info"]["given_name"],
		 last_name: auth_hash["info"]["family_name"],
	     email: auth_hash["info"]["email"],
	     password: SecureRandom.hex(10)
	   )
	   user.authentications << authentication
	   return user
	 end

	# grab google to access google for user data
	def google_token
	   x = self.authentications.find_by(provider: 'google_oauth2')
	   return x.token unless x.nil?
	end

end
