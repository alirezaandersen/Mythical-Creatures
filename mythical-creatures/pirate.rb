class Pirate

  attr_reader :name, :job, :commit_heinous_act, :booty

  def initialize(name, job = "Scallywag")
    @name = name
    @job = job
    @cruse = false
    @commit_heinous_act = 0
    @booty = 0
  end

  def cursed?
    @commit_heinous_act +=1
    if @commit_heinous_act > 3
      @cruse = true
    else
      @cruse
    end
  end

  def rob_ship
    true
    @booty += 10
  end



end
