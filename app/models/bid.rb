class Bid < ActiveRecord::Base
    validates :start_bid, presence: true
    validates :max_bid, presence: true
    validates :auto_increment, presence: true
end