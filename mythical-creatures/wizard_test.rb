gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'wizard'

class WizardTest < Minitest::Test
  def test_has_name
    wizard = Wizard.new("Eric")
    assert_equal "Eric", wizard.name
  end

  def test_can_have_different_name

    wizard = Wizard.new("Alex")
    assert_equal "Alex", wizard.name
  end

  def test_is_bearded_by_default

    wizard = Wizard.new("Ben")
    assert wizard.bearded?
  end

  def test_is_not_always_bearded

    wizard = Wizard.new("Valerie", bearded: false)
    refute wizard.bearded?
  end

  def test_has_root_powers

    wizard = Wizard.new("Sarah", bearded: false)
    assert_equal "sudo chown ~/bin", wizard.incantation("chown ~/bin")
  end

  def test_has_lots_of_root_powers

    wizard = Wizard.new("Rob", bearded: false)
    assert_equal "sudo rm -rf /home/mirandax", wizard.incantation("rm -rf /home/mirandax")
  end

  def test_starts_rested

    wizard = Wizard.new("Mariah", bearded: false)
    assert wizard.rested?
    # create wizard
    # .rested? returns true
  end

  def test_can_cast_spells

    wizard = Wizard.new("Edwin")
    assert_equal "MAGIC MISSILE!", wizard.cast("Magic Missile!")
    # create wizard
    # .cast returns "MAGIC MISSILE!"
  end

  def test_gets_tired_after_casting_three_spells

    wizard = Wizard.new("Ali")
    #wizard cast spell once
    wizard.cast("MAGIC missle!")
    #wizard cast spell twice
    wizard.cast("Maigc MISSLE!")
    #wizard is rested
    assert wizard.rested?
    #wizard is cast spell three times
    wizard.cast("Magic Missle")
    #wizard is not rested?
    refute wizard.rested?

    # create wizard
    # casts spell twice
    # check wizard is rested
    # casts spell
    # check wizard is not rested
  end

end
