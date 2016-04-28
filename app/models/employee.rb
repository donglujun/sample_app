class Employee < ActiveRecord::Base
  has_many :issues
end
