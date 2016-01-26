class Medusa

  attr_reader :name, :statues
  attr_accessor :alive

  def initialize(name, alive = true)
    @name = name
    @statues = []
    @count = 0
    @alive = alive
  end

  def stare(victim)
    @count += 1
    if @count >= 4
      @alive = false
    end
    @statues << victim
    victim.stone = true
    if @statues.length >  3
      @statues[0].stone = false
      @statues.shift
    end
  end

  def is_alive?
    @alive
  end
end


class Person

  attr_reader :name
  attr_accessor :stone

  def initialize(name)
    @name = name
    @stone = false
  end

  def stoned?
    @stone == true
  end

end
