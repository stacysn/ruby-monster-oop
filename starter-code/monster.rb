class Monster
  attr_accessor :habitat, :threat_level, :name
  @@count = 0

  include Comparable

  THREAT_LEVELS = [:low, :medium, :high, :midnight].freeze

  @class_description = "A scary monster!"

  def self.class_description
    @class_description
  end

  def initialize(threat_level= :medium)
    @threat_level = threat_level
    @name = name
    @@count = @@count + 1

    if @@count == 1
       "#{@@count} monster now"
    else
       "#{@@count} monsters now"
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

  def get_dangerous
    # ruby version of a switch statement is case
    case @threat_level
      when :low
        @threat_level = :medium
      when :medium
        @threat_level = :high
      when :high
        @threat_level = :midnight
      when :midnight
        :midnight
    end
  end

  p "RAWR! "
end

class Zombie < Monster
  @class_description = "just walking corpses!"
  def initialize ()
    super(threat_level)
    @habitat = "graveyard"
  end

end

class Werewolf < Monster
  @class_description = "AWHOOOOOOOOOOOO!"
  def initialize (threat_level= :low)
    @threat_level = threat_level
  end

  def update_threat_level(full_moon)
    if full_moon
      @threat_level = :midnight
    else
      @threat_level = :low
    end
    @threat_level
  end

end

module Flying
  def fly
    p "#{self.name || "it"} soars through the air"
  end
end

class Vampire < Monster
  include Flying
  @class_description = "Dark and sparkly"
end


dracula = Vampire.new(:high)
dracula.name = "Count Dracula"
p dracula.fly
# vamp = Vampire.new("Edward")
# p vamp.fly
