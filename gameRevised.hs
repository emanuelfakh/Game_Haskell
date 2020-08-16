
import System.IO 
import Data.Char

--Data types
type Location = String
type Direction = String
type Thing = String
type Response = String

--Data Structures
type PathMap = [((Location, Direction), Location)]
paths :: PathMap
paths = [
    (("room1", "d"), "room2"),
    (("room2", "u"), "room1"),
    (("room2", "w"), "room2 entrance"),
    (("room2 entrance", "e"), "room2"),
    (("room2 entrance", "s"), "room3"),
    (("room3", "s"), "room1"),
    (("room3", "n"), "room2 entrance")
    ]
type LocationMap = [(Thing, Location)]
locations :: LocationMap
locations = [
    ("ruby", "room1"),
    ("key", "room2 entrance"),
    ("myself", "room3"),
    ("room1", "alive")]
type World = (PathMap, LocationMap, Response)
world :: IO (PathMap, LocationMap, Response)
world = return (paths, locations, "")

-- Welcome message with instructions user puts "main" in the command line.
main :: IO (String)
main = do
    putStrLn "\nWelcome to the text adventure game!\n"
    putStrLn instructions
    return "Good Luck!"

-- strlen' function called to enter username and have it displayed
strlen' :: IO ()
strlen'= do putStr "Enter the username: "
            xs <- getLine
            putStr "Your chosen username is: " 
            putStr xs         

-- instructions function called to have the game rules displayed

instructions =
    "Enter commands using one or two words.\n" ++
    "Available commands are:\n" ++
    "strlen' (OPTIONAL) -- to register your username.\n" ++
    "game               -- to start the game.\n" ++
    "n  s  e  w  u  d   -- to go in that direction.\n" ++
    "health             -- to check your health status.\n" ++
    "take object        -- to pick up the named object.\n" ++
    "drop object        -- to put down the named object.\n" ++
    "lightweapons       -- to see lightweapons and their details.\n" ++
    "heaveyweapons      -- to see heavy weapons and their details.\n" ++
    "kill               -- to attack an enemy.\n" ++
    "look               -- to look around you again.\n" ++
    "i                  -- to see your inventory (what you are holding).\n" ++
    "quit               -- to end the game and quit."

-- game function called to start the game. First, you select the direction, then you select room (1 or 2 or 3 or 4) 
game :: IO ()
game = do putStrLn "Welcome to the text adventure game!" 
          putStrLn  "Input which direction"
          direction <- getLine
          putStrLn "input which room are you going to enter:"
          play direction  

-- Should the user want to quit and subsequent message
play :: String -> IO ()
play direction =
   do guess <- getLine
      if guess == "quit" then
         putStrLn "You quit / Game Over !!!"
      else
         do putStrLn (match direction guess)
            play direction

-- Underlying descriptions of locations combined with rooms as selected by the player
match :: String -> String -> String
match xs ys = description xs ys

-- Descriptions of various rooms when selected against different directions
description :: String->String -> String
description "n" "room1" =
    "You are in room1.  To the north is the dark mouth\n" ++
    "of a room2; to the south is a small room4.  Your\n" ++
    "assignment, should you decide to accept it, is to\n" ++
    "recover the famed Bar-Abzad ruby and return it to\n" ++
    "this room3."
description "s" "room1" =
    "You are in the mouth of a dark room2.  The exit is to\n" ++
    "the south; there is a large, dark, round passage to\n" ++
    "the east."
---description "s" "room2"= "you are inside room2"
description "s" "room2" = " You are inside room2 at south direction. Congratulations!! You have recovered the ruby and won the game."
description "w" "room2" = " You are inside room2 at west direction.  Congratulations!! You have recovered the key to enter the next level."
description "n" "room2" = " You are inside room2 at north direction. Congratulations!! Your life has been doubled your existing life.. Enjoy!! "
description "e" "room2" = " You are inside room2 at east direction.  Congratulations!!  You have killed all your enemies, you can go to next level."

---description "s" "room3"= "you are inside room3"
description "s" "room3" = " You are inside room3 at south direction. Congratulations!! You have recovered the torch to see in dark."
description "w" "room3" = " You are inside room3 at west direction.  Congratulations!!  You have recovered extra life to go long."
description "n" "room3" = " You are inside room3 at north direction. Congratulations!! You have recovered binocular. "
description "e" "room3" = " You are inside room3 at east direction.  Congratulations!!  You have recovered lessor gun."

---description "s" "room4"= "you are inside room4"
description "s" "room4" = " You are inside room4 at south direction. Congratulations!! You have recovered Sword to kill enemy."
description "w" "room4" = " You are inside room4 at west direction.  Congratulations!!  You have recovered Pistol to shoot enemy."
description "n" "room4" = " You are inside room4 at north direction. Congratulations!! You have recovered Bomb to through on enemy."
description "e" "room4" = " You are inside room4 at east direction.  Congratulations!!  You have recovered Machinegun for multiple assault."

-- prompting user to enter numeric value against which, game would describe health status
health :: IO ()
health = do
  putStrLn "State your health using numbers 1 - 10: "
  str <- getLine
  case read str of
    num | num >= 1 && num <= 3 -> putStrLn "Your health is poor. In this game, energy is not given, it has to be found!!"
    num | num >= 4 && num <= 7 -> putStrLn "Your health is OK. However, don't undermine this rough and tough journey!"
    num | num >= 8 && num <=10 -> putStrLn "Your health is fanstastic ! You are all ready to face challenges ahead."
    _ -> putStrLn "Wrong health range indicated. It has to be a number between 1 - 10!!"

-- WEAPONS Description (need to add functions for picking and dropping a given weapon). 

data Weapon = Weapon {damage::Int, hitChance::Float, name::String } deriving (Show,Eq)

lightweapons=[dagger,pistol,fists]
heavyweapons=[sword,ak47,gun]

sword = Weapon 50 0.8 "Sword"
ak47 = Weapon 70 0.5 "AK47"
gun = Weapon 40 0.9 "Gun" 

dagger = Weapon 30 0.9 "Dagger"
pistol = Weapon 30 0.9 "Pistol"
fists = Weapon 20 1 "Fists"



