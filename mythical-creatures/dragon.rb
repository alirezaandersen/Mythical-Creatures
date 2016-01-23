class Dragon

  attr_reader :name, :color, :rider, :hungry


  def initialize(name, color, rider)
    @name = name
    @color = color
    @rider = rider
    @hungry = true
    @starving = 0
  end

  def hungry?
    @hungry
  end

  def eat
    @starving +=1
    if @starving >=3
      @hungry = false
    end
  end


end
