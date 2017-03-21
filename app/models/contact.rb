class Contact < ActiveRecord::Base
    
    # Contact form validations 
    validates :nom, presence: true
    validates :email, presence: true
    validates :commentaires, presence: true
end