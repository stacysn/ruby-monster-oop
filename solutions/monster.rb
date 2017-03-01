class Monster
  # makes getters and setters for instance variables
  # also sets up the instance variables - @threat_level, @habitat, @name
  attr_accessor :threat_level, :habitat, :name

  # class variable (avoid)
  @@count = 0

  # class method getter for @@count class variable
  # note that self.____ method names are always class methods
  # we'd call this with Monster.count
  def self.count
    @@count
  end
  
  # class instance variable (an alternative to class attributes)
  @class_description = "A scary monster"

  # class method getter for @class_description class instance variable
  # we'd call this with Monster.class_description, Zombie.class_description, etc.
  def self.class_description
    @class_description
  end

  # initial behavior 
  # runs when a monster is created with Monster.new
  def initialize(threat_level=:medium)  #default threat level
    @threat_level = threat_level
    puts "Rawr!"
    @@count = @@count + 1
    puts "#{@@count} monsters now roam the world!"
  end

  # instance method
  # call it with an instance like my_monster.habitat?
  def habitat?(some_hab)
    @habitat == some_hab
  end

  # instance method
  def get_dangerous
    # ruby version of a switch statment is case
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

  # class method
  # call it with Monster.fight
  def self.fight(monster1, monster2)
    if monster1.threat_level == monster2.threat_level
      monster2
    elsif monster1.threat_level == :low
      monster2
    elsif monster1.threat_level == :medium
      if monster2.threat_level == :low
        monster1
      else
        monster2
      end
    else # monster1.threat_level is :high or :midnight
      if monster2.threat_level == :midnight
        monster2
      else
        monster1
      end
    end
  end
end


class Zombie < Monster

  # zombie version of class_description
  @class_description = "Shuffling, decaying flesh. Hungry and without remorse!"

  # we'll use the reserved word super
  # to call Monster's initialize and keep our code more DRY
  def initialize (threat_level=:medium)
    # note that zombies created without a threat level
    # will still have a default threat_level of :medium
    super(threat_level)
    @habitat = "graveyard"
  end
end

class Werewolf < Monster

  # werewolf version of class_description
  @class_description = "A man... a wolf... a monster!"

  def initialize (threat_level=:low)
    # werewolves created without a threat level
    # will have a default threat_level of :low
    super(threat_level)
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
    puts "#{self.name || "it"} soars through the air"
  end
end

class Vampire < Monster  # vamipre inherits from Monster class...
  include Flying         # and mixes in capabilities from Flying module!
  @class_description = "Dark and sparkly."
end
