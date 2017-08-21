class Monster
  attr_accessor :habitat, :threat_level, :name
  @@count = 0

  include Comparable

  THREAT_LEVELS = [:low, :medium, :high, :midnight].freeze

  def initialize(threat_level= :medium, name)
    @threat_level = threat_level
    @name = name
    @@count = @@count + 1

    if @@count == 1
      p "#{@@count} monster now"
    else
      p "#{@@count} monsters now"
    end

    if threat_level == :low || threat_level == :medium || threat_level == :high || threat_level == :midnight
      @threat_level = threat_level
    else raise "#{threat_level} is not a valid threat (RuntimeError)"
    end

  end

  def habitat?(habitat)
    self.habitat == habitat
  end

  def self.count
    @@count
  end

  def <=> (other_monster)
    Monster::THREAT_LEVELS.index(@threat_level) <=> Monster::THREAT_LEVELS.index(other_monster.threat_level)
  end

  def self.fight (monster1, monster2)
    if monster1.threat_level == monster2.threat_level
      monster2
      elsif monster1.threat_level == :low
        monster2.name
      elsif monster1.threat_level == :medium && monster2.threat_level == :high
        monster2.name
      elsif monster1.threat_level == :high && monster2.threat_level == :medium
        monster1.name
      elsif monster1.threat_level == :high && monster2.threat_level == :low
        monster2.name
      else
        if monster2.threat_level == :midnight
          monster2.name
        else
          monster1.name
        end
      end
  end


  p "RAWR! "
end

voldemort = Monster.new(:low, "Voldemort")
daryl = Monster.new(:high, "Daryl")
p Monster.fight(voldemort, daryl)


# Monster class



# Zombie class



# Werewolf class



# Flying module



# Vampire class




### "Driver" Code Area
