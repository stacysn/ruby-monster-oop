<img width="300" alt="monster genetics" src="https://cloud.githubusercontent.com/assets/3254910/22097580/a217ac34-ddd6-11e6-8b8c-9214339b5dd2.png">


## Inheritance

Given a `Monster` class that contains a method `get_dangerous` & attribute `threat_level`...

```ruby
class Monster
  attr_accessor :threat_level
  def initialize(threat_level)
  	@threat_level = threat_level
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
end
```

... let's make a `Werewolf` class and `Zombie` class that inherit from it.

15) **Challenge:** Create a `Zombie` class that inherits from the base `Monster` class. Set it up so that all zombies (instances) start with a habitat of `"graveyard"`. That is, enable this code:

> ```ruby
rob = Zombie.new
puts rob.habitat
# "graveyard"
puts rob.threat_level
# :medium
rob.name = "Rob Zombie"
puts rob.name
# "Rob Zombie"
```

>*Hint*: The syntax for inheritance uses the `<` symbol in the class definition!

<br><br>

16) **Challenge:** Create a `Werewolf` class that inherits from the base `Monster` class.  Give werewolves a default initial threat level of `:low`. Enable this code:

> ```ruby
teen_wolf = Werewolf.new
puts teen_wolf.threat_level
# :low
```

<br><br>

17) **Challenge:** During a full moon, a werewolf's threat level jumps all the way up to `:midnight`. Write an `update_threat_level` method for `Werewolf` that calculates a werewolf's threat level based on a boolean parameter, `full_moon`. The `update_threat_level` method should update the werewolf's `@threat_level` and return its new value.


> ```ruby
teen_wolf.update_threat_level(true)
puts teen_wolf.threat_level
# :midnight
```


<br><br>

18) **Class Instance Variable Part 1:** Use the class instance variable pattern to add a  `class_description` variable to the `Monster` class. The Monster class description should be `"A scary monster!"`.

> *Hint: Create an instance variable (`@class_description`) inside the Monster class, then create a class method getter for it.*

<br>

19) **Class Instance Variable Part 2:** Give `Zombie` and `Werewolf` their own class descriptions.

<br>

20) **Optional Constant Part 4:** If you had a `THREAT_LEVEL` class constant, modify `get_dangerous` to use that.

## Modules

Ruby <a href="http://ruby-doc.org/core-2.2.0/Module.html">`Module`</a>s group together related information (attributes and methods).  They're like simplified classes that can't have instances and don't have inheritance. Rubyists often use them for:
  * "namespacing": encapsulation or bundling of related content,
  * "mixins": extra methods that can be added into classes without influencing the inheritance tree

21) **Challenge:** Using the `module` reserved word, create a `Flying` module. Inside the module, define a method `fly` that `puts` a message saying `"it soars across the sky"`.

<br>

22) **Challenge:** Create a very simple `Vampire` class that inherits from the `Monster` class. Remember to give this new subclass its own `@class_description`.

<br>

23) **Challenge:** Use the `Flying` module to enable the following code:

>```ruby
vamp = Vampire.new
vamp.fly
# it soars through the air
```

>*Hint: `include` the `Flying` module in the `Vampire` class.*

<br>

24) **Challenge:** Customize the module's message. Enable the following code:

>```ruby
dracula = Vampire.new(:high)
dracula.name = "Count Dracula"
dracula.fly  
# Count Dracula soars through the air
```

> *Hint: when included in a class, modules can access instance variables with `self`. For example: `self.threat_level`.*

**This module example may not seem great alone, but you can reuse the same `Flying` module to add a fly method to a `Bird` subclass of `Animal`, a `Plane` subclass of `Vehicle`, or a `SuperHero` class. Many of Ruby's powerful built-in modules (like `Comparable`) are used as "mixins" this way.  Modules help keep code DRY and organized.**
