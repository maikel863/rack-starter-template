class Gym < ActiveRecord::Base
    has_many :gym_members
    # # has_many :star_ratings

    # # def average_star_rating
    # #     total_ratings = star_ratings.reduce {|current, sum| current.rating + sum}
    # #     return total_ratings / star_ratings.count
    # # end

    # def test_method
    #     return 4.4
    # end
end