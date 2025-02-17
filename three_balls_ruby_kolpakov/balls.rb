require_relative('constants.rb')
require_relative('basket.rb')
require_relative('simulator.rb')

simulator = Simulator.new(10000000)

all_balls = {
    WHITE => 0,
    BLACK => 0,
    RED => 0
}

simulator.get_baskets.each do |basket|
    basket.get_balls.each do |ball|
        all_balls[ball] += 1
    end
end

puts all_balls

simulator.run
results = simulator.get_results

probability = results[WHITE][WHITE][RED][:count].to_f / results[WHITE][WHITE][:count].to_f

puts probability
puts '======='

balls = [WHITE, BLACK, RED]

balls.each do |first|
    puts 'FIRST ' + first + ' ' + results[first][:count].to_s

    balls.each do |second|
        puts '    SECOND ' + second + ' ' + results[first][second][:count].to_s

        balls.each do |third|
            puts '        THIRD ' + third + ' ' + results[first][second][third][:count].to_s
        end
    end

end
