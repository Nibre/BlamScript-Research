# Broken Dialogue
## Level Data
Relevant Level Data [Here](BrokenDialogueData.md)
## Break Down
When Guns is asking you to get into the _'Zapper'_, he goes through a couple lines of dialogue repeatedly until you do actually enter it. Here is some psuedo-code showing how the dialogue runs;
```
Condition // Stops at first true condition, and only runs that one
	If Zapper_Prompts = 0
		Guns says "Step on in. I'll show you."			
		Adds 8 seconds to the timer [4 for non-H2C] 
		--
	If Zapper_Prompts = 1
		Guns says "Step into the red sqaure, Chief, and we'll get started."	
		Adds 8 seconds to the timer [4 for non-H2C] 
		--
	If Zapper_Prompts = 2
		Guns says "Chief? Stand in the red square."	
		Adds 16 seconds to the timer [8 for non-H2C] 
		--
	If Zapper_Prompts = 3
		Guns says "You have to stand in the red square before we can start the test."	
		Adds 16 seconds to the timer [8 for non-H2C] 
		--
	If Zapper_Prompts = 4
		Guns says "Go ahead and stand in the red sqaure. it'll just take a minute."	
		Adds 36 seconds to the timer [18 for non-H2C] 
		--
	If Zapper_Prompts = 5
		Guns says "Come on, son, step into the red square."
		Adds 36 seconds to the timer [18 for non-H2C] 
		--
	If Zapper_Prompts = 5
		Guns says "Will you stop screwing around? Stand in the red square!"
		Adds 36 seconds to the timer [18 for non-H2C] 
		--
	If Zapper_Prompts = 5
		Guns says "Stop bustin' my balls, and step in the damn square!"
		Adds 48 seconds to the timer [24 for non-H2C]
		--
	True \\ Only ever runs when all previous ones were not true
		Zapper_Prompts = 2
---
		
Zapper_Prompts = Zapper_Prompts + 1 // Increments it for next loop
```
If you read through that, you might notice the problem; 3 of the lines of dialogue are checking the same condition, *'Zapper_Prompts = 5'*. This creates a problem though, as only the first one hit can actually play, and then the next time around, Zapper_Prompts is 6, so it hits the last condition sets it back to 2 (which is bumped it up to 3).

I'm assuming this was just a simple typo, because they should check for [5, 6, 7] instead of [5, 5, 5]. The 2 lines of dialogue that get skipped because of this, are;

`"Will you stop screwing around? Stand in the red square!"`

`"Stop bustin' my balls, and step in the damn square!"`