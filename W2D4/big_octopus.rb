FISH = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish',
        'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'].freeze
TILES = ["up", "right-up", "right", "right-down", "down",
        "left-down", "left",  "left-up" ].freeze



def sluggish_octopus(fishes)
  fishes.each_with_index do |fish1, idx1|
    largest1 = true

    fishes.each_with_index do |fish2, idx2|
      next if idx1 == idx2
      largest1 = false if fish1.length < fish2.length
    end
    return fish1 if largest1
  end
end

class Array

  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }

    return self if length == 1

    mid = length / 2
    sorted_left = take(mid).merge_sort(&prc)
    sorted_right = drop(mid).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)

  end

  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left, right)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)
    merged
  end

end

def dominant_octopus(fishes)
  sorted_fishes = fishes.merge_sort
  sorted_fishes[-1]
end

def clever_octopus(fishes)
  longest_fish = ""
  fishes.each do |fish|
    longest_fish = fish if fish.length > longest_fish.length
  end

  longest_fish

end

def slow_dance(direction, tiles)
  count = 0
  tiles.each do |tile|
    return count if tile == direction
    count += 1
  end
end

def fast_dance(direction, tiles)

end
