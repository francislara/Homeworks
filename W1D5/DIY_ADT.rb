
# ---exercise 1 - stack

class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
    el
  end

  def remove
    @stack.pop
  end

  def show
    @stack.dup
  end
end


# ---exercise 2 - queue---
class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
    el
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue.dup
  end
end


# ---exercise 3 - map---
class Map
  def initialize
    @map = []
  end

  def assign(key, val)
    idx = @map.index {|pair| pair[0] == key}
    idx ? @map[idx][1] = val : @map.push([key, val])
    [key, val]
  end

  def lookup(key)
    @map.each {|pair| return pair[1] if pair[0] == key}
    nil
  end

  def remove(key)
    @map.reject! {|pair| pair[0] == key}
    nil
  end

  def show
    deep_dup(@map)
  end

  private
  def deep_dup(arr)
    arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
  end
end
