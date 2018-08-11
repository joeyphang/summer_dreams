class User < ApplicationRecord
	has_secure_password
 	validates :email, presence: { message: "Email must be filled."}, format: { with: /\w+@\w+\.\w{2,}/, message: "Email must be in format abc@example.com"}
end
