# Script Iteration Timing
**Script Iteration Timing** is a bug I stumbled upon while researching the [Armory Skull](../01a_tutorial/Research/Skull.md). The bug is exclusive to non-H2C versions of H2, so only H2V and MCC (and _possibly_ PAL H2C?) are affected. 

## Explanation

While testing the Armory Skull in-game (after having crawled through all of its scripts), I noticed that _all_ of my estimated waiting times were wrong, they were exactly half of what they should have been. After thinking I must have messed up, I looked up what the H2C waiting time should be, which _matched up_ with my estemated total waiting time. After some more digging, I was able to figure out what the problem was. 

### Moving to 60Hz

When porting H2 to PC, they (Hired Gun) had to change the engine from running at 30 cycles per second (30Hz), up to 60Hz, so that it would look fluid on PC monitors (that run at 60 FPS, versus the ~30 FPS older TVs run at). For the most part, this is fairly simple to do. They sped it up to 60Hz, slowed everything that's time-based down by half (animations, audio, timers etc.), and left everything else to run at full 60Hz.

This works out okay, because checking things like if you are inside of a Trigger Volume, or if you pressed a button, can still happen every single tick without it really breaking anything. Having the physics engine running at 60Hz even fixed Super-Bouncing (and appears to have caused the infamous wonky Ghost-flipping physics).

As a result of the game runnings at 60Hz, the game scripts run 60 times a second too. So they had to go in and make the **sleep** function count in cycles of 60 (instead of 30), and to _double_ any **ticks** given to it. So if a script calls **(sleep 30)**, it will now count from 60 (instead of 30), in a cycle of 60 (instead of 30), and it will still sleep the 1 second as it was originally intended. You are able to verify this by enabling debug_scripting in Sapien, and watching it tick down. I imagine sound and animation functions were fixed in similar ways, and with all of these fixes they were able to get the game scripts running 99.99% the same as it did back at 30Hz.

### The Problem

For scripting, everything works fine at 60Hz if you are using the pre-fixed, timing-reliant script functions that are provided. But it looks like there were rare times where _manually_-timed **iteration timers** were used instead. That is where you take a variable, that's set to lets say 90, and you subtract 1 from that variable each script iteration, and when that variable eventually hits 0, you continue forward with the script. By assuming that you have 30 iterations a second, you can figure that it would take exactly 3 seconds for 90 to hit 0. But now, running at 60Hz, it only takes 1.5 seconds (half the intended time) to reach 0.

It appears that there are several times throughout H2 where this type of timer was used, and for H2V they slipped through the cracks, never getting corrected. Funnily enough, while I was looking for other iteration timers, I found one that was **ALREADY FIXED** in the H2V source scripts. This means that Hired Gun _did_ find this type of bug, but they didn't find and correct all of them. 

I found the fixed iteration timer on the Tartarus Boss fight. It has the variables _'script_seconds = 60'_ and _'game_seconds = 30'_. In H2C (because, I _had_ to go check), it looks like only one _'seconds = 30'_ variable was used. So this must mean that Hired Gun went through and fixed this timer by using the  _'script_seconds = 60'_ variable where 30Hz was previously assumed, and _'game_seconds = 30'_ where it was already accounted for.

### Consequence

For any script that uses an (uncorrected) **iteration timer**;
 * On MCC - Timer will complete in 1/2 of the time
 * On H2V - Timer will complete in 30/Framerate of the time (If you can't keep solid 60 FPS)
 * [On PAL H2C - Timer _might_ complete in 5/6 of the time? Due to the 50Hz/60Hz conversion? Unverified.]

## Occurances
### Uncorrected
 * **The Armory**
   * Every pause _between_ dialogue variation for both Guns and Johnson. Easy to notice while waiting for the Skull to spawn.
 * **Cairo Station**
   * Every pause _between_ dialogue that happens over the loud-speaker (and Cortana if you're hiding in the Bomb room) 

### Corrected
 * **The Great Journey**
   * The timings of 1) Tartarus shield recharge 2) Johnson's Beam Rifle rate of fire 3) Rate of Brute reinforcements (that all change with difficulty) during the final Boss fight.
