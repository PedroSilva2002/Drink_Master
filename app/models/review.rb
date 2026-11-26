class Review < ApplicationRecord
  belongs_to :drink
  belongs_to :author, class_name: 'User'
end
