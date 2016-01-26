class Wizard

  attr_reader :name, :bearded, :rested

  def initialize(name, bearded: true)
    @name = name
    @bearded = bearded
    @rested = true
    @tired = 0

  end

  def bearded?
    @bearded
  end

  def incantation(spell)
    "sudo #{spell}"
  end

  def rested?
    @rested
  end

  def cast(magic)
    @tired += 1
    if @tired >= 3
      @rested = false
    else
      "#{magic.upcase}"
    end
  end

end
