<!--
Creator: WDI Team
Last Edited By: Brianna
Location: SF
-->

# <img src="https://cloud.githubusercontent.com/assets/7833470/10423298/ea833a68-7079-11e5-84f8-0a925ab96893.png" width="60"> Class-based Object Oriented Programming

Ruby <img alt="heart" src="https://em.wattpad.com/6d0355863f6ca950858ed30d2b8b9b1fe982b54c/687474703a2f2f727562792e7a69677a6f2e636f6d2f77702d636f6e74656e742f75706c6f6164732f73697465732f322f323031332f30312f7370696b655f616e645f7261726974795f5f735f68656172745f7368617065645f666972655f727562795f62795f65647761726474656e2e706e67" width="24px">'s Object Oriented Programming



### Why is this important?
<!-- framing the "why" in big-picture/real world examples -->
*This workshop is important because:*
- Ruby is designed for Object Oriented Programming with classes.
- Class-based OOP is much more common across languages than JavaScript's prototype-based system - even JavaScript is adopting classes.
- To understand more complex Ruby code (like Rails) one must be comfortable with classes.

### What are the objectives?
<!-- specific/measurable goal for students to achieve -->
*After this workshop, developers will be able to:*

- Define the OOP terms “class,” “instance,” and “inheritance.”
- Create your own classes and instances.
- Define attributes and methods for instances or for the class as a whole.
- Explain and implement the class-based inheritance pattern.

### Where should we be now?
<!-- call out the skills that are prerequisites -->
*Before this workshop, developers should already be able to:*

- Describe how JavaScript handled Object Oriented Programming.
- List two benefits of OOP.
- Write methods in Ruby.

### Review

#### Hashes

Hashes are simple key value stores. They look a lot like JavaScript's objects.

Hash Example:

```ruby
 our_hash = {name: "Napoleon", fav_food: "steak", skills: ["archery", "combat", "egg farming"]}

 # => {:name=>"Napoleon", :fav_food=>"steak", :skills=>["archery", "combat", "egg farming"]}
```

The colon notation always results in your keys being symbols, which is usually what we want. The hash rocket notation gives you more control over the types of your keys.

#### Objects

Ruby also has `Object`s to organize methods and data. In fact, everything in Ruby is a `BasicObject`. However, we almost never use plain `BasicObjects` or `Object`s because there are more sophisticated, specialized classes such a `String`, `Integer`, and `Hash`.


Class Inheritance Tree:

![Class inheritance](http://i.stack.imgur.com/rvcEi.png)


Example:
How can we prove that the hash we just created is a `BasicObject`?

```ruby
# there's a built-in method for that:
our_hash.is_a? BasicObject
# => true
```

## OOP in JavaScript 

#### Object Types with Constructor Function and Prototype

```js
// constructor function sets up the type 
function Car(color, model, year){
  this.color = color;
  this.model = model;
  this.year = year;
  this.wheels = 4;
}

// instance methods usually defined on prototype
Car.prototype.repaint = function(newColor){
  this.color = newColor;
}
```

#### Classes and Modules (ES6)

```js
// bring in Animal class from a different 'Animals' module
import Animal from 'animals'

// define Dog class
class Dog extends Animal {
  // constructor for initial behavior and state
  constructor (dogName="Good Dog") {
     this.name = dogName;
     this.sound = 'woof';
  }
  // instance method for the class
  speak () {
     console.log(`${this.name} says ${this.sound}!`);
  }
}

// an instance of Dog
let morocco = new Dog('Morocco');
morocco.speak();

// export 
export Dog
```

## Classes and Ruby

Ruby uses **classes** for object-oriented programming.  Classes are data types used to create more data.  They are similar to the object types we manipulated with constructors and prototypes in JavaScript.  

Classes are more common among programming languages than prototypes, so we'll go into more depth about OOP with Ruby than we did with JavaScript. This will help give us extra context for JavaScript classes from ES6, like we saw with React.

1) **Challenge:** Create a `Monster` class in Ruby and an instance of `Monster`.
> *Hint: you'll have to use the Ruby reserved word `class` and the `new` method.*


## `initialize`

2) **Challenge** Update the `Monster` class so that we see "Rawr!" when a monster is first initialized.

