# Broken Dialogue
## Scripts
### mission_01a
```lisp
; Lines from 01a_tutorial_mission
; Called on startup
(script startup mission_01a
	(player_disable_movement true)
	(player_camera_control false)
	(if
		(game_is_cooperative)
		(game_won)
	)
	(objectives_clear)
	(ai_allegiance player human)
	(fade_out 1 1 1 0)
	(hud_enable_training false)
	(ai_dialogue_enable false)
	(start_mission)
	(training_setup)
	(camera_control false)
	(sleep 1)
	(cache_block_for_one_frame)
	(objects_predict_high (ai_get_object guns))
	(sleep 2)
	(cinematic_fade_from_white_bars)
	(wake training_fade)
	(training_look)
	(hud_enable_training true)
	(training_move)
	(training_shield) ; <----- Calls training_shield ---------------------------
	(save_tram_start)
	(training_done)
	(training_tram)
	(print "You win!")
	(sound_class_set_gain "" 0 15)
	(cinematic_fade_to_white)
	(hud_enable_training true)
	(ai_dialogue_enable true)
	(game_won)
)
```
### training_shield
```lisp
; Lines from 01a_tutorial_mission
; Called from mission_01a
(script static void training_shield
	;//...// Irrelevant code
	
	(print "This station will test your recharging energy shields")
	(sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_3140_gun (ai_get_object guns) 1)
	(sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_3140_gun))
	
	(cs_run_command_script guns cs_guns_zapper)
	
	(sleep_until
		(if
			(= (device_group_get zapper_control_group) 1)
			(begin true)
			(if
				(> (objects_distance_to_object (players) (ai_get_object guns)) 2.5)
				(begin false)
				(cond
					(
						(> timer_prompt_zapper 0)
						(begin
							(set timer_prompt_zapper (- timer_prompt_zapper 1))
							false
						)
					)
					(
						(> timer_prompt_zapper_lookatme 0)
						(begin
							(set timer_prompt_zapper_lookatme (- timer_prompt_zapper_lookatme 1))
							(set timer_prompt_zapper_getin (- timer_prompt_zapper_getin 1))
							(set timer_prompt_zapper_button (- timer_prompt_zapper_button 1))
							(if
								(objects_can_see_object (player0) (ai_get_object guns) 40)
								(begin
									(sleep 15)
									(set timer_prompt_zapper_lookatme 0)
								)
							)
							false
						)
					)
					(
						(> timer_prompt_zapper_getin 0)
						(begin
							(set timer_prompt_zapper_lookatme (- timer_prompt_zapper_lookatme 1))
							(set timer_prompt_zapper_getin (- timer_prompt_zapper_getin 1))
							(set timer_prompt_zapper_button (- timer_prompt_zapper_button 1))
							(if
								(volume_test_objects tv_zapper (players))
								(begin
									(sleep 15)
									(set timer_prompt_zapper_getin 0)
								)
							)
							false
						)
					)
					(
						(> timer_prompt_zapper_button 0)
						(begin
							(set timer_prompt_zapper_button (- timer_prompt_zapper_button 1))
							(set timer_prompt_zapper_getin (- timer_prompt_zapper_getin 1))
							(set timer_prompt_zapper_button (- timer_prompt_zapper_button 1))
							(if
								(= (device_group_get zapper_control_group) 1)
								(begin
									(sleep 15)
									(set timer_prompt_zapper_button 0)
								)
							)
							false
						)
					)
					(
						(not (objects_can_see_object (player0) (ai_get_object guns) 40))
						(prompt_zapper_lookatme)
					)
					(
						(not (volume_test_objects tv_zapper (players)))
						(prompt_zapper_getin) ; <----- Calls prompt_zapper_getin -----------------------
					)
					(
						true
						(prompt_zapper_button)
					)
				)
			)
		)
		1
	)
	
	;//...// Irrelevant code
)
```
### prompt_zapper_getin
```lisp
; Lines from 01a_tutorial_mission
; Called from training_shield
(script static void prompt_zapper_getin
	(hud_show_training_text false)
	(cond
		(
			(= counter_prompt_zapper_getin 0)
			(begin
				(custom_animation (ai_get_unit guns) objects\characters\marine\tutorial\tutorial l01_0900_jon true)
				(objectives_finish_up_to 0)
				(objectives_show_up_to 1)
				(sleep 10)
				(print "Step on in. I'll show you.")
				(sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_0900_gun (ai_get_object guns) 1)
				(set timer_prompt_zapper (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_0900_gun))
				(set timer_prompt_zapper_getin (+ timer_prompt_zapper delay_prompt_short))
			)
		)
		(
			(= counter_prompt_zapper_getin 1)
			(begin
				(cs_run_command_script guns cs_guns_zapper_prompt)
				(sleep 30)
				(print "Step into the red sqaure, Chief, and we'll get started.")
				(sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_3230_gun (ai_get_object guns) 1)
				(set timer_prompt_zapper (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_3230_gun))
				(set timer_prompt_zapper_getin (+ timer_prompt_zapper delay_prompt_short))
			)
		)
		(
			(= counter_prompt_zapper_getin 2)
			(begin
				(cs_run_command_script guns cs_guns_zapper_prompt)
				(sleep 30)
				(print "Chief? Stand in the red square.")
				(sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_3240_gun (ai_get_object guns) 1)
				(set timer_prompt_zapper (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_3240_gun))
				(set timer_prompt_zapper_getin (+ timer_prompt_zapper delay_prompt_medium))
			)
		)
		(
			(= counter_prompt_zapper_getin 3)
			(begin
				(cs_run_command_script guns cs_guns_zapper_prompt)
				(sleep 30)
				(print "You have to stand in the red square before we can start the test.")
				(sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_3250_gun (ai_get_object guns) 1)
				(set timer_prompt_zapper (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_3250_gun))
				(set timer_prompt_zapper_getin (+ timer_prompt_zapper delay_prompt_medium))
			)
		)
		(
			(= counter_prompt_zapper_getin 4)
			(begin
				(cs_run_command_script guns cs_guns_zapper_prompt)
				(unit_set_emotional_state (ai_get_unit guns) annoyed 0.5 1)
				(sleep 30)
				(print "Go ahead and stand in the red sqaure. it'll just take a minute.")
				(sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_3260_gun (ai_get_object guns) 1)
				(set timer_prompt_zapper (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_3260_gun))
				(set timer_prompt_zapper_getin (+ timer_prompt_zapper delay_prompt_long))
			)
		)
		(
			(= counter_prompt_zapper_getin 5)
			(begin
				(cs_run_command_script guns cs_guns_zapper_prompt)
				(unit_set_emotional_state (ai_get_unit guns) annoyed 0.5 1)
				(sleep 30)
				(print "Come on, son, step into the red square.")
				(sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_3270_gun (ai_get_object guns) 1)
				(set timer_prompt_zapper (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_3270_gun))
				(set timer_prompt_zapper_getin (+ timer_prompt_zapper delay_prompt_long))
				(hud_set_training_text tutorial_zapper_getin)
				(hud_show_training_text true)
			)
		)
		(
			(= counter_prompt_zapper_getin 5) ; <--- Source of the bug ---------------------------------
			(begin
				(cs_run_command_script guns cs_guns_zapper_prompt)
				(unit_set_emotional_state (ai_get_unit guns) annoyed 0.5 1)
				(sleep 30)
				(print "Will you stop screwing around? Stand in the red square!")
				(sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_3280_gun (ai_get_object guns) 1)
				(set timer_prompt_zapper (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_3280_gun))
				(set timer_prompt_zapper_getin (+ timer_prompt_zapper delay_prompt_long))
				(hud_set_training_text tutorial_zapper_getin)
				(hud_show_training_text true)
			)
		)
		(
			(= counter_prompt_zapper_getin 5) ; <--- Source of the bug ---------------------------------
			(begin
				(cs_run_command_script guns cs_guns_zapper_prompt)
				(unit_set_emotional_state (ai_get_unit guns) angry 0.5 1)
				(sleep 30)
				(print "Stop bustin' my balls, and step in the damn square!")
				(sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_3290_gun (ai_get_object guns) 1)
				(set timer_prompt_zapper (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_3290_gun) )
				(set timer_prompt_zapper_getin (+ timer_prompt_zapper delay_prompt_drag) )
				(hud_set_training_text tutorial_zapper_getin)
				(hud_show_training_text true)
			)
		)
		(
			true
			(set counter_prompt_zapper_getin 2)
		)
	)
	(set counter_prompt_zapper_getin (+ counter_prompt_zapper_getin 1))
)
```