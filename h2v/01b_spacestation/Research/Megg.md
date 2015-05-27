# Megg Easter Egg
## Level Data
Relevant Level Data [Here](MeggData.md)
## Description
## Name
The Easter Egg is named after Jaime Griesemer's girlfriend, Meg. Jaime worked on the scripting (from what I can tell so far) of this level, The Armory, and the Tartarus Boss fight. He also put a similar Egg in Halo CE. 

It seems like her name is actually spelled with just one 'g', (from the script dialogue transcription), and that Megg (with two 'g's) came from the amalgamation of 'Meg' and 'Easter Egg'.
## Requirements
For the Megg Easter Egg to be able to play, you must;
 * Be playing on Legendary
 * **NOT** playing on Co-op
 * Thunderstorm Skull is on
 * That starting from when Johnson says "Let 'em have it." (when deploying the turret at the beginning) all the way until you are at the top of the bomb room elevator, you have **100%** Shields _the entire time_
   * Luckily you _are_ able to revert back to a checkpoint where you were never-damaged, and have it still work

## Break Down
Here is a simplified version of how it happens;
```
Johnson starts saying "Let 'em have it."
Waits 1 second
Starts checking for Megg;
	Checks that it's Legendary, !Co-Op, Thunderstorm is on
	Sleeps until either of these return true;
		if player shield is < 100%
			Stops checking forever
		if player is at the top of the bomb room elevator
			Marks Megg as available to be played
```		
When the loud-speaker cycles through next, and notices Megg is available, it starts playing Megg;
    
`"Paging Meg.  Please come to the red courtesy phone.  Meg to the red courtesy phone, please."`

Afterwards, it marks Megg as unavailable.
	
The loud-speaker _could_ say one of these prior to Megg; (With a 15-30 second [7.5-15 seconds non-H2C] wait after)
```
"All non-combat personnel to pressure-zones!"
"All hands to pressure-zones!"
"All non-combat personnel report to evacuation-stations!"
"All hands report to evacuation-stations!"
"All hands: we are abandoning the station!"
"All personnel: prepare to abandon station!"
```
### Images
#### Elevator Trigger Volume
