# Armory Skull
## Level Data
Relevant Level Data [Here](SkullData.md)
## Spawning
The Skull spawns when the following events occur;

```
Johnson finishes saying "Don't worry, I'll hold his hand."
Johnson has walked into the volume inside of the Elevator
While player is not inside of the Elevator volume
	Adds 8 seconds to the timer [4 for non-H2C] 
	Starts counting down timer (to continue to the next step)
    --
	Johnson finishes saying "C'mon, Chief, they're ready for us on the bridge."    
    Adds 8 seconds to the timer [4 for non-H2C]
    --
    Johnson finishes saying "Get on the lift, Cheif, we're gonna be late."    
    Adds 52 seconds to the timer [26 for non-H2C]
    --
    Johnson finishes saying "I don't want to keep the Brass waiting, Chief."    
    Adds 52 seconds to the timer [26 for non-H2C]
    --
    Johnson finishes saying "Fine. you can tell Lord Hood why we're late!"    
    Adds 72 seconds to the timer [36 for non-H2C]
    --
    Johnson finishes saying "Get your shiny green posterior on this elevator!"    
    Adds 72 seconds to the timer [36 for non-H2C]
    --
    Johnson finishes saying "Would it help if I said please?"    
    {Adds 86 seconds to the timer, but there's no need to wait any more?} [43 for non-H2C]
    Marks Skull as okay to spawn
    	Checks that it is Legendary first
        Spawns Weapon 'cookiesncream' [The Skull]
        Waits until Player has a Skull Weapon
        Activates Skull
```
In total, with about 7 seconds of dialog and 264 seconds of scripted waiting, it takes about 271 seconds, or 4 minutes, 31 seconds [Or, it's _supposed to_, see below. For H2V/MCC, it's instead about 139 seconds, or 2 minutes 19 seconds] from the second Johnson crosses the threshold into the Elevator, to when the Skull is spawned.


### Found New Bug

In testing this, I actually found a **new** (or, at least, unfixed) bug in H2V/MCC reguarding scripts; while the engine is set up to run at 60hz, and the 'sleep' commands are fixed to compensate from 30hz, the scripts _themselves_ run at 60hz. This would normally be fine, except for **this exact specific case**, where a timer is run manually _inside_ of the script. 

I'm assuming this bug was present in PAL versions of H2C also, but can't confirm.

So, for H2V/MCC, 1 manually-timed-script-second = 1/2 second, and for H2C PAL (assuming), 1 manually-timed-script-second = 5/6 second. 

Funnily enough, while looking for other script-based timers, I've only found one other, and it was **ALREADY FIXED** in the H2V source scripts. 

The other occurrence looked like it would be on the Tartarus Boss fight, but it had the unusual variables _'game_seconds' = 30_ and _'script_seconds' = 60_, where in H2C (because, I _had_ to go check), it only had _'seconds' = 30_. So this must mean that they (Hired Gun, porters of H2V) went through and figured out this bug on the Tartarus fight, and they fixed it by using a new 'script_seconds' where it was applicable. H2C PAL more than likely doesn't have the fix for that Boss fight.

## Skull Effect

343i have put 'Increases enemy awareness of player.' as the description of what the Skull does in MCC. That does describe what the Skull technically does, but doesn't exactly explain _what_ that means. 

The best description I've ever found of what the Skull does is from Kornman00 (Halo Engine Reverse-Engineering Jesus) [**here**](http://forums.bungie.org/halo/archive35.pl?read=1049288), where he explains that it just sets all of the game engine sounds 'volume' to be **Loud**, so that even the quietest noise you generate, to the AI, is heard as loudly as an exploding grenade. _This_ is why they notice you more quickly.

## Skull Name
Now, ever since this Skull was found, there has been confusion with what its name actually is, as it doesn't flash text when you pick it up like the other Skulls. Luckily in MCC, 343 have finally put a name on it, _'That's Just...Wrong'_, to put that confusion to rest. I am not convinced though, after looking at the evidence, that Bungie had **actually** intended its name to be _'That's Just...Wrong'_. That is why I 've been referring to is as just _'Skull'_.



Here are some strings I got from looking inside the H2V mainmenu.map file in a Hex Editor;


