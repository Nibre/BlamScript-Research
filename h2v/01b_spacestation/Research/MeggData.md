# Megg Easter Egg
## Scripts
From [01b_spacestation_mission](../01b_spacestation_mission.lisp)
### spacestation_mission
```lisp
; Lines from 01b_spacestation_mission
; Called on startup
(script startup mission_spacestation
	(if (= (player_count) 0 ) (sleep_forever))
	(cinematic_snap_to_white)
	(save_cutscene)
	(if (cinematic_skip_start)
		(begin
			(cinematic_stash_players)
			(x02)
			(cinematic_unstash_players)
		)
	)
	(cinematic_skip_stop)
	(object_type_predict scenarios\objects\solo\spacestation\ss_tram_car\ss_tram_car)
	(camera_control off)
	(sleep 1)
	(cache_block_for_one_frame)
	(sleep 1)
	(mission_start)
	(mission_setup)
	(load_bsp0a)
	(wake flavor_mission) ; <----- Wakes flavor_mission -------------------------------------------
	(wake 1st_mission) ; <----- Wakes 1st_mission ----------------------------------------------
	(wake atr2_mission)
	(wake 1st_tram)
	(sleep 1)
	(cinematic_fade_from_white)

	(sleep_until (= (structure_bsp_index) 2) 1)
	(load_bsp2)
	(device_operates_automatically_set bsp2_door_forward 1)

	(wake bay1_mission)
	(wake bay2_mission)

	(sleep_until (= (structure_bsp_index) 0) 1)
	(load_bsp0b)
	(wake ice_cream_check)
	(wake arm_mission)
	(wake atr1_mission)
	(wake trm1_mission)
	(wake dck_mission)

	(sleep_until (= (structure_bsp_index) 3) 1)
	(load_bsp3)
	(wake elv_mission)
	(wake lvr_mission)
	(gun_mission) ; <----- Calls gun_mission -------------------------------------------
	(playtest_mission)

	(save_cutscene)
	(cinematic_fade_to_white)
	(device_set_power gun_loader 0)
	(device_set_power macgun 0)
	(sleep 45)
	(if (cinematic_skip_start)
		(begin
			(cinematic_stash_players)
			(c01_outro)
			(cinematic_unstash_players)
		)
	)
	(cinematic_skip_stop)
	(game_won)
)
```
### 1st_mission
```lisp
; Lines from 01b_spacestation_mission
; Woken from mission_spacestation
(script dormant 1st_mission
	(print "1st")
	(set mark_flavor_init TRUE)
	(ai_place 1st_hum)
	(ai_cannot_die 1st_hum_johnson 1)

	(sleep_until (volume_test_objects tv_1st_hallb (players)) 10)
	(ai_set_orders 1st_hum 1st_hum_halla)
	(device_set_position bigrack_bsp0a_5 1)
	(sleep 15)
	(device_set_position bigrack_bsp0a_6 1)

	(sleep_until (volume_test_objects tv_1st_halla (players)) 10)
	(ai_set_orders 1st_hum_floor 1st_hum_floor)
	(ai_set_orders 1st_hum_balcony 1st_hum_balcony)
	(ai_set_orders 1st_hum_johnson 1st_hum_balcony_stairs)
	(set mark_flavor_disable TRUE)
	(1st_malta)

	(sleep_until (volume_test_objects tv_1st_all (players)) 10)

	(cs_run_command_script 1st_hum_johnson cs_1st_johnson_deploy)
	(sleep 45)

	(print "Field of fire on that bulkhead!")
	(sound_impulse_start sound\dialog\levels\01_spacestation\mission\L01_0070_jon (ai_get_object 1st_hum_johnson) 1)
	(sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\L01_0070_jon))
	(cs_queue_command_script 1st_hum cs_1st_fieldoffire)

	(sleep 30)
	(wake title_1st)
	(sleep 30)
	(save_1st_start)

	(wake 1st_waves)

	(print "Soon as that door opens...")
	(sound_impulse_start sound\dialog\levels\01_spacestation\mission\L01_0180_jon (ai_get_object 1st_hum_johnson) 1)
	(sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\L01_0180_jon))

	(print "Let 'em have it.")
	(sound_impulse_start sound\dialog\levels\01_spacestation\mission\L01_0190_jon (ai_get_object 1st_hum_johnson) 1)
	(objectives_show_up_to 0)

	(sleep 30)
	(set mark_flavor_disable FALSE)
	
	(wake megg_check) ; <----- Wakes megg_check -----------------------------------------------------------------------

	(sleep_until
		(and
			mark_1st_blast
			(volume_test_objects tv_1st_exit (players))
		)
		10
	)
	(sleep_forever 1st_waves)
	(set mark_1st_waves_end TRUE)

	(set mark_flavor_init FALSE)
	(set mark_flavor_atr2 TRUE)
	(set mark_flavor_board TRUE)

	(ai_place 1st_cov_hall)
	(ai_place 1st_hum_stairs)

	(sleep_until (volume_test_objects tv_atr2_security_r (players)) 1)
	(ai_disposable 1st_cov 1)

	(sleep_until (volume_test_objects tv_atr2_lstair (players)) 1)
	(ai_disposable 1st_hum 1)

	(sleep_until (= (structure_bsp_index) 2) 10)
	(ai_erase 1st_cov)
)
```
### megg_check
```lisp
; Lines from 01b_spacestation_mission
; Woken from 1st_mission
(script dormant megg_check
	(if 
		(not (difficulty_legendary))
		(sleep_forever)
	)
	(if 
		(game_is_cooperative)
		(sleep_forever)
	)
	(if 
		(not (ice_cream_flavor_available 3))
		(sleep_forever)
	)
	(sleep_until
		(cond
			(
				(< (object_get_shield (player0)) 1)
				(begin
					(print "oops")
					(sleep_forever)
					FALSE
				)
			)
			(
				mark_flavor_gun ; <----- Checks if mark_flavor_gun is true -----------------------------
				(begin
					(set mark_flavor_megg TRUE) ; <----- Marks mark_flavor_megg as true -------------------------
					TRUE
				)
			)
		)
		1
	)
)
```
# gun_mission
```lisp
; Lines from 01b_spacestation_mission
; Called from mission_spacestation
(script static void gun_mission
	(print "gun")
	(object_type_predict "objects\characters\grunt\grunt")
	(object_type_predict "objects\characters\elite\elite")

	(sleep_until
		(and
			(volume_test_objects_all tv_elv_enter (players))
			(> (player_count) 0)
		)
		1
	)

	(set mark_flavor_dck FALSE)
	(set mark_flavor_gun TRUE) ; <----- Marks mark_flavor_gun as true (for megg_check) --------------------

	(object_create gun_wall_enter)
	(save_gun_start)
	(ai_place gun_cov)
	(ai_place gun_hum_mar)
	(wake gun_flyby)

	(sleep_until (<= (ai_living_count gun_cov) 4) 1)
	(sound_looping_set_alternate scenarios\solo\01b_spacestation\01b_music\01b_08 1); 05_nostrings alt
	(set mark_flavor_vacuum TRUE)

	(sleep_until (= (ai_living_count gun_cov) 0) 1)
	(set mark_flavor_bomb FALSE)
	(set mark_flavor_disable TRUE)
	(sound_looping_stop scenarios\solo\01b_spacestation\01b_music\01b_08); 05_nostrings

	(sleep 150)
	(sleep_until (< (objects_distance_to_object (players) pickle) 4) 1 150)

	(set mark_bomb2_objective TRUE)
)
```
# flavor_mission
```lisp
; Lines from 01b_spacestation_mission
; Woken from mission_spacestation
; Plays all of the speaker audio throughout the mission
(script dormant flavor_mission
	(sleep_until
		(cond
			;//...// Irrelevant code
			
			(
				mark_flavor_megg
				(begin <----- mark_flavor_megg Sucessful --------------------------------------------
					(sound_impulse_start_effect sound\dialog\levels\01_spacestation\mission\L01_2400_lhd NONE 1 "")
					;"Paging Meg.  Please come to the red courtesy phone.  Meg to the red courtesy phone, please." 
					(set mark_flavor_megg FALSE)
					(set timer_flavor (timer_flavor_set))
					FALSE
				)
			)
			( ; <----- Can possibly get into this before Megg has a chance -------------------------------------
				(and
					mark_flavor_bomb
					(game_safe_to_save)
				)					
				(begin
					(cond
						(
							(not mark_flavor_safe_cycle)
							(set mark_flavor_safe_cycle TRUE)
						)
						(
							(= counter_flavor_bomb_safe 0)
							(sound_impulse_start_effect sound\dialog\levels\01_spacestation\mission\L01_0570_cor NONE 1 "radio_default");"There isn't much time, Chief! Hurry!"
						)
						(
							(= counter_flavor_bomb_safe 1)
							(sound_impulse_start_effect sound\dialog\levels\01_spacestation\mission\L01_2580_cor NONE 1 "radio_default");"Chief!  We don't have much time!"
						)
						(
							(= counter_flavor_bomb_safe 2)
							(sound_impulse_start_effect sound\dialog\levels\01_spacestation\mission\L01_2590_cor NONE 1 "radio_default");"Not a lot of time on the clock, Chief!"
						)
						(
							(= counter_flavor_bomb_safe 3)
							(sound_impulse_start_effect sound\dialog\levels\01_spacestation\mission\L01_2600_cor NONE 1 "radio_default");"Where are you? The bomb is right here!"
						)
						(
							(= counter_flavor_bomb_safe 4)
							(sound_impulse_start_effect sound\dialog\levels\01_spacestation\mission\L01_2610_cor NONE 1 "radio_default");"Clock's ticking, Chief! Get down here!"
						)
						(
							(= counter_flavor_bomb_safe 5)
							(sound_impulse_start_effect sound\dialog\levels\01_spacestation\mission\L01_2630_cor NONE 1 "radio_default");"Chief! Over here! Next to the bomb!"
						)
						(
							(= counter_flavor_bomb_safe 6)
							(sound_impulse_start_effect sound\dialog\levels\01_spacestation\mission\L01_2640_cor NONE 1 "radio_default");"Ask yourself this question: is what I'm doing right now helping Cortana keep this station from blowing into tiny, tiny bits?"
						)
						(
							(= counter_flavor_bomb_safe 7)
							(sound_impulse_start_effect sound\dialog\levels\01_spacestation\mission\L01_2650_cor NONE 1 "radio_default");"Just a friendly reminder?bomb!"
						)
						(
							(= counter_flavor_bomb_safe 8)
							(sound_impulse_start_effect sound\dialog\levels\01_spacestation\mission\L01_2660_cor NONE 1 "radio_default");"If this thing goes off...I'm never talking to you again."
						)
						(
							TRUE
							(set counter_flavor_bomb_safe 0)
						)
					)
					(set counter_flavor_bomb_safe (+ counter_flavor_bomb_safe 1))
					(set timer_flavor (timer_flavor_set_long)) ; <----- 45-60 seconds [22.5-30 for non-H2C] delay after --------------------------------
					FALSE
				)
			)
			( ; <----- Can possibly get into this before Megg can has a chance -------------------------------------
				mark_flavor_bomb
				(begin
					(cond
						(
							(= counter_flavor_bomb 0)
							(sound_impulse_start_effect sound\dialog\levels\01_spacestation\mission\L01_2340_lhd NONE 1 "")
						);"All non-combat personnel to pressure-zones!"
						(
							(= counter_flavor_bomb 1)
							(sound_impulse_start_effect sound\dialog\levels\01_spacestation\mission\L01_2350_lhd NONE 1 "")
						);"All hands to pressure-zones!"
						(
							(= counter_flavor_bomb 2)
							(sound_impulse_start_effect sound\dialog\levels\01_spacestation\mission\L01_2360_lhd NONE 1 "")
						);"All non-combat personnel report to evacuation-stations!"
						(
							(= counter_flavor_bomb 3)
							(sound_impulse_start_effect sound\dialog\levels\01_spacestation\mission\L01_2370_lhd NONE 1 "")
						);"All hands report to evacuation-stations!"
						(
							(= counter_flavor_bomb 4)
							(sound_impulse_start_effect sound\dialog\levels\01_spacestation\mission\L01_2380_lhd NONE 1 "")
						);"All hands: we are abandoning the station!"
						(
							(= counter_flavor_bomb 5)
							(sound_impulse_start_effect sound\dialog\levels\01_spacestation\mission\L01_2390_lhd NONE 1 "")
						);"All personnel: prepare to abandon station!"
						(
							TRUE
							(set mark_flavor_bomb FALSE)
						)
					)
					(set counter_flavor_bomb (+ counter_flavor_bomb 1))
					(set timer_flavor (timer_flavor_set)) ; <----- 15-30 seconds [7.5-15 for non-H2C] delay after --------------------------------
					(set mark_flavor_safe_cycle FALSE)
					FALSE
				)
			)
		
			;//...// Irrelevant code
			
			(
				TRUE
				FALSE
			)
		)
		1
	)
)
```