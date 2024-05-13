class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #CATEGORIES = ['supermarket', 'utilities', 'home']

end


#example how we can call this array
##User::CATEGORIES
##this goes into transactions model and retailer model
