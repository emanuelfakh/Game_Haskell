# Game_Haskell
Text Based Game in Haskell (a Functional Programming Language). User selects various options and is served with relevant options, rewards or penalties.

Introduction:
This assignment required students to apply knowledge and skills gained (from lectures and workshops) to design and development a text adventure game.
Text adventure games go back to the time when computing power was limited, the use of terminal access was the norm and monochrome graphics was the best things out there.

Students were expected to implement key features of a text adventure game demonstrating, command line processing and navigation. As an example, when the user types in directions and selects a room number (as string values), the game will display textual descriptions based on the direction(s) and room(s) selected. Students were also encouraged to implement additional functionalities building upon the core design and concepts to enhance the game.

Implementation of Text Adventure Game (Explanation of Features):

This Text Adventure game is based on the concept of user selecting a certain direction followed by a room number and based on that, the relevant descriptions would be displayed.
To begin with, following key features were accomplished:
- User initiates the game using “main” in the Command line.
- Following a welcome message, the user is provided all the instructions (i.e. various options that the game has to offer).
- User can register (optional) or start by typing “game” in the command line.
- User inputs the direction (indicated in the instructions) followed by a room number and based on background mapping, the application displays messages.
- User can further input other room numbers to explore other options / consequences.
- User inputs “health” and prompted to indicate numerical values between 1 – 10. Based on user input, the game would describe the health status at the time.
- User can see an inventory of all the light and heavy weapons by inputting “lightweapons” and “heavyweapons” with information on each weapon.
- User can quite the game by inputting “quit” in the command line.

We will explore all these features and the application behaviour step by step as below:

Launching the Game:
After uploading the game file in WinGhci, user input “main” as the string and the following message is returned. The message has a welcome note, followed by instructions, i.e. what operations the user can carry out based on the string values typed in the command line.

Registration of username (optional):
The user has the option to register username by typing in strlen’ which will prompt the user to select a username. The game shall confirm the username chosen.

Starting the Game:
Whether or not the user registers username, they can start playing by inputting “game”. You will notice that the user can bypass the username registration step and jump straight to the game.

Selecting Direction and Rooms:
Once the game begins, user is asked to indicate a direction followed by a room number. Based on the combination of direction and room selected, the game displays the state the user gets into.User can further select other rooms and have the state or information displayed based on that selection. The next screenshot shows the messages the user gets, after selecting room3, room4 and room2 respectively in the south direction.

NOTE:To choose a different direction altogether, user must start the game again!!

Health Check:
User inputs health and is prompted to indicate a numerical value of their health, ranging from 1 – 10. Depending on the number indicated, the user is provided a description of their health status across three ranges:
- For numerical value between 1 – 3 (poor health)
- For numerical value between 4 – 7 (OK health)
- For numerical value between 8 – 10 (fantastic health)

The game also displays validation message, if user inputs a numerical value other than the given range (1 – 10). For example, if the user types in 0, 11, 12 etc, the validation message would display "Wrong health range indicated. It has to be a number between 1 - 10 !!"

Quit the Game:
To end the game, the user simply types quit in the command line.

Future Enhancements:
- User could change direction even if they have already selected a direction and room(s), i.e. the user should not have to restart game for a different direction.
- “lightweapons” and “heavyweapons”. I was able to create and display a collection of various weapons, both light and heavy and information, however, this needs further development to a point where a user can “pick” a weapon.
Subsequently, the user should be able to “drop object”, check his belonging (inventory - i).
- Attack (kill) an enemy.
- Be able to “look” around again.
