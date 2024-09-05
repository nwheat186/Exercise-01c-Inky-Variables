/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Variable types: integer, float, boolean
 - Variable assignment
 - Printing variables
 - Variable checking
 
 In the assignment:
 - Add four more knots
 - Assign at least TWO new variables through player choices
 - Print at least one of the variables to the player in a passage
 - Check the value of a variable and have it do something
*/

VAR health = 5
VAR pet_name = "" 
VAR torches = 0
VAR fishingrod = 0
VAR fish = 0

-> memory

== memory ==
Before you stands the cavern of Josh. You wish your childhood pet was with you now. The cave might be less imtimidating then. What was your pet's name?

You have {torches} torches

* [Charlie]
    ~ pet_name = "Charlie"
    ->cave_mouth

* [Susan]
    ~ pet_name = "Susan"
    ->cave_mouth
    
 * [Spot]
    ~ pet_name = "Spot"
    ->cave_mouth
    
== cave_mouth ==
You made it to the cave.{not torch_pickup: There is a torch at the floor.} If only {pet_name} could see you now.



+ {not east_tunnel_lit} [Take the east tunnel] -> east_tunnel
+ [Take the west tunnel] -> west_tunnel
* [Pick up the torch] -> torch_pickup
+ {east_tunnel_lit} [head back east] -> east_tunnel_lit

== east_tunnel ==
You are in the east tunnel. It is very dark, you can't see anything.
* {torches > 0} [Light Torch] -> east_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

== west_tunnel ==
You are in the west
{pet_name == "Spot":Spot would love it here in the west}
+ [Go Back] -> cave_mouth
-> END

=== torch_pickup ===
You now have a torch. May it light the way.
~ torches = 1
* [Go Back] -> cave_mouth
-> END

== east_tunnel_lit ==
The light of your torch glints off of the thousands of coins in the room.
+ [Go Back] -> cave_mouth
+ [Countinue on] -> pond
-> END

== pond ==
you go further into the cave and see a pond. {fishingrod == 0: there is a fishingrod in the corner of the cave} {fishingrod == 1: you have {fish} fish.}

* [Pick up fishing rod] -> pickup_fishingrod
* {fishingrod == 1} [fish] -> fishing
+ [Go Back] -> east_tunnel_lit
+ [Head further down] -> shrine

== pickup_fishingrod ==
You picked up the fishingrod
~ fishingrod = 1
* [go back] -> pond

== fishing == 
{not fish == 4:you have caught a fish.} 
~ fish =  fish+1
There are {4-fish} fish left.
+ [go back] -> pond

== shrine ==
There is a pedistool with a picture of a fish.
+ [Go Back] -> pond
* {fish == 1} [Place the fish on the pedistool] ->treasure_room_open
+ {treasure_room_open} [Go deeper within the cave] -> treasure_room

== treasure_room_open ==
A door opens, leading further down the cavern
+ [Go Back] -> shrine
+ [Enter the door] -> treasure_room

== treasure_room ==
You find a chest filled with doubloons
-> END