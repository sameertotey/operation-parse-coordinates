class AsciiMap

  def self.parse(map)
    loc = []
    x, y = 1, 1
    arr = map.lines.each do |line|
      x = line.index('X')
      if x 
        x -= 1
        break
      else
        y -= 1
      end
    end
    loc << x << y
  end

  def self.interpret_step(c1, c2)
    x1, y1 = *c1
    x2, y2 = *c2

    step = case [x2 - x1, y2 - y1]
    when [0, 1] then
      "moved north by 1"
    when [1, 0] then
      "moved east by 1"
    when [0, -1] then
      "moved south by 1"
    when [-1, 0] then
      "moved west by 1"
    else
      "big jump"
    end
  end
end