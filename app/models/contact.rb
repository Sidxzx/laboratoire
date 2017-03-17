class Contact < ActiveRecord::Base
    validates :nom, presence: true
    validates :email, presence: true
    validates :commentaires, presence: true
end