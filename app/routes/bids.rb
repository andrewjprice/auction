class Bids < Sinatra::Application
    before do
        content_type :json    
        response.headers["Access-Control-Allow-Origin"] = "*"  
    end

    # Root
    get '/' do
    end

    # Add bid
    post '/bids' do
        json_params = JSON.parse(request.body.read)
        new_bid = Bid.new(json_params)
        if new_bid.save
            new_bid.to_json
        else
            halt 422, new_bid.errors.full_messages.to_json
        end
    end

    # Calculates winner and amount
    get '/calculate' do
        maximum_bids = calculate_maximum_bids
        if maximum_bids.empty?
            return ["No bids to calculate."].to_json
        else
            top_bid = maximum_bids.pop
            winning_bid = find_bid(top_bid[:id])
            winning_amount = calculate_winning_amount(top_bid, maximum_bids)
            return [winning_bid, { "winning_amount": winning_amount }].to_json
        end
    end
end

private

# Calculates the maximum bid a bid can make based on their increment
def calculate_maximum_bids
    maxes = []
    Bid.find_each do |bid|
        diff = (bid.max_bid - bid.start_bid) - ((bid.max_bid - bid.start_bid) % bid.auto_increment)
        maxes.push({
            id: bid.id,
            start_bid: bid.start_bid,
            max_bid: bid.start_bid + diff,
            auto_increment: bid.auto_increment
        })
    end
    return maxes.sort_by {|a| [a[:max_bid], -a[:id]]}
end

# Find bid
def find_bid(id)
    Bid.find_by(id: id)
end

# Calculates the lowest winning amount
def calculate_winning_amount(winner, bids)
    return winner[:start_bid] if bids.size < 1
    bid = bids.pop()
    winning_amount = winner[:max_bid]
    while (winning_amount - winner[:auto_increment]) > bid[:max_bid] && (winning_amount - winner[:auto_increment]) >= winner[:start_bid]
        winning_amount -= winner[:auto_increment]
    end
    return winning_amount
end