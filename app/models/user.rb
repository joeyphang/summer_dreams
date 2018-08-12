class User < ApplicationRecord
	has_secure_password
 	validates :email,
 				presence: { message: "Email must be filled."},
 				format: { with: /\w+@\w+\.\w{2,}/, message: "Email must be in format abc@example.com"}

 	before_create {generate_token(:remember_digest)}

 	def generate_token(column)
 		begin
 			self[column] = SecureRandom.urlsafe_base64
 		end while User.exists?(column => self[column])
 	end
end