**0xEA5B5D-0xEA5C04**
```
Envy|Grunt Birthday Party|Assassins|Thunderstorm|Famine|I Would Have Been Your Daddy|Blind|Ghost|Black Eye|Catch|Sputnik|Iron|Mythic|Angry|Cow Bell|That’s Just... Wrong
```
**0xEB437A-0xEB45F0**
```
Envy|Grunt Birthday Party|Assassins|Thunderstorm|Famine|I Would Have Been Your Daddy|Blind|Ghost|Black Eye|Catch|Sputnik|Ice Cream|Mythic|Angry|Whuppopotamus|ASSASSINS|JUGGERNAUT|NOSFERATU|SAY WHAT?|HUDLESS|DISEMBODIED SOUL|MAKEOVER|Watch your back, the Covenant are having a sale on Active Camo.|Brace yourself for baddies with overshields and boomsticks.|Sure you’re tough, but now you must suck to survive.|Be poised if other emotional scenes tend to errupt.|Go commando! Clear your screen of pesky status indicators.|Experience the miserable existence of the Disembodied Soul.|Who says the Masterchief always has to wear green?|
```
**0xEE559C-0xEE5658 [German]**
```
Neid|Grunt-Geburtstagsparty|Meuchelmˆ¶rder|Gewitter|Hungersnot|Ich wˆ⁄re dein Vater gewesen|Blind|Geist|Blaues Auge|Haken|Sputnik|Eisen|Mystisch|Wˆ…tend|Kuhglocke|Das ist einfach ... falsch
```
**0xF25A67-0xF25B09 [Spanish]**
```
Envy|Grunt Birthday Party|Assassins|Thunderstorm|Famine|Podrˆ›a haber sido tu papˆ¡|Blind|Ghost|Black Eye|Catch|Sputnik|Iron|Mythic|Angry|Cow Bell|Eso estˆ¡... mal
```

Some things to take note of;
 * 3/4 of them have **16** Skulls, not just the 15 (14 named + 1 unnamed) that are in the game
 * The Skulls not displayed in-game for each set are;
	 * _2:_ Cow Bell|That’s Just... Wrong
	 * _1:_ Whuppopotamus
	 * _2:_ Kuhglocke|Das ist einfach ... falsch [Translates to 'Cow Bell|That’s Just... Wrong']
	 * _2:_ Cow Bell|Eso estˆ¡... mal [Translates to 'Cow Bell|That is... wrong']

Before everybody decided to call it _'That’s Just... Wrong'_, it was known first as _'Whuppopotamus'_. This seemed logical, because that 2nd set of strings contains 15 Skull names; 15 names for the 15 Skulls.

_'Whuppopotamus'_ isn't included in the translations though, so it couldn't realistically be that.

The name of the Skull weapon that the script spawns, is _'cookiesncream'_. But that is the only place it's referred to as that.
 
### The True Name
Out of the remaining 2 Skull names, I firmly believe that _**'Cow Bell'**_, NOT _'That’s Just... Wrong'_, is what the name was originally meant to be.

It makes perfect sense;
 * Cow Bells are used on livestock to make them easier to track down if they wander off, **by amplifying their smaller neck movements into loud bell rings.**
 * _**This is exactly what the Skull does**_
 * There are translations for that name
 * _'That’s Just... Wrong'_ name doesn't really make much sense for it

However, there _are_ 3 good arguments you could take against this name;

1. That [Kornman00 himself](http://forums.bungie.org/halo/archive35.pl?read=1049288) referred to it as _'That’s Just... Wrong'_ 
    * He might have been mistaken, following the same logic other people did, or perhaps there was a typo in the game code
2. That 343 Industries named it _'That’s Just... Wrong'_ 
    * They might have been mistaken, following the same logic other people did, or perhaps there was a typo in the game code
3. Bungie changed the name of _'Sputnik'_ into _'Cow Bell'_ in Halo 3
    * They.. well, this one's harder to refute. _**But**_, the _'Cow Bell'_ name still makes zero sense for what the _'Sputnik'_ Skull does. _Maybe they were mistaken too?_ ¯\\_(ツ)\_/¯

But reguardless;
#### I believe that its true, original name is _'Cow Bell'_, on the basis that it just makes more sense
###### [Even though there's evidence both for, and against it]
