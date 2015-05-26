# Armory Skull
## Scripts
### icecream
```lisp
# Lines 859-877 from 01a_tutorial_mission
(script startup icecream
	(sleep_until
		(and 
			mark_ice_cream
			(difficulty_legendary)
		)
		1
	)
	(object_create cookiesncream)
	(sleep_until
		(or
			(unit_has_weapon (unit (player0)) objects\weapons\multiplayer\ball\head_sp.weapon)
			(unit_has_weapon (unit (player1)) objects\weapons\multiplayer\ball\head_sp.weapon)
		)
		1
	)
	(ice_cream_flavor_stock 14)
	(print "Blam")
)
```
### prompt_elevator_plr
```lisp
# Lines 767-847 from 01a_tutorial_mission
# Called from training_done
(script static void prompt_elevator_plr
	(hud_show_training_text false)
	(cond
		(
			(= counter_prompt_elevator_plr 0)
			(begin
				(set timer_prompt_elevator_plr (+ timer_prompt_elevator_plr delay_prompt_short))
				(objectives_show_up_to 3)
			)
		)
		(
			(= counter_prompt_elevator_plr 1)
			(begin
				(print "C'mon, Chief, they're ready for us on the bridge.")
				(sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_1640_jon (ai_get_object johnson) 1)
				(set timer_prompt_elevator_plr (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_1640_jon))
				(set timer_prompt_elevator_plr (+ timer_prompt_elevator_plr delay_prompt_short))
			)
		)
		(
			(= counter_prompt_elevator_plr 2)
			(begin
				(print "Get on the lift, Cheif, we're gonna be late.")
				(sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_1650_jon (ai_get_object johnson) 1)
				(set timer_prompt_elevator_plr (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_1650_jon))
				(set timer_prompt_elevator_plr (+ timer_prompt_elevator_plr delay_prompt_long))
				(set timer_prompt_elevator_plr (+ timer_prompt_elevator_plr delay_prompt_medium))
			)
		)
		(
			(= counter_prompt_elevator_plr 3)
			(begin
				(unit_set_emotional_state (ai_get_unit johnson) annoyed 0.5 1)
				(print "I don't want to keep the Brass waiting, Chief.")
				(sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_1660_jon (ai_get_object johnson) 1)
				(set timer_prompt_elevator_plr (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_1660_jon))
				(set timer_prompt_elevator_plr (+ timer_prompt_elevator_plr delay_prompt_long))
				(set timer_prompt_elevator_plr (+ timer_prompt_elevator_plr delay_prompt_medium))
			)
		)
		(
			(= counter_prompt_elevator_plr 4)
			(begin
				(unit_set_emotional_state (ai_get_unit johnson) annoyed 0.5 1)
				(print "Fine. you can tell Lord Hood why we're late!")
				(sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_1670_jon (ai_get_object johnson) 1)
				(set timer_prompt_elevator_plr (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_1670_jon))
				(set timer_prompt_elevator_plr (+ timer_prompt_elevator_plr delay_prompt_long))
				(set timer_prompt_elevator_plr (+ timer_prompt_elevator_plr delay_prompt_long))
			)
		)
		(
			(= counter_prompt_elevator_plr 5)
			(begin
				(unit_set_emotional_state (ai_get_unit johnson) angry 0.5 1)
				(print "Get your shiny green posterior on this elevator!")
				(sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_1680_jon (ai_get_object johnson) 1)
				(set timer_prompt_elevator_plr (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_1680_jon))
				(set timer_prompt_elevator_plr (+ timer_prompt_elevator_plr delay_prompt_long))
				(set timer_prompt_elevator_plr (+ timer_prompt_elevator_plr delay_prompt_long))
			)
		)
		(
			(= counter_prompt_elevator_plr 6)
			(begin
				(unit_set_emotional_state (ai_get_unit johnson) angry 0.5 1)
				(print "Would it help if I said please?")
				(sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_1690_jon (ai_get_object johnson) 1)
				(set timer_prompt_elevator_plr (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_1690_jon))
				(set timer_prompt_elevator_plr (+ timer_prompt_elevator_plr delay_prompt_long))
				(set timer_prompt_elevator_plr (+ timer_prompt_elevator_plr delay_prompt_drag))
				(set mark_ice_cream true)
			)
		)
		(
			true
			(set counter_prompt_elevator_plr 0)
		)
	)
	(set counter_prompt_elevator_plr (+ counter_prompt_elevator_plr 1))
)
```
## Spawn

```xml
<!-- Psuedo-XML, relevant info from Assembly -->
<Weapon name="cookiesncream" weapon="objects\weapons\multiplayer\ball\head_sp.weap">
    <Placement_Flags>
        <Not_Automatically />
    </Placement_Flags>
    <Position x="44.4761" y="35.702" z="7.49429" />
    <Rotation i="140.895" j="0" k="0" />
</Weapon>
```