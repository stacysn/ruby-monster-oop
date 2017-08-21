class Monster
  attr_accessor :habitat, :threat_level
  @@count = 0

  def initialize(threat_level= :medium)
    @threat_level = threat_level
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

  p "RAWR! "
end

p voldemort = Monster.new(:friendly)



### monster.rb - run this file

# Monster class



# Zombie class



# Werewolf class



# Flying module



# Vampire class




### "Driver" Code Area
