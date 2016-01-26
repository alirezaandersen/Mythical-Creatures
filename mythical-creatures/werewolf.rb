class Werewolf

  attr_reader :name, :location, :human, :hunger

  def initialize(name, location = "London")
    @name = name
    @location = location
    @human = true
    @hunger = false
  end

  def human?
    @human
  end

  def change!
    if @human == true
      @human = false
      @hunger = true
    else
      @human = true
    end
  end

  def wolf?
    !@human
  end

  def hungry?
    @hunger
  end

  def consumes(victim)
    @hunger = false
    victim.status = false
  end
end
