class Team < ActiveRecord::Base
    has_many :players
    accepts_nested_attributes_for :players
end