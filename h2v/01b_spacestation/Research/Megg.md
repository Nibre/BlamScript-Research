# Megg Easter Egg
## Level Data
Relevant Level Data [Here](MeggData.md)
## Triggering
### Requirements
For the Megg Easter Egg to be able to play, you must;
 * Be playing on Legendary
 * **NOT** playing on Co-op
 * Thunderstorm Skull is on
 * That starting from when Johnson says "Let 'em have it." (when deploying the turret at the beginning) all the way until you are at the bottom of the bomb room elevator, you have **100%** Shields _the entire time_
   * Luckily you _are_ able to revert back to a checkpoint where you were never-damaged, and have it still work

### Playing It
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
Once you've reached the bottom of the Bomb room **Elevator** having never lost any Shield, the  next time the loud-speaker cycles through and notices Megg is now available, it will play it. This usually takes 10-35 seconds _*[7.5-20 seconds [non-H2C](../../Bugs/ScriptIterationTiming.md)]_ from when "Return to Sender" text starts fading onto the screen. Though it can be hard to hear, it will say;
    
`"Paging Meg.  Please come to the red courtesy phone.  Meg to the red courtesy phone, please."`

Afterwards, it marks Megg as unavailable.

#### Elevator Trigger (tv_elv_enter)
Elevator Trigger Volume placeholder

### Troubleshooting

In the Bomb room, the loud-speaker will say _more than one_ of these if you **failed** to trigger Megg;
```
Lord Hood (With a 15-30 second *[7.5-15 seconds non-H2C] wait after)
	"All non-combat personnel to pressure-zones!"
    "All hands to pressure-zones!"
    "All non-combat personnel report to evacuation-stations!"
    "All hands report to evacuation-stations!"
    "All hands: we are abandoning the station!"
    "All personnel: prepare to abandon station!"
Cortana (With a 45-60 second *[22.5-30 seconds non-H2C] wait after)
	"There isn't much time, Chief! Hurry!"
    "Chief!  We don't have much time!"
	"Not a lot of time on the clock, Chief!"
	"Where are you? The bomb is right here!"
	"Clock's ticking, Chief! Get down here!"
	"Chief! Over here! Next to the bomb!"
    "Ask yourself this question: is what I'm doing right now helping Cortana keep this station from blowing into tiny, tiny bits?"
    "Just a friendly reminder? Bomb!"
    "If this thing goes off...I'm never talking to you again."
```

If something **other** than these things starts playing, it's possible that you got through an earlier section too quickly (or didn't kill enough enemies), and it has a backlog of dialogue to go through first. Just wait for them to cycle all the way through (how many there can be varies, you can find them all in the [Mission Script](../01b_spacestation_mission.lisp)). Remember, you've **only** failed if _more than one_ of the above dialogue play.
## Name
The Easter Egg is named after Jaime Griesemer's (Bungie Employee) girlfriend, Meg. Jaime worked on the scripting (from what I can tell) of this level, The Armory, and the Tartarus Boss fight. He put a similar Egg in Halo CE. 
#### Spelling
It seems like her name is actually spelled with just one 'g', (from the script dialogue transcription), and that Megg (with two 'g's) came from the amalgamation of 'Meg' and 'Easter Egg'.

