gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'medusa'

class MedusaTest < Minitest::Test
  def test_it_has_a_name
    medusa = Medusa.new("Cassiopeia")
    assert_equal "Cassiopeia", medusa.name
  end

  def test_when_first_created_she_has_no_statues

    medusa = Medusa.new("Cassiopeia")
    assert medusa.statues.empty?
  end

  def test_when_staring_at_a_person_she_gains_a_statue

    medusa = Medusa.new("Cassiopeia")
    victim = Person.new("Perseus")

    medusa.stare(victim)
    assert_equal 1, medusa.statues.count
    assert_equal "Perseus", medusa.statues.first.name
  end

  def test_when_staring_at_a_person_that_person_turns_to_stone

    medusa = Medusa.new("Cassiopeia")
    victim = Person.new("Perseus")

    refute victim.stoned?
    medusa.stare(victim)
    assert victim.stoned?
  end

  def test_can_only_have_three_victims

    medusa = Medusa.new("Cassiopeia")
    victim1 = Person.new("Ali")
    victim2 = Person.new("Jigga")
    victim3 = Person.new("Edwin")
    victim4 = Person.new("Chad")

    medusa.stare(victim1)
    medusa.stare(victim2)
    medusa.stare(victim3)
    medusa.stare(victim4)

    assert_equal 3, medusa.statues.length
    refute victim1.stoned?
    assert victim2.stoned?
    assert victim3.stoned?
    assert victim4.stoned?
  end

  def test_if_a_fourth_victim_is_stoned_first_is_unstoned

    medusa = Medusa.new("Cassiopeia")
    victim1 = Person.new("Ali")
    medusa.stare(victim1)
    assert victim1.stoned?
    victim2 = Person.new("Jigga")
    medusa.stare(victim2)
    assert victim2.stoned?
    victim3 = Person.new("Edwin")
    medusa.stare(victim3)
    assert victim3.stoned?
    victim4 = Person.new("Chad")
    refute victim4.stoned?
  end

  def test_is_alive_by_default
    medusa = Medusa.new("Cassiopeia")
    assert medusa.is_alive?
  end

  def test_is_not_alive_after_five_victims
    medusa = Medusa.new("Medusa")
    assert medusa.is_alive?

    victim1 = Person.new("Jigga")
    victim2 = Person.new("Ali")
    victim3 = Person.new("Chad")
    victim4 = Person.new("Edwin")
    victim5 = Person.new("Derek")

    medusa.stare(victim1)
    medusa.stare(victim2)
    medusa.stare(victim3)
    medusa.stare(victim4)
    medusa.stare(victim5)

    refute medusa.is_alive?
  end
end
