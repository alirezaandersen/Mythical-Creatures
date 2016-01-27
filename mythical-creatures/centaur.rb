class Centaur

  attr_reader :name, :breed, :stand, :activity

  def initialize(name, breed, attitude = false, stand = true, sick = false)
    @name = name
    @breed = breed
    @attitude = attitude
    @stand = stand
    @activity = 0
    @sick = sick


  end

  def shoot
    @activity += 1
    if cranky? || laying?
      "NO!"
    else
      "Twang!!!"
    end
  end

  def run
    @activity +=1
    if cranky? || laying?
      "NO!"
    else
      "Clop clop clop clop!!!"
    end
  end

  def cranky?
    if @activity >= 3
      @attitude = true
    else
      @attitude = false
    end
  end

  def standing?
    @stand
  end

  def lay_down
    @stand = false
  end

  def laying?
    !@stand
  end

  def sleep
    @activity = 0
    if @stand == false
      "let me sleep"
    else
      "NO!"
    end
  end

  def stand_up
    if @stand = true
      standing?
    end
  end

  def potion
    unless @stand == true
      return "NO!"
    end
    unless @attitude == false
    @sick = true
  end
    @activity = 0
  end

  def sick?
    @sick = true
  end


end
