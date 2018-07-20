class User < ApplicationRecord
  validates :username, presence: true,
                       length: { minimum: 4 }
  validates :password, presence: true,
                       length: { minimum: 4 }
end
