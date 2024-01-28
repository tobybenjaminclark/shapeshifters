# Shapeshifters

## Inspiration

Shapeshifters was inspired by the BBC show, Hole in the Wall, where competitors attempt to match human-shaped holes in approaching walls. We decided to integrate human pose estimates calculated through the webcam to 
eliminate the need for any external hardware, and online multiplayer was 
implemented to allow remote play from any location. 

We developed Shapeshifters in the hopes of gamifying the promotion of stretching exercises. We included online multiplayer to allow players to connect with friends from any location, and stretch together!
 
## What it Does

Computer Vision
Shapeshifters uses MoveNet to calculate human pose estimates from the webcam. MoveNet initially returns a list of positions on the body, however we decided to convert these to angles to ensure that people of different heights and dimensions are all portrayed similarly. 

## Game Design

Shapeshifters was created in GameMakerStudio 2. All assets and music were made by us! 

## Networking

Angles retrieved from the computer vision server are sent to the GameMaker client over UDP.
A TCP connection was established between an Azure server and GameMaker clients to constantly transfer pose data across clients. This ensures you can see your opponent's live pose on the screen.
A second TCP connection was established to transfer extra information about the game, such as game states and accuracies.

## How We Built It

We split the project into three main components, and assigned each member a component: game design (Toby), networking (Eden), and computer vision (Amber). 


## Challenges we Ran Into

Networking: we made several attempts to establish a REST API between the GameMaker client and Azure server. However, due to limitations of Azure, this was not possible. Therefore, we ultimately decided to establish TCP connections which ultimately resulted in a significant performance increase! Additionally, our extensive networking issues led to us creating a novel communication protocol: PUDP (Polite UDP)!

Computer Vision: Finding an initial suitable model was time-consuming: balancing the desire for accurate estimations with the need for speedy recognitions was a tradeoff that required a lot of experimentation! Once we found a suitable model, we spent lots of time ensuring that data gathered is as reliable as possible. 

Game Design: Rendering the data retrieved from the computer vision model into GameMaker was a significant challenge which required a lot of calculations and debugging. We wanted to ensure that we added plenty of personal touches to the game, even learning GarageBand to create bespoke tracks!


## Accomplishments That We're Proud Of

- Linking pose estimation to in-game avatar over the internet in real time.
- The speed and robustness of all networking components across the system.