![monster rawr gif](https://s-media-cache-ak0.pinimg.com/originals/8e/dd/5d/8edd5de39a2c832745df9f8dfca15547.jpg)


## Instance Variables

What should we do if we want to set attributes on the monster, such as its `habitat`?

Since each monster will probably have a different habitat, this is a good candidate for an instance variable. Remember Ruby classes mark instance variables with `@`.

3) **Challenge:** Add a `habitat` instance variable and any instance methods needed to your Monster class to enable this code...

```ruby
rabbit = Monster.new
# Rawr
rabbit.habitat = "Cave of Caerbannog"
rabbit.habitat
# => "Cave of Caerbannog"
```

> *Hint: Use the methods `attr_accessor`, `attr_reader`, and/or `attr_writer`*

<br>

4) **Challenge:** Add a `threat_level` instance variable to the Monster class. Allow the user to specify a threat level when the monster is created.

```ruby
dalek = Monster.new(:high)
dalek.threat_level
=> :high
```
> *Hint*: use `initialize`

<br>

5) **Challenge:** Allow the user to create an instance of `Monster` without specifying a threat level. The default threat level for a new monster should be `:medium`.

```ruby
teletubby = Monster.new
teletubby.threat_level
=> :medium
```

## Instance Methods

6) **Challenge:** Create a `habitat?` instance method for `Monster` that tests whether the monster's habitat matches an argument that is passed in.

```ruby
yeti = Monster.new
# Rawr!
yeti.habitat = "tundra"
yeti.habitat?("swamp")
# => false
yeti.habitat?("tundra")
# => true
```

> *Hint: use `def` to define a new method inside the class*

## Class Variables and Class Methods

What if I wanted a running count of all the Monsters ever created?  Let's keep track with a class variable and print a message each time a new monster spawns.

7) **Challenge:** Add a class variables to enable this code...

```ruby
predator = Monster.new(:high)
# Rawr!
# 2 monsters now roam the world!
alien = Monster.new(:high)
# Rawr!
# 3 monsters now roam the world!
```

> *Hint: Create a class variable with `@@`*

<br>

8) **Challenge:** Create a class method to get the current value of the monster count.

```ruby
Monster.count
# => 3
```

> *Hint: Use the reserved word `self`*

**Note: Class variables SHOULD BE AVOIDED due to their weird behavior with inheritance!**

9) **Challenge:** Add a check so that the allowed `threat_level` values at creation are`:low`, `:medium`, `:high`, or `:midnight`.   If another value is passed in as the initial threat_level, `raise` a runtime error.

```ruby
rubber_ducky = Monster.new(:friendly)
# /stretch.rb:31:in `initialize': cannot create monster - invalid threat level friendly (RuntimeError)
```

<br>

10) **Optional Constant Part 1:** Create a class constant called `THREAT_LEVELS` that is an array containing all the allowed values of `threat_level`.

>*Hint: Access the class constant with `Monster::THREAT_LEVELS`.*

>*Hint: Use `freeze` to make sure the value of `THREAT_LEVELS` isn't changed later (necessary for array constants).*

<br>

11) **Challenge:** Create a `fight` class method for `Monster` that takes in two monster instances and compares their  `threat_level`s. The `fight` method should return the monster that has the higher threat level. If they're tied, let the second monster win.

<br>

12) **Optional Constant Part 2:** Refactor `fight` to use `index` with the `THREAT_LEVELS` array. You should be able to make `fight` code shorter and simpler.

<br>

13) **Optional Constant Part 3:** Include <a href="http://ruby-doc.org/core-2.2.3/Comparable.html">the `Comparable` mixin</a> in your `Monster` class and create a custom `<=>` method to compare monsters based on their threat levels. Refactor `fight` to use this comparison.

<br>

14) **Compassion Challenge:** Give your `Monster` class a `name` instance variable with a getter and a setter.

> *Hint: only modify `initialize` as a stretch (solution not provided). If you modify `initialize` so it takes a `name` argument, update your simple test code to give each monster instance a name.  Wondering how you could make the `name` argument optional like `threat_level`? Look up Ruby's "keyword arguments" syntax.*


<img alt="monster" src="http://blog.spoongraphics.co.uk/wp-content/uploads/2009/furry-monster/monster.jpg" width=300px>

## Quick Review

  * What is a class?
    - What is an attribute?
    - What is a method?
  * What is the difference between:
    - an instance variable
    - a class variable
  * What is the difference between:
    - an instance method
    - a class method
  * Why do we use classes?
  * Looking ahead: What is inheritance?


## Head over to [Part 2](part2.md)
