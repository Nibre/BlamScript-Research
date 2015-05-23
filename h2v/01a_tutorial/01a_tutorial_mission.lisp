(global short seconds 30)
(global short global_random 0)
(global short global_random_rumble 0)
(global short global_random_bridge 0)
(global short delay_prompt_blink (* 2 seconds))
(global short delay_prompt_short (* 8 seconds))
(global short delay_prompt_medium (* 16 seconds))
(global short delay_prompt_long (* 36 seconds))
(global short delay_prompt_drag (* 48 seconds))
(global short delay_prompt_final (* 60 seconds))
(global bool mark_bsp0 False)
(global bool mark_bsp1 False)
(global bool mark_bsp2 False)
(global bool mark_bsp3 False)
(global bool mark_bsp4 False)
(global bool mark_bsp5 False)
(global short counter_mindread_normal_success 0)
(global short counter_mindread_invert_success 0)
(global short counter_training_pitch_choose 0)
(global short counter_prompt_looker_start 0)
(global short counter_prompt_looker 0)
(global short counter_prompt_start_spot 0)
(global short counter_prompt_careful 0)
(global short counter_prompt_zapper_lookatme 0)
(global short counter_prompt_zapper_getin 0)
(global short counter_prompt_zapper_button 0)
(global short counter_prompt_elevator_plr 0)
(global bool mark_looker_light_left False)
(global bool mark_looker_light_right False)
(global bool mark_looker_light_top False)
(global bool mark_looker_light_bottom False)
(global bool mark_training_free False)
(global bool mark_training_done False)
(global short timer_training_pitch_choose 0)
(global short timer_prompt_looker_start 0)
(global short timer_prompt_looker 0)
(global short timer_prompt_start_spot 0)
(global short timer_prompt_careful 0)
(global short timer_prompt_zapper 0)
(global short timer_prompt_zapper_lookatme 0)
(global short timer_prompt_zapper_getin 0)
(global short timer_prompt_zapper_button 0)
(global short timer_prompt_elevator_plr 0)
(global bool mark_ice_cream False)

(script static save_look_start 
  (begin 
   (if (game_safe_to_save) 
   (data_mine_set_mission_segment "01a_look_start"))
  )
)

(script static save_move_start 
  (begin 
   (game_save) 
   (if (game_safe_to_save) 
   (data_mine_set_mission_segment "01a_move_start"))
  )
)

(script static save_shield_start 
  (begin 
   (game_save) 
   (if (game_safe_to_save) 
   (data_mine_set_mission_segment "01a_shield_start"))
  )
)

(script static save_tram_start 
  (begin 
   (game_save) 
   (if (game_safe_to_save) 
   (data_mine_set_mission_segment "01a_tram_start"))
  )
)

(script command cs_lookat_player 
  (begin 
   (cs_face_player True) 
   (sleep_forever)
  )
)

(script command cs_lookat_guns 
  (begin 
   (cs_face_object True (ai_get_object guns)) 
   (sleep_forever)
  )
)

(script command cs_johnson_glanceat_guns 
  (begin 
   (cs_enable_looking True) 
   (cs_look_object True (ai_get_object guns)) 
   (sleep_forever)
  )
)

(script command cs_lookat_johnson 
  (begin 
   (cs_face_object True (ai_get_object johnson)) 
   (sleep_forever)
  )
)

(script command cs_lookat_console_zapper 
  (begin 
   (cs_look True guns_points/console_zapper) 
   (sleep 45) 
   (cs_face_player True) 
   (sleep_forever)
  )
)

(script command cs_lookat_console_toplight 
  (begin 
   (cs_aim_object True looker_light_top_red) 
   (sleep 45) 
   (cs_face True guns_points/console_inhibitor) 
   (sleep 30) 
   (cs_face_player True) 
   (sleep_forever)
  )
)

(script command cs_lookat_console_bottomlight 
  (begin 
   (cs_aim_object True looker_light_bottom_red) 
   (sleep 45) 
   (cs_face True guns_points/console_inhibitor) 
   (sleep 30) 
   (cs_face_player True) 
   (sleep_forever)
  )
)

(script command cs_lookat_console_inhibitor 
  (begin 
   (cs_face True guns_points/console_inhibitor) 
   (sleep 30) 
   (cs_face_player True) 
   (sleep_forever)
  )
)

(script command cs_guns_start 
  (begin 
   (cs_force_combat_status 2) 
   (cs_enable_moving False) 
   (cs_enable_pathfinding_failsafe True) 
   (cs_go_to guns_points/start) 
   (cs_face_player True) 
   (sleep_forever)
  )
)

(script command cs_guns_zapper_halfway 
  (begin 
   (cs_force_combat_status 2) 
   (cs_enable_moving False) 
   (cs_enable_pathfinding_failsafe True) 
   (cs_go_to guns_points/zapper_halfway) 
   (cs_face_player True) 
   (sleep_forever)
  )
)

(script command cs_guns_zapper_wait 
  (begin 
   (cs_force_combat_status 2) 
   (cs_enable_moving False) 
   (cs_enable_pathfinding_failsafe True) 
   (cs_go_to guns_points/zapper) 
   (cs_face_player True) 
   (sleep_forever)
  )
)

(script command cs_guns_zapper 
  (begin 
   (cs_force_combat_status 2) 
   (cs_enable_moving False) 
   (cs_enable_pathfinding_failsafe True) 
   (cs_go_to_and_face guns_points/zapper guns_points/zapper_face) 
   (cs_face True guns_points/zapper_face) 
   (sleep_forever)
  )
)

(script command cs_guns_zapper_prompt 
  (begin 
   (cs_force_combat_status 2) 
   (cs_enable_moving False) 
   (cs_enable_pathfinding_failsafe True) 
   (cs_face_player True) 
   (sleep 90) 
   (cs_face_player False) 
   (cs_go_to_and_face guns_points/zapper guns_points/zapper_face) 
   (cs_face True guns_points/zapper_face) 
   (sleep_forever)
  )
)

(script command cs_johnson_start 
  (begin 
   (cs_force_combat_status 2) 
   (cs_enable_moving False) 
   (cs_enable_pathfinding_failsafe True) 
   (cs_go_to johnson_points/start) 
   (cs_face_player True) 
   (sleep_forever)
  )
)

(script command cs_johnson_elevator 
  (begin 
   (cs_force_combat_status 2) 
   (cs_enable_moving False) 
   (cs_enable_pathfinding_failsafe True) 
   (cs_go_to johnson_points/elevator) 
   (cs_face_player True) 
   (sleep_forever)
  )
)

(script command cs_johnson_elevator_face_guns 
  (begin 
   (cs_force_combat_status 2) 
   (cs_enable_moving False) 
   (cs_enable_pathfinding_failsafe True) 
   (cs_go_to johnson_points/elevator) 
   (cs_face_object True (ai_get_object guns)) 
   (sleep_forever)
  )
)

(script command cs_guns_elevator 
  (begin 
   (cs_force_combat_status 2) 
   (cs_enable_moving False) 
   (cs_enable_pathfinding_failsafe True) 
   (cs_go_to guns_points/elevator) 
   (cs_face_player True) 
   (sleep_forever)
  )
)

(script command cs_johnson_tram 
  (begin 
   (cs_force_combat_status 2) 
   (cs_enable_moving False) 
   (cs_enable_pathfinding_failsafe True) 
   (cs_go_to_and_face johnson_points/tram johnson_points/earth) 
   (cs_face True johnson_points/earth) 
   (sleep_forever)
  )
)

(script command cs_lookat_macgun 
  (begin 
   (cs_force_combat_status 2) 
   (cs_enable_moving False) 
   (cs_enable_pathfinding_failsafe True) 
   (cs_ignore_obstacles True) 
   (cs_go_to_and_face johnson_points/tram_2 johnson_points/macgun) 
   (cs_face True johnson_points/macgun) 
   (sleep_forever)
  )
)

(script command cs_lookat_malta 
  (begin 
   (cs_face True johnson_points/malta) 
   (sleep_forever)
  )
)

(script command cs_lookat_fleet 
  (begin 
   (cs_face_object True inamberclad) 
   (cs_look_object True inamberclad) 
   (sleep_forever)
  )
)

(script command cs_johnson_lookat_station 
  (begin 
   (cs_face True johnson_points/station) 
   (sleep_forever)
  )
)

(script command cs_johnson_station 
  (begin 
   (cs_force_combat_status 2) 
   (cs_enable_moving False) 
   (cs_enable_pathfinding_failsafe True) 
   (cs_go_to johnson_points/station) 
   (cs_face_player True) 
   (sleep_forever)
  )
)

(script static prompt_looker_start 
  (begin 
   (if (= counter_prompt_looker_start 0) 
    (begin 
     (begin 
      (print "go ahead and look at each of the four lights, chief.") 
      (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_3110_gun (ai_get_object guns) 1) 
      (set timer_prompt_looker 
       (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_3110_gun)) 
       (set timer_prompt_looker 
        (+ timer_prompt_looker delay_prompt_short))
       )
      ) 
      (if (= counter_prompt_looker_start 1) 
       (begin 
        (begin 
         (print "go ahead and target them one more time.") 
         (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_1360_gun (ai_get_object guns) 1) 
         (set timer_prompt_looker 
          (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_1360_gun)) 
          (set timer_prompt_looker 
           (+ timer_prompt_looker delay_prompt_medium))
          )
         ) 
         (if True 
          (begin 
           (set counter_prompt_looker_start 0)
          ) void))) 
          (set counter_prompt_looker_start 
           (+ counter_prompt_looker_start 1)) False)
          
)

(script static prompt_looker 
  (begin 
   (if (= counter_prompt_looker 0) 
    (begin 
     (begin 
      (print "you have to look at each light until it turns green.") 
      (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_1310_gun (ai_get_object guns) 1) 
      (set timer_prompt_looker 
       (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_1310_gun)) 
       (set timer_prompt_looker 
        (+ timer_prompt_looker delay_prompt_short))
       )
      ) 
      (if (= counter_prompt_looker 1) 
       (begin 
        (begin 
         (print "you gotta look at all the lights to complete the test.") 
         (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_1370_gun (ai_get_object guns) 1) 
         (set timer_prompt_looker 
          (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_1370_gun)) 
          (set timer_prompt_looker 
           (+ timer_prompt_looker delay_prompt_short))
          )
         ) 
         (if (= counter_prompt_looker 2) 
          (begin 
           (begin 
            (unit_set_emotional_state (ai_get_unit guns) annoyed 0.5 1) 
            (print "look at the lights, chief, one by one.") 
            (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_1300_gun (ai_get_object guns) 1) 
            (set timer_prompt_looker 
             (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_1300_gun)) 
             (set timer_prompt_looker 
              (+ timer_prompt_looker delay_prompt_medium))
             )
            ) 
            (if (= counter_prompt_looker 3) 
             (begin 
              (begin 
               (unit_set_emotional_state (ai_get_unit guns) annoyed 0.5 1) 
               (print "please look at the lights again, son.") 
               (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_1350_gun (ai_get_object guns) 1) 
               (set timer_prompt_looker 
                (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_1350_gun)) 
                (set timer_prompt_looker 
                 (+ timer_prompt_looker delay_prompt_medium))
                )
               ) 
               (if True 
                (begin 
                 (set counter_prompt_looker 0)
                ) void))))) 
                (set counter_prompt_looker 
                 (+ counter_prompt_looker 1)) False)
                
)

(script static prompt_start_spot 
  (begin 
   (if (= counter_prompt_start_spot 0) 
    (begin 
     (begin 
      (print "go on, walk around, try it out.") 
      (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_0820_gun (ai_get_object guns) 1) 
      (set timer_prompt_start_spot 
       (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_0820_gun)) 
       (set timer_prompt_start_spot 
        (+ timer_prompt_start_spot delay_prompt_short))
       )
      ) 
      (if (= counter_prompt_start_spot 1) 
       (begin 
        (begin 
         (unit_set_emotional_state (ai_get_unit guns) inquisitive 0.5 1) 
         (print "something wrong son?  can't you move?") 
         (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_0830_gun (ai_get_object guns) 1) 
         (set timer_prompt_start_spot 
          (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_0830_gun)) 
          (set timer_prompt_start_spot 
           (+ timer_prompt_start_spot delay_prompt_medium))
          )
         ) 
         (if (= counter_prompt_start_spot 2) 
          (begin 
           (begin 
            (unit_set_emotional_state (ai_get_unit guns) inquisitive 0.5 1) 
            (print "inhibitors are definitely off. you should be able to walk around.") 
            (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_0840_gun (ai_get_object guns) 1) 
            (set timer_prompt_start_spot 
             (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_0840_gun)) 
             (set timer_prompt_start_spot 
              (+ timer_prompt_start_spot delay_prompt_medium))
             )
            ) 
            (if True 
             (begin 
              (set counter_prompt_start_spot 0)
             ) void)))) 
             (set counter_prompt_start_spot 
              (+ counter_prompt_start_spot 1)) False)
             
)

(script static prompt_careful 
  (begin 
   (if (= counter_prompt_careful 0) 
    (begin 
     (begin 
      (cs_run_command_script guns cs_lookat_player) 
      (unit_set_emotional_state (ai_get_unit guns) scared 0.5 1) 
      (sleep 8) 
      (print "hey! take it easy!") 
      (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_0850_gun (ai_get_object guns) 1) 
      (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_0850_gun)) 
      (sleep 30) 
      (cs_run_command_script guns cs_guns_zapper_wait)
     )
    ) 
    (if (= counter_prompt_careful 1) 
     (begin 
      (begin 
       (cs_run_command_script guns cs_lookat_player) 
       (unit_set_emotional_state (ai_get_unit guns) scared 0.5 1) 
       (sleep 8) 
       (print "careful! you'll tear a tendon doing that!") 
       (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_0860_gun (ai_get_object guns) 1) 
       (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_0860_gun)) 
       (sleep 30) 
       (cs_run_command_script guns cs_guns_zapper_wait)
      )
     ) 
     (if (= counter_prompt_careful 2) 
      (begin 
       (begin 
        (cs_run_command_script guns cs_lookat_player) 
        (unit_set_emotional_state (ai_get_unit guns) annoyed 0.5 1) 
        (sleep 8) 
        (print "fine. but don't come crying to me when your rip your leg out of its socket.") 
        (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_0870_gun (ai_get_object guns) 1) 
        (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_0870_gun)) 
        (sleep 30) 
        (cs_run_command_script guns cs_guns_zapper_wait)
       )
      ) 
      (if True 
       (begin 
        (set counter_prompt_careful 2)
       ) void)))) 
       (set timer_prompt_careful delay_prompt_blink) 
       (set counter_prompt_careful 
        (+ counter_prompt_careful 1)) False)
       
)

(script static prompt_zapper_lookatme 
  (begin 
   (hud_show_training_text False) 
   (if (= counter_prompt_zapper_lookatme 0) 
    (begin 
     (begin 
      (cs_run_command_script guns cs_guns_zapper_prompt) 
      (unit_set_emotional_state (ai_get_unit guns) annoyed 0.5 1) 
      (sleep 30) 
      (print "are you listening to me?.") 
      (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_3160_gun (ai_get_object guns) 1) 
      (set timer_prompt_zapper 
       (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_3160_gun)) 
       (set timer_prompt_zapper_lookatme 
        (+ timer_prompt_zapper delay_prompt_short))
       )
      ) 
      (if (= counter_prompt_zapper_lookatme 1) 
       (begin 
        (begin 
         (cs_run_command_script guns cs_guns_zapper_prompt) 
         (unit_set_emotional_state (ai_get_unit guns) annoyed 0.5 1) 
         (sleep 30) 
         (print "over here, chief.  focus.") 
         (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_3170_gun (ai_get_object guns) 1) 
         (set timer_prompt_zapper 
          (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_3170_gun)) 
          (set timer_prompt_zapper_lookatme 
           (+ timer_prompt_zapper delay_prompt_short))
          )
         ) 
         (if (= counter_prompt_zapper_lookatme 2) 
          (begin 
           (begin 
            (cs_run_command_script guns cs_guns_zapper_prompt) 
            (unit_set_emotional_state (ai_get_unit guns) annoyed 0.5 1) 
            (sleep 30) 
            (print "it's considered respectful to look at someone when they are talking.") 
            (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_3180_gun (ai_get_object guns) 1) 
            (set timer_prompt_zapper 
             (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_3180_gun)) 
             (set timer_prompt_zapper_lookatme 
              (+ timer_prompt_zapper delay_prompt_medium))
             )
            ) 
            (if (= counter_prompt_zapper_lookatme 3) 
             (begin 
              (begin 
               (cs_run_command_script guns cs_guns_zapper_prompt) 
               (unit_set_emotional_state (ai_get_unit guns) angry 0.5 1) 
               (sleep 30) 
               (print "this is important, you could at least look at me while i explain it.") 
               (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_3190_gun (ai_get_object guns) 1) 
               (set timer_prompt_zapper 
                (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_3190_gun)) 
                (set timer_prompt_zapper_lookatme 
                 (+ timer_prompt_zapper delay_prompt_medium))
                )
               ) 
               (if (= counter_prompt_zapper_lookatme 4) 
                (begin 
                 (begin 
                  (cs_run_command_script guns cs_guns_zapper_prompt) 
                  (unit_set_emotional_state (ai_get_unit guns) angry 0.5 1) 
                  (sleep 30) 
                  (print "i'm talking to you, chief.  loot at me.") 
                  (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_3200_gun (ai_get_object guns) 1) 
                  (set timer_prompt_zapper 
                   (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_3200_gun)) 
                   (set timer_prompt_zapper_lookatme 
                    (+ timer_prompt_zapper delay_prompt_long)) 
                    (hud_set_training_text tutorial_zapper_lookatme) 
                    (hud_show_training_text True)
                   )
                  ) 
                  (if (= counter_prompt_zapper_lookatme 5) 
                   (begin 
                    (begin 
                     (cs_run_command_script guns cs_guns_zapper_prompt) 
                     (unit_set_emotional_state (ai_get_unit guns) angry 0.5 1) 
                     (sleep 30) 
                     (print "i know you spartans think you know everything, but it couldn't hurt you to at least look this way.") 
                     (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_3210_gun (ai_get_object guns) 1) 
                     (set timer_prompt_zapper 
                      (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_3210_gun)) 
                      (set timer_prompt_zapper_lookatme 
                       (+ timer_prompt_zapper delay_prompt_long)) 
                       (hud_set_training_text tutorial_zapper_lookatme) 
                       (hud_show_training_text True)
                      )
                     ) 
                     (if (= counter_prompt_zapper_lookatme 6) 
                      (begin 
                       (begin 
                        (cs_run_command_script guns cs_guns_zapper_prompt) 
                        (unit_set_emotional_state (ai_get_unit guns) angry 0.5 1) 
                        (sleep 30) 
                        (print "look, just because the brass kisses your ass, doesn't mean i will.  look at me when i talk to you!") 
                        (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_3220_gun (ai_get_object guns) 1) 
                        (set timer_prompt_zapper 
                         (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_3220_gun)) 
                         (set timer_prompt_zapper_lookatme 
                          (+ timer_prompt_zapper delay_prompt_drag)) 
                          (hud_set_training_text tutorial_zapper_lookatme) 
                          (hud_show_training_text True)
                         )
                        ) 
                        (if True 
                         (begin 
                          (set counter_prompt_zapper_lookatme 3)
                         ) void)))))))) 
                         (set counter_prompt_zapper_lookatme 
                          (+ counter_prompt_zapper_lookatme 1)) False)
                         
)

(script static prompt_zapper_getin 
  (begin 
   (hud_show_training_text False) 
   (if (= counter_prompt_zapper_getin 0) 
    (begin 
     (begin 
      (custom_animation (ai_get_unit guns) objects\characters\marine\tutorial\tutorial l01_0900_jon True) 
      (objectives_finish_up_to 0) 
      (objectives_show_up_to 1) 
      (sleep 10) 
      (print "step on in. i'll show you.") 
      (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_0900_gun (ai_get_object guns) 1) 
      (set timer_prompt_zapper 
       (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_0900_gun)) 
       (set timer_prompt_zapper_getin 
        (+ timer_prompt_zapper delay_prompt_short))
       )
      ) 
      (if (= counter_prompt_zapper_getin 1) 
       (begin 
        (begin 
         (cs_run_command_script guns cs_guns_zapper_prompt) 
         (sleep 30) 
         (print "step into the red sqaure, chief, and we'll get started.") 
         (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_3230_gun (ai_get_object guns) 1) 
         (set timer_prompt_zapper 
          (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_3230_gun)) 
          (set timer_prompt_zapper_getin 
           (+ timer_prompt_zapper delay_prompt_short))
          )
         ) 
         (if (= counter_prompt_zapper_getin 2) 
          (begin 
           (begin 
            (cs_run_command_script guns cs_guns_zapper_prompt) 
            (sleep 30) 
            (print "chief? stand in the red square.") 
            (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_3240_gun (ai_get_object guns) 1) 
            (set timer_prompt_zapper 
             (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_3240_gun)) 
             (set timer_prompt_zapper_getin 
              (+ timer_prompt_zapper delay_prompt_medium))
             )
            ) 
            (if (= counter_prompt_zapper_getin 3) 
             (begin 
              (begin 
               (cs_run_command_script guns cs_guns_zapper_prompt) 
               (sleep 30) 
               (print "you have to stand in the red square before we can start the test.") 
               (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_3250_gun (ai_get_object guns) 1) 
               (set timer_prompt_zapper 
                (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_3250_gun)) 
                (set timer_prompt_zapper_getin 
                 (+ timer_prompt_zapper delay_prompt_medium))
                )
               ) 
               (if (= counter_prompt_zapper_getin 4) 
                (begin 
                 (begin 
                  (cs_run_command_script guns cs_guns_zapper_prompt) 
                  (unit_set_emotional_state (ai_get_unit guns) annoyed 0.5 1) 
                  (sleep 30) 
                  (print "go ahead and stand in the red sqaure.  it'll just take a minute.") 
                  (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_3260_gun (ai_get_object guns) 1) 
                  (set timer_prompt_zapper 
                   (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_3260_gun)) 
                   (set timer_prompt_zapper_getin 
                    (+ timer_prompt_zapper delay_prompt_long))
                   )
                  ) 
                  (if (= counter_prompt_zapper_getin 5) 
                   (begin 
                    (begin 
                     (cs_run_command_script guns cs_guns_zapper_prompt) 
                     (unit_set_emotional_state (ai_get_unit guns) annoyed 0.5 1) 
                     (sleep 30) 
                     (print "come on, son, step into the red square.") 
                     (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_3270_gun (ai_get_object guns) 1) 
                     (set timer_prompt_zapper 
                      (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_3270_gun)) 
                      (set timer_prompt_zapper_getin 
                       (+ timer_prompt_zapper delay_prompt_long)) 
                       (hud_set_training_text tutorial_zapper_getin) 
                       (hud_show_training_text True)
                      )
                     ) 
                     (if (= counter_prompt_zapper_getin 5) 
                      (begin 
                       (begin 
                        (cs_run_command_script guns cs_guns_zapper_prompt) 
                        (unit_set_emotional_state (ai_get_unit guns) annoyed 0.5 1) 
                        (sleep 30) 
                        (print "will you stop screwing around?  stand in the red square!") 
                        (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_3280_gun (ai_get_object guns) 1) 
                        (set timer_prompt_zapper 
                         (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_3280_gun)) 
                         (set timer_prompt_zapper_getin 
                          (+ timer_prompt_zapper delay_prompt_long)) 
                          (hud_set_training_text tutorial_zapper_getin) 
                          (hud_show_training_text True)
                         )
                        ) 
                        (if (= counter_prompt_zapper_getin 5) 
                         (begin 
                          (begin 
                           (cs_run_command_script guns cs_guns_zapper_prompt) 
                           (unit_set_emotional_state (ai_get_unit guns) angry 0.5 1) 
                           (sleep 30) 
                           (print "stop bustin' my balls, and step in the damn square!") 
                           (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_3290_gun (ai_get_object guns) 1) 
                           (set timer_prompt_zapper 
                            (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_3290_gun)) 
                            (set timer_prompt_zapper_getin 
                             (+ timer_prompt_zapper delay_prompt_drag)) 
                             (hud_set_training_text tutorial_zapper_getin) 
                             (hud_show_training_text True)
                            )
                           ) 
                           (if True 
                            (begin 
                             (set counter_prompt_zapper_getin 2)
                            ) void))))))))) 
                            (set counter_prompt_zapper_getin 
                             (+ counter_prompt_zapper_getin 1)) False)
                            
)

(script static prompt_zapper_button 
  (begin 
   (hud_show_training_text False) 
   (if (= counter_prompt_zapper_button 0) 
    (begin 
     (begin 
      (unit_set_emotional_state (ai_get_unit guns) angry 0 1) 
      (unit_set_emotional_state (ai_get_unit guns) annoyed 0 1) 
      (device_set_power zapper_control 1) 
      (print "your new armor's shields are extremely resilient - very efficient.") 
      (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_0880_gun (ai_get_object guns) 1) 
      (set timer_prompt_zapper 
       (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_0880_gun)) 
       (set timer_prompt_zapper_button 
        (+ timer_prompt_zapper 0))
       )
      ) 
      (if (= counter_prompt_zapper_button 1) 
       (begin 
        (begin 
         (print "much better than the covenant tech we used for the mark-five.") 
         (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_0890_gun (ai_get_object guns) 1) 
         (set timer_prompt_zapper 
          (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_0890_gun)) 
          (set timer_prompt_zapper_button 
           (+ timer_prompt_zapper 0))
          )
         ) 
         (if (= counter_prompt_zapper_button 2) 
          (begin 
           (begin 
            (custom_animation (ai_get_unit guns) objects\characters\marine\tutorial\tutorial l01_0910_jon True) 
            (objectives_finish_up_to 1) 
            (objectives_show_up_to 2) 
            (sleep 10) 
            (print "go ahead and use the switch in front of you to start the shield test.") 
            (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_3300_gun (ai_get_object guns) 1) 
            (set timer_prompt_zapper 
             (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_3300_gun)) 
             (set timer_prompt_zapper_button 
              (+ timer_prompt_zapper delay_prompt_short))
             )
            ) 
            (if (= counter_prompt_zapper_button 3) 
             (begin 
              (begin 
               (print "just place your hand on the touchpad to activate the switch.") 
               (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_3310_gun (ai_get_object guns) 1) 
               (set timer_prompt_zapper 
                (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_3310_gun)) 
                (set timer_prompt_zapper_button 
                 (+ timer_prompt_zapper delay_prompt_medium))
                )
               ) 
               (if (= counter_prompt_zapper_button 4) 
                (begin 
                 (begin 
                  (print "hit the switch, it won't hurt.much") 
                  (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_3340_gun (ai_get_object guns) 1) 
                  (set timer_prompt_zapper 
                   (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_3340_gun)) 
                   (set timer_prompt_zapper_button 
                    (+ timer_prompt_zapper delay_prompt_medium))
                   )
                  ) 
                  (if (= counter_prompt_zapper_button 5) 
                   (begin 
                    (begin 
                     (print "go ahead and use that switch in front of you.") 
                     (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_3330_gun (ai_get_object guns) 1) 
                     (set timer_prompt_zapper 
                      (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_3330_gun)) 
                      (set timer_prompt_zapper_button 
                       (+ timer_prompt_zapper delay_prompt_long)) 
                       (hud_set_training_text tutorial_zapper_button) 
                       (hud_show_training_text True)
                      )
                     ) 
                     (if (= counter_prompt_zapper_button 6) 
                      (begin 
                       (begin 
                        (print "the switch right in front of you will start the shield test.") 
                        (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_3320_gun (ai_get_object guns) 1) 
                        (set timer_prompt_zapper 
                         (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_3320_gun)) 
                         (set timer_prompt_zapper_button 
                          (+ timer_prompt_zapper delay_prompt_long)) 
                          (hud_set_training_text tutorial_zapper_button) 
                          (hud_show_training_text True)
                         )
                        ) 
                        (if (= counter_prompt_zapper_button 7) 
                         (begin 
                          (begin 
                           (unit_set_emotional_state (ai_get_unit guns) annoyed 0.5 1) 
                           (print "it's a switch.  you press it.") 
                           (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_3350_gun (ai_get_object guns) 1) 
                           (set timer_prompt_zapper 
                            (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_3350_gun)) 
                            (set timer_prompt_zapper_button 
                             (+ timer_prompt_zapper delay_prompt_drag)) 
                             (hud_set_training_text tutorial_zapper_button) 
                             (hud_show_training_text True)
                            )
                           ) 
                           (if True 
                            (begin 
                             (set counter_prompt_zapper_button 2)
                            ) void))))))))) 
                            (set counter_prompt_zapper_button 
                             (+ counter_prompt_zapper_button 1)) False)
                            
)

(script static prompt_elevator_plr 
  (begin 
   (hud_show_training_text False) 
   (if (= counter_prompt_elevator_plr 0) 
    (begin 
     (begin 
      (set timer_prompt_elevator_plr 
       (+ timer_prompt_elevator_plr delay_prompt_short)) 
       (objectives_show_up_to 3)
      )
     ) 
     (if (= counter_prompt_elevator_plr 1) 
      (begin 
       (begin 
        (print "c'mon, chief, they're ready for us on the bridge.") 
        (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_1640_jon (ai_get_object johnson) 1) 
        (set timer_prompt_elevator_plr 
         (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_1640_jon)) 
         (set timer_prompt_elevator_plr 
          (+ timer_prompt_elevator_plr delay_prompt_short))
         )
        ) 
        (if (= counter_prompt_elevator_plr 2) 
         (begin 
          (begin 
           (print "get on the lift, cheif, we're gonna be late.") 
           (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_1650_jon (ai_get_object johnson) 1) 
           (set timer_prompt_elevator_plr 
            (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_1650_jon)) 
            (set timer_prompt_elevator_plr 
             (+ timer_prompt_elevator_plr delay_prompt_long)) 
             (set timer_prompt_elevator_plr 
              (+ timer_prompt_elevator_plr delay_prompt_medium))
             )
            ) 
            (if (= counter_prompt_elevator_plr 3) 
             (begin 
              (begin 
               (unit_set_emotional_state (ai_get_unit johnson) annoyed 0.5 1) 
               (print "i don't want to keep the brass waiting, chief.") 
               (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_1660_jon (ai_get_object johnson) 1) 
               (set timer_prompt_elevator_plr 
                (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_1660_jon)) 
                (set timer_prompt_elevator_plr 
                 (+ timer_prompt_elevator_plr delay_prompt_long)) 
                 (set timer_prompt_elevator_plr 
                  (+ timer_prompt_elevator_plr delay_prompt_medium))
                 )
                ) 
                (if (= counter_prompt_elevator_plr 4) 
                 (begin 
                  (begin 
                   (unit_set_emotional_state (ai_get_unit johnson) annoyed 0.5 1) 
                   (print "fine. you can tell lord hood why we're late!") 
                   (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_1670_jon (ai_get_object johnson) 1) 
                   (set timer_prompt_elevator_plr 
                    (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_1670_jon)) 
                    (set timer_prompt_elevator_plr 
                     (+ timer_prompt_elevator_plr delay_prompt_long)) 
                     (set timer_prompt_elevator_plr 
                      (+ timer_prompt_elevator_plr delay_prompt_long))
                     )
                    ) 
                    (if (= counter_prompt_elevator_plr 5) 
                     (begin 
                      (begin 
                       (unit_set_emotional_state (ai_get_unit johnson) angry 0.5 1) 
                       (print "get your shiny green posterior on this elevator!") 
                       (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_1680_jon (ai_get_object johnson) 1) 
                       (set timer_prompt_elevator_plr 
                        (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_1680_jon)) 
                        (set timer_prompt_elevator_plr 
                         (+ timer_prompt_elevator_plr delay_prompt_long)) 
                         (set timer_prompt_elevator_plr 
                          (+ timer_prompt_elevator_plr delay_prompt_long))
                         )
                        ) 
                        (if (= counter_prompt_elevator_plr 6) 
                         (begin 
                          (begin 
                           (unit_set_emotional_state (ai_get_unit johnson) angry 0.5 1) 
                           (print "would it help if i said please?") 
                           (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_1690_jon (ai_get_object johnson) 1) 
                           (set timer_prompt_elevator_plr 
                            (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_1690_jon)) 
                            (set timer_prompt_elevator_plr 
                             (+ timer_prompt_elevator_plr delay_prompt_long)) 
                             (set timer_prompt_elevator_plr 
                              (+ timer_prompt_elevator_plr delay_prompt_drag)) 
                              (set mark_ice_cream True)
                             )
                            ) 
                            (if True 
                             (begin 
                              (set counter_prompt_elevator_plr 0)
                             ) void)))))))) 
                             (set counter_prompt_elevator_plr 
                              (+ counter_prompt_elevator_plr 1)) False)
                             
)

(script static training_setup 
  (begin 
   (game_can_use_flashlights False) 
   (unit_set_maximum_vitality 
    (player0)
    30 1) 
   (device_set_power zapper_control 0) 
   (device_set_position_immediate elevator_tram 0) 
   (ai_place guns) 
   (ai_cannot_die guns True) 
   (cs_run_command_script guns cs_guns_start)
  )
)

(script startup icecream 
  (begin 
   (sleep_until (and mark_ice_cream (difficulty_legendary)) 1) 
   (object_create cookiesncream) 
   (sleep_until (or (unit_has_weapon (unit 
    (player0)
   ) objects\weapons\multiplayer\ball\head_sp.weapon) (unit_has_weapon (unit 
    (player1)
   ) objects\weapons\multiplayer\ball\head_sp.weapon)) 1) 
   (ice_cream_flavor_stock 14) 
   (print "blam")
  )
)

(script static test_mindread_up 
  (begin 
   (object_create looker_light_top_red) 
   (player_action_test_reset) 
   (player_action_test_look_up_begin) 
   (player_camera_control True) 
   (cs_run_command_script guns cs_lookat_console_toplight) 
   (sleep_until (or (objects_can_see_object (players) looker_light_top_red 5) (player0_looking_up)) 1 360) 
   (if (not (or (objects_can_see_object (players) looker_light_top_red 5) (player0_looking_up))) 
    (begin 
     (print "go ahead and look at the top light, chief.") 
     (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_3070_gun (ai_get_object guns) 1) 
     (hud_set_training_text tutorial_look_up) 
     (hud_show_training_text True) 
     (hud_enable_training True)
    )) 
    (cs_run_command_script guns cs_lookat_console_inhibitor) 
    (sleep_until (or (objects_can_see_object (players) looker_light_top_red 5) (player0_looking_up)) 1) 
    (player_camera_control False) 
    (hud_enable_training False) 
    (hud_show_training_text False) 
    (object_destroy looker_light_top_red) 
    (if (not (player_action_test_lookstick_backward)) 
     (begin 
      (begin 
       (set counter_mindread_normal_success 
        (+ counter_mindread_normal_success 1)) 
        (set counter_mindread_invert_success 0) 
        (print "normal success")
       )
      ) 
      (if (not (player_action_test_lookstick_forward)) 
       (begin 
        (begin 
         (set counter_mindread_invert_success 
          (+ counter_mindread_invert_success 1)) 
          (set counter_mindread_normal_success 0) 
          (print "invert success")
         )
        ) 
        (if True 
         (begin 
          (begin 
           (set counter_mindread_normal_success 0) 
           (set counter_mindread_invert_success 0)
          )
         ) void))) 
         (player_camera_control False) 
         (player_action_test_look_pitch_end) 
         (player_action_test_reset) 
         (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_3070_gun))
        )
)

(script static test_mindread_down 
  (begin 
   (object_create looker_light_bottom_red) 
   (player_action_test_reset) 
   (player_action_test_look_down_begin) 
   (player_camera_control True) 
   (cs_run_command_script guns cs_lookat_console_bottomlight) 
   (sleep_until (or (objects_can_see_object (players) looker_light_bottom_red 3) (player0_looking_down)) 1 360) 
   (if (not (or (objects_can_see_object (players) looker_light_bottom_red 3) (player0_looking_down))) 
    (begin 
     (print "look at the bottom light, son.") 
     (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_3060_gun (ai_get_object guns) 1) 
     (hud_set_training_text tutorial_look_down) 
     (hud_show_training_text True) 
     (hud_enable_training True)
    )) 
    (cs_run_command_script guns cs_lookat_console_inhibitor) 
    (sleep_until (or (objects_can_see_object (players) looker_light_bottom_red 3) (player0_looking_down)) 1) 
    (player_camera_control False) 
    (hud_enable_training False) 
    (hud_show_training_text False) 
    (object_destroy looker_light_bottom_red) 
    (if (not (player_action_test_lookstick_forward)) 
     (begin 
      (begin 
       (set counter_mindread_normal_success 
        (+ counter_mindread_normal_success 1)) 
        (set counter_mindread_invert_success 0) 
        (print "normal success")
       )
      ) 
      (if (not (player_action_test_lookstick_backward)) 
       (begin 
        (begin 
         (set counter_mindread_invert_success 
          (+ counter_mindread_invert_success 1)) 
          (set counter_mindread_normal_success 0) 
          (print "invert success")
         )
        ) 
        (if True 
         (begin 
          (begin 
           (set counter_mindread_normal_success 0) 
           (set counter_mindread_invert_success 0)
          )
         ) void))) 
         (player_camera_control False) 
         (player_action_test_look_pitch_end) 
         (player_action_test_reset) 
         (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_3060_gun))
        )
)

(script static training_looker_lights_on 
  (begin 
   (object_destroy looker_light_left_green) 
   (object_create looker_light_left_red) 
   (set mark_looker_light_left True) 
   (object_destroy looker_light_right_green) 
   (object_create looker_light_right_red) 
   (set mark_looker_light_right True) 
   (object_destroy looker_light_top_green) 
   (object_create looker_light_top_red) 
   (set mark_looker_light_top True) 
   (object_destroy looker_light_bottom_green) 
   (object_create looker_light_bottom_red) 
   (set mark_looker_light_bottom True)
  )
)

(script static training_looker_lights_off 
  (begin 
   (object_destroy looker_light_left_green) 
   (object_destroy looker_light_left_red) 
   (object_destroy looker_light_right_green) 
   (object_destroy looker_light_right_red) 
   (object_destroy looker_light_top_green) 
   (object_destroy looker_light_top_red) 
   (object_destroy looker_light_bottom_green) 
   (object_destroy looker_light_bottom_red)
  )
)

(script static test_all_lights_off 
  (begin 
   (not (or mark_looker_light_left mark_looker_light_right mark_looker_light_top mark_looker_light_bottom))
  )
)

(script static training_pitch_choose 
  (begin 
   (if (<= counter_training_pitch_choose 2) 
    (begin 
     (training_looker_lights_on) 
     (prompt_looker_start) 
     (sleep_until (if (test_all_lights_off) 
      (begin True)
      (if (objects_can_see_object (players) looker_light_left_red 5) 
      (begin 
       (begin 
        (object_destroy looker_light_left_red) 
        (object_create_anew looker_light_left_green) (set mark_looker_light_left False)
       )
      ) (if (objects_can_see_object (players) looker_light_right_red 5) 
       (begin 
        (begin 
         (object_destroy looker_light_right_red) 
         (object_create_anew looker_light_right_green) (set mark_looker_light_right False)
        )
       ) (if (objects_can_see_object (players) looker_light_top_red 5) 
        (begin 
         (begin 
          (object_destroy looker_light_top_red) 
          (object_create_anew looker_light_top_green) (set mark_looker_light_top False)
         )
        ) (if (objects_can_see_object (players) looker_light_bottom_red 5) 
         (begin 
          (begin 
           (object_destroy looker_light_bottom_red) 
           (object_create_anew looker_light_bottom_green) (set mark_looker_light_bottom False)
          )
         ) (if (> timer_prompt_looker 0) 
          (begin 
           (begin 
            (set timer_prompt_looker 
             (- timer_prompt_looker 1)) False)
            
           ) (if True 
            (begin 
             (prompt_looker)
            ) False))))))) 1)
           )) 
           (set counter_training_pitch_choose 
            (+ counter_training_pitch_choose 1)) 
            (if (controller_get_look_invert) 
             (begin 
              (print "should i leave it inverted, or put it back to normal?") 
              (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_1450_gun (ai_get_object guns) 1) 
              (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_1450_gun)) 
              (print "press a to leave lookstick inverted, press b to try it normal.") 
              (hud_set_training_text tutorial_choose_invert)
             ) 
              (begin 
               (print "should i leave it normal, or put it back to inverted?") 
               (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_1470_gun (ai_get_object guns) 1) 
               (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_1470_gun)) 
               (print "press a to leave lookstick normal, press b to try it inverted.") 
               (hud_set_training_text tutorial_choose_normal)
              )) 
              (hud_show_training_text True) 
              (hud_enable_training True) 
              (player_action_test_reset) 
              (sleep_until (or (player_action_test_accept) (player_action_test_cancel)) 1) 
              (hud_enable_training False) 
              (hud_show_training_text False) (if (player_action_test_accept) True 
               (begin 
                (controller_set_look_invert (not (controller_get_look_invert))) 
                (if (controller_get_look_invert) 
                 (begin 
                  (cs_run_command_script guns cs_lookat_console_inhibitor) 
                  (sleep 15) 
                  (print "ok, now it's inverted.") 
                  (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_1480_gun (ai_get_object guns) 1) 
                  (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_1480_gun))
                 ) 
                  (begin 
                   (cs_run_command_script guns cs_lookat_console_inhibitor) 
                   (sleep 15) 
                   (print "ok, now it's back to normal.") 
                   (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_1460_gun (ai_get_object guns) 1) 
                   (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_1460_gun))
                  )) False)
                 )
                )
)

(script static training_pitch 
  (begin 
   (if (>= counter_mindread_normal_success counter_mindread_invert_success) 
   (controller_set_look_invert False) 
   (controller_set_look_invert True)) 
   (print "tracking looks sketchy, i'm going to run you through the full diagnostic.") 
   (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_3100_gun (ai_get_object guns) 1) 
   (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_3100_gun)) 
   (if (controller_get_look_invert) 
    (begin 
     (print "the diagnostic software set your targeting system to be inverted") 
     (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_3130_gun (ai_get_object guns) 1) 
     (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_3130_gun))
    ) 
     (begin 
      (print "the diagnostic software set your targeting system to be normal") 
      (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_3120_gun (ai_get_object guns) 1) 
      (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_3120_gun))
     )) 
     (sleep_until (training_pitch_choose) 1) 
     (if (controller_get_look_invert) 
      (begin 
       (cs_run_command_script guns cs_lookat_console_inhibitor) 
       (sleep 15) 
       (hud_set_training_text tutorial_set_invert) 
       (hud_show_training_text True) 
       (hud_enable_training True) 
       (print "i'll leave your targeting set to inverted.") 
       (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_1570_gun (ai_get_object guns) 1) 
       (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_1570_gun))
      ) 
       (begin 
        (cs_run_command_script guns cs_lookat_console_inhibitor) 
        (sleep 15) 
        (hud_set_training_text tutorial_set_normal) 
        (hud_show_training_text True) 
        (hud_enable_training True) 
        (print "i'll leave your targeting set to normal.") 
        (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_1560_gun (ai_get_object guns) 1) 
        (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_1560_gun))
       )) 
       (print "if you change your mind, you can switch the setting anytime.") 
       (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_1580_gun (ai_get_object guns) 1) 
       (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_1580_gun)) 
       (hud_enable_training False) 
       (hud_show_training_text False)
      )
)

(script static training_look 
  (begin 
   (print "well...  i guess it was all obsolete anyway.") 
   (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_0600_gun (ai_get_object guns) 1) 
   (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_0600_gun)) 
   (custom_animation (ai_get_unit guns) objects\characters\marine\tutorial\tutorial l01_0610_jon True) 
   (sleep 15) 
   (print "your new suit is a mark vi, sent up from songnam this morning.") 
   (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_0610_gun (ai_get_object guns) 1) 
   (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_0610_gun)) 
   (print "try to take it easy until you get used to it.") 
   (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_0620_gun (ai_get_object guns) 1) 
   (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_0620_gun)) 
   (cs_run_command_script guns cs_lookat_console_inhibitor) 
   (sleep 30) 
   (print "ok.  let's test your targeting, first thing.") 
   (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_0630_gun (ai_get_object guns) 1) 
   (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_0630_gun)) 
   (objectives_show_up_to 0) 
   (print "please look at the top light.") 
   (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_3000_gun (ai_get_object guns) 1) 
   (test_mindread_up) 
   (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_3000_gun)) 
   (print "good.") 
   (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_0650_gun (ai_get_object guns) 1) 
   (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_0650_gun)) 
   (print "now look at the bottom light.") 
   (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_3010_gun (ai_get_object guns) 1) 
   (test_mindread_down) 
   (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_3010_gun)) 
   (print "allright") 
   (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_0670_gun (ai_get_object guns) 1) 
   (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_0670_gun)) 
   (print "look at the top light again.") 
   (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_3020_gun (ai_get_object guns) 1) 
   (test_mindread_up) 
   (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_3020_gun)) 
   (print "that's it") 
   (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_0760_gun (ai_get_object guns) 1) 
   (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_0760_gun)) 
   (print "now the bottom one.") 
   (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_3030_gun (ai_get_object guns) 1) 
   (test_mindread_down) 
   (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_3030_gun)) 
   (print "ok.") 
   (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_0740_gun (ai_get_object guns) 1) 
   (sleep 30) 
   (player_camera_control True) 
   (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_0740_gun)) 
   (if (>= counter_mindread_normal_success 2) 
    (begin 
     (begin 
      (sleep 30) 
      (print "everything checks out.") 
      (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_0770_gun (ai_get_object guns) 1) 
      (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_0770_gun)) 
      (controller_set_look_invert False)
     )
    ) 
    (if (>= counter_mindread_invert_success 2) 
     (begin 
      (begin 
       (sleep 30) 
       (print "everything checks out.") 
       (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_0770_gun (ai_get_object guns) 1) 
       (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_0770_gun)) 
       (controller_set_look_invert True)
      )
     ) 
     (if True 
      (begin 
       (training_pitch)
      ) void))) 
      (training_looker_lights_off)
     )
)

(script static training_move 
  (begin 
   (print "stand-by. i'm going to offline the inhibitors") 
   (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_0790_gun (ai_get_object guns) 1) 
   (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_0790_gun)) 
   (device_set_position inhibitor 1) 
   (player_disable_movement False) 
   (hud_enable_training True) 
   (cs_run_command_script guns cs_lookat_console_inhibitor) 
   (sleep 30) 
   (custom_animation (ai_get_unit guns) objects\characters\marine\tutorial\tutorial l01_0800_jon True) 
   (sleep 10) 
   (print "move around a little, get a feel for it.") 
   (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_0800_gun (ai_get_object guns) 1) 
   (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_0800_gun)) 
   (print "when you're ready, come and meet me by the zapper.") 
   (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_0810_gun (ai_get_object guns) 1) 
   (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_0810_gun)) 
   (cs_run_command_script guns cs_guns_zapper_halfway) 
   (set timer_prompt_start_spot 
    (+ timer_prompt_start_spot delay_prompt_short)) 
    (sleep_until 
     (begin 
      (if (not (volume_test_objects tv_start_spot (players))) 
       (begin True)
       (if (> timer_prompt_start_spot 0) 
       (begin 
        (begin 
         (set timer_prompt_start_spot 
          (- timer_prompt_start_spot 1)) False)
         
        ) (if True 
         (begin 
          (prompt_start_spot)
         ) False)))
        ) 1) 
        (hud_show_training_text False) 
        (cs_run_command_script guns cs_guns_zapper_wait)
       )
)

(script static training_shield 
  (begin 
   (sleep_until 
    (begin 
     (if (< (objects_distance_to_flag (players) zapper_flag) 2.5) 
      (begin True)
      (if (> timer_prompt_careful 0) 
      (begin 
       (begin 
        (set timer_prompt_careful 
         (- timer_prompt_careful 1)) False)
        
       ) (if (game_safe_to_save) 
        (begin False)
        (if True 
        (begin 
         (begin 
          (sleep 30) (if (not (game_safe_to_save)) (prompt_careful))
         )
        ) False))))
       ) 1) 
       (sleep_until (< (objects_distance_to_flag (ai_get_object guns) zapper_flag) 1.5) 1) 
       (sleep_until (< (objects_distance_to_object (players) (ai_get_object guns)) 2.5) 1) 
       (unit_set_emotional_state (ai_get_unit guns) inquisitive 0 1) 
       (unit_set_emotional_state (ai_get_unit guns) angry 0 1) 
       (unit_set_emotional_state (ai_get_unit guns) annoyed 0 1) 
       (print "pay attention because i'm only going to over this once.") 
       (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_3150_gun (ai_get_object guns) 1) 
       (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_3150_gun)) 
       (print "this station will test your recharging energy shields") 
       (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_3140_gun (ai_get_object guns) 1) 
       (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_3140_gun)) 
       (cs_run_command_script guns cs_guns_zapper) 
       (sleep_until 
        (begin 
         (if (= (device_group_get zapper_control_group) 1) 
          (begin True)
          (if (> (objects_distance_to_object (players) (ai_get_object guns)) 2.5) 
          (begin False)
          (if (> timer_prompt_zapper 0) 
          (begin 
           (begin 
            (set timer_prompt_zapper 
             (- timer_prompt_zapper 1)) False)
            
           ) (if (> timer_prompt_zapper_lookatme 0) 
            (begin 
             (begin 
              (set timer_prompt_zapper_lookatme 
               (- timer_prompt_zapper_lookatme 1)) 
               (set timer_prompt_zapper_getin 
                (- timer_prompt_zapper_getin 1)) 
                (set timer_prompt_zapper_button 
                 (- timer_prompt_zapper_button 1)) 
                 (if (objects_can_see_object 
                  (player0)
                  
                  (ai_get_object guns) 40) 
                   (begin 
                    (sleep 15) 
                    (set timer_prompt_zapper_lookatme 0)
                   )) False)
                  
                 ) (if (> timer_prompt_zapper_getin 0) 
                  (begin 
                   (begin 
                    (set timer_prompt_zapper_lookatme 
                     (- timer_prompt_zapper_lookatme 1)) 
                     (set timer_prompt_zapper_getin 
                      (- timer_prompt_zapper_getin 1)) 
                      (set timer_prompt_zapper_button 
                       (- timer_prompt_zapper_button 1)) 
                       (if (volume_test_objects tv_zapper (players)) 
                        (begin 
                         (sleep 15) 
                         (set timer_prompt_zapper_getin 0)
                        )) False)
                       
                      ) (if (> timer_prompt_zapper_button 0) 
                       (begin 
                        (begin 
                         (set timer_prompt_zapper_button 
                          (- timer_prompt_zapper_button 1)) 
                          (set timer_prompt_zapper_getin 
                           (- timer_prompt_zapper_getin 1)) 
                           (set timer_prompt_zapper_button 
                            (- timer_prompt_zapper_button 1)) 
                            (if (= (device_group_get zapper_control_group) 1) 
                             (begin 
                              (sleep 15) 
                              (set timer_prompt_zapper_button 0)
                             )) False)
                            
                           ) (if (not (objects_can_see_object 
                            (player0)
                            
                            (ai_get_object guns) 40)) 
                             (begin 
                              (prompt_zapper_lookatme)
                             ) (if (not (volume_test_objects tv_zapper (players))) 
                              (begin 
                               (prompt_zapper_getin)
                              ) (if True 
                               (begin 
                                (prompt_zapper_button)
                               ) False)))))))))
                              ) 1) 
                              (objectives_finish_up_to 2) 
                              (device_set_power zapper 1) 
                              (device_set_power zapper_cage 1) 
                              (hud_show_training_text False) 
                              (unit_set_maximum_vitality 
                               (player0)
                               30 70) 
                              (cs_run_command_script guns cs_lookat_console_zapper) 
                              (sleep 90) 
                              (cs_run_command_script guns cs_lookat_console_zapper) 
                              (sleep 15) 
                              (unit_set_current_vitality 
                               (player0)
                               30 0) 
                              (sleep 15) 
                              (print "bingo!") 
                              (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_0940_gun (ai_get_object guns) 1) 
                              (sleep 30) 
                              (cs_run_command_script guns cs_lookat_console_zapper) 
                              (print "as you can see, they re-charge a lot faster.") 
                              (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_0950_gun (ai_get_object guns) 1) 
                              (sleep 45) 
                              (ai_place johnson) 
                              (ai_cannot_die johnson True) 
                              (cs_run_command_script johnson cs_johnson_elevator) 
                              (device_set_position door_elevator_tram_bot 1) 
                              (sleep_until (= (device_get_position door_elevator_tram_bot) 1) 1) 
                              (cs_run_command_script johnson cs_johnson_start) 
                              (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_0950_gun)) 
                              (sleep 60) 
                              (device_set_power zapper 0) 
                              (device_set_power zapper_cage 0) 
                              (sleep 30) 
                              (custom_animation (ai_get_unit guns) objects\characters\marine\tutorial\tutorial l01_0960_jon True) 
                              (print "if your shields go down, find some cover, wait for the meter to read fully-charged.") 
                              (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_0960_gun (ai_get_object guns) 1) 
                              (sleep 45) 
                              (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_0960_gun)) 
                              (print "that, or he can just hide behind me.") 
                              (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_0970_jon (ai_get_object johnson) 1) 
                              (sleep 30) 
                              (cs_run_command_script guns cs_lookat_johnson) 
                              (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_0970_jon)) 
                              (sleep 15) 
                              (cs_run_command_script johnson cs_johnson_glanceat_guns) 
                              (sleep_until (objects_can_see_object 
                               (player0)
                               
                               (ai_get_object johnson) 40) 1 90) 
                               (unit_set_emotional_state (ai_get_unit johnson) inquisitive 0.5 1) 
                               (print "you done with my boy here? i don't see any training-wheels") 
                               (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_1000_jon (ai_get_object johnson) 1) 
                               (sleep (- (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_1000_jon) 90)) 
                               (cs_run_command_script johnson cs_lookat_player) 
                               (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_1000_jon)) 
                               (print "his armor's working fine.") 
                               (unit_set_emotional_state (ai_get_unit guns) annoyed 0.5 1) 
                               (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_1010_gun (ai_get_object guns) 1) 
                               (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_1010_gun)) 
                               (sleep 15) 
                               (unit_set_emotional_state (ai_get_unit johnson) inquisitive 0 1) 
                               (cs_run_command_script guns cs_lookat_player) 
                               (sleep_until (objects_can_see_object 
                                (player0)
                                
                                (ai_get_object guns) 40) 1 90) 
                                (print "you're free to go, son.  just remember: take things slow.") 
                                (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_0980_gun (ai_get_object guns) 1) 
                                (sleep (- (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_0980_gun) 60)) 
                                (cs_run_command_script johnson cs_lookat_player) 
                                (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_0980_gun))
                               )
)

(script dormant training_done_tram 
  (begin 
   (ai_place atr1_mar) 
   (ai_place mid_mar) 
   (device_set_position_immediate door_tram_2 1) 
   (sleep_until (>= (device_get_position tram) 0.25) 1) 
   (device_set_position door_tram_2 0) 
   (sleep 30) 
   (ai_erase atr1_mar) 
   (sleep_until (>= (device_get_position tram) 0.45) 1) 
   (device_set_position door_tram_3 1) 
   (ai_place atr2_mar) 
   (sleep_until (>= (device_get_position tram) 0.55) 1) 
   (device_set_position door_tram_3 0) 
   (sleep 30) 
   (ai_erase mid_mar) 
   (sleep_until (>= (device_get_position tram) 0.75) 1) 
   (device_set_position door_tram_4 1) 
   (object_create_anew tram_marine_1) 
   (object_create_anew tram_marine_2) 
   (object_create_anew tram_marine_3) 
   (object_create_anew tram_marine_4) 
   (object_create_anew tram_marine_5) 
   (object_create_anew tram_marine_6) 
   (object_create_anew tram_marine_7) 
   (custom_animation_loop tram_marine_1 objects\characters\marine\x02\x02 marine_whistle_loop False) 
   (custom_animation_loop tram_marine_2 objects\characters\marine\x02\x02 marine_fist_loop False) 
   (custom_animation_loop tram_marine_3 objects\characters\marine\x02\x02 marine_clapping_loop False) 
   (sleep 5) 
   (custom_animation_loop tram_marine_6 objects\characters\marine\x02\x02 marine_whistle_loop False) 
   (custom_animation_loop tram_marine_5 objects\characters\marine\x02\x02 marine_fist_loop False) 
   (custom_animation_loop tram_marine_4 objects\characters\marine\x02\x02 marine_clapping_loop False) 
   (sleep 5) 
   (custom_animation_loop tram_marine_7 objects\characters\marine\x02\x02 marine_whistle_loop False) 
   (sleep_until (>= (device_get_position tram) 0.9) 1) 
   (device_set_position door_tram_4 0) 
   (sleep 30) 
   (ai_erase atr2_mar)
  )
)

(script static training_done 
  (begin 
   (device_set_position_immediate tram 0) 
   (cs_run_command_script johnson cs_lookat_guns) 
   (print "don't worry, i'll hold his hand.") 
   (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_1040_jon (ai_get_object johnson) 1) 
   (sleep (- (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_1040_jon) 30)) 
   (cs_run_command_script johnson cs_johnson_elevator) 
   (sleep 15) 
   (cs_run_command_script guns cs_guns_elevator) 
   (sleep 15) 
   (sleep_until (volume_test_objects_all tv_elevator_tram_bot (ai_get_object johnson)) 1 (* 30 seconds)) 
   (if (not (volume_test_objects_all tv_elevator_tram_bot (ai_get_object johnson))) 
   (object_teleport (ai_get_object johnson) tram_flag)) 
   (sleep_until (if (volume_test_objects_all tv_elevator_tram_bot (players)) 
    (begin True)
    (if (> timer_prompt_elevator_plr 0) 
    (begin 
     (begin 
      (set timer_prompt_elevator_plr 
       (- timer_prompt_elevator_plr 1)) False)
      
     ) (if True 
      (begin 
       (prompt_elevator_plr)
      ) False))) 1) 
      (objectives_finish_up_to 3) 
      (object_create wall_elevator_tram_bot) 
      (set mark_training_done True) 
      (sleep_until (< (objects_distance_to_flag (ai_get_object guns) tram_flag) 2.5) 1 210) 
      (cs_run_command_script johnson cs_johnson_elevator_face_guns) 
      (print "so johnson, when you gonna tell me how you made it back home in one piece?") 
      (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_3360_gun (ai_get_object guns) 1) 
      (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_3360_gun)) 
      (print "sorry, guns.  it's classified.") 
      (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_0990_jon (ai_get_object johnson) 1) 
      (sleep (- (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_0990_jon) 0)) 
      (unit_set_emotional_state (ai_get_unit guns) angry 0.5 1) 
      (sleep 5) 
      (print "(humphs) my ass! well you can forget about those adjustments to your a2's scope! and you're sure as hell not getting one of the new m7s!") 
      (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_3370_gun (ai_get_object guns) 1) 
      (sleep 30) 
      (sleep (random_range 25 75)) 
      (device_set_position elevator_tram 1) 
      (device_set_position door_elevator_tram_bot 0) 
      (sleep_until (= (device_get_position door_elevator_tram_bot) 0) 1) 
      (sound_impulse_stop sound\dialog\levels\01_spacestation\mission\l01_3370_gun) 
      (sleep 10) 
      (print "well he's in a particularly fine mood. maybe lord hood forgot to give him an invitation.") 
      (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_1810_jon (ai_get_object johnson) 1)
     )
)

(script static training_tram 
  (begin 
   (wake training_done_tram) 
   (sleep_until (= (device_get_position elevator_tram) 1) 1) 
   (objectives_show_up_to 4) 
   (cs_run_command_script johnson cs_johnson_tram) 
   (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_1810_jon)) 
   (sleep_until (and (volume_test_objects_all tv_tram (players)) (volume_test_objects tv_tram (ai_get_object johnson))) 1) 
   (object_destroy_containing "wall_platform") 
   (object_create wall_tram) 
   (sleep_until (not (cs_command_script_running johnson cs_johnson_tram)) 1 150) 
   (objectives_finish_up_to 4) 
   (custom_animation (ai_get_unit johnson) objects\characters\marine\tutorial\tutorial l01_0010_jon True) 
   (sleep 10) 
   (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_1810_jon)) 
   (print "earth. haven't seen it in years.") 
   (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_0010_jon (ai_get_object johnson) 1) 
   (sleep (- (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_0010_jon) 30)) 
   (sound_looping_start scenarios\solo\01a_tutorial\01a_music\01a_01 none 1) 
   (device_set_position elevator_tram 0) 
   (device_set_position tram 1) 
   (sleep_until (>= (device_get_position tram) 0.08) 1) 
   (sleep 30) 
   (custom_animation (ai_get_unit johnson) objects\characters\marine\tutorial\tutorial l01_0020_jon True) 
   (print "when i shipped out for basic, the orbital defense grid was all theory and politics.") 
   (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_0020_jon (ai_get_object johnson) 1) 
   (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_0020_jon)) 
   (sleep_until (>= (device_get_position tram) 0.175) 1) 
   (cs_run_command_script johnson cs_lookat_macgun) 
   (print "now look. the cairo is just one of three-hundred geo-sync platforms.") 
   (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_0021_jon (ai_get_object johnson) 1) 
   (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_0021_jon)) 
   (sleep_until (>= (device_get_position tram) 0.275) 1) 
   (custom_animation (ai_get_unit johnson) objects\characters\marine\tutorial\tutorial l01_0030_jon True) 
   (sleep 10) 
   (print "that mac-gun can put a round clean through a covenant capital-ship.") 
   (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_0030_jon (ai_get_object johnson) 1) 
   (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_0030_jon)) 
   (sleep_until (>= (device_get_position tram) 0.415) 1) 
   (cs_run_command_script johnson cs_lookat_malta) 
   (sleep 45) 
   (sleep 45) 
   (custom_animation (ai_get_unit johnson) objects\characters\marine\tutorial\tutorial l01_0040_jon True) 
   (print "with coordinated fire from the athens and the malta, nothing's getting past this battle-cluster in one piece.") 
   (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_0040_jon (ai_get_object johnson) 1) 
   (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_0040_jon)) 
   (sleep 15) 
   (sleep_until (>= (device_get_position tram) 0.7) 1) 
   (custom_animation (ai_get_unit johnson) objects\characters\marine\tutorial\tutorial l01_0050_jon True) 
   (print "ships have been arriving all morning.") 
   (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_0050_jon (ai_get_object johnson) 1) 
   (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_0050_jon)) 
   (sound_looping_stop scenarios\solo\01a_tutorial\01a_music\01a_01) 
   (sleep_until (>= (device_get_position tram) 0.75) 1) 
   (sleep 30) 
   (custom_animation (ai_get_unit johnson) objects\characters\marine\tutorial\tutorial l01_0051_jon True) 
   (print "nobody's saying much, but i'll bet something big's about to happen.") 
   (sound_impulse_start sound\dialog\levels\01_spacestation\mission\l01_0051_jon (ai_get_object johnson) 1) 
   (sleep (sound_impulse_language_time sound\dialog\levels\01_spacestation\mission\l01_0051_jon)) 
   (cs_run_command_script johnson cs_johnson_lookat_station) 
   (sleep_until (>= (device_get_position tram) 0.975) 1) 
   (sleep 30) 
   (cs_run_command_script johnson cs_johnson_station) 
   (sleep_until (not (volume_test_objects_all tv_station (players))) 1 150)
  )
)

(script static start_mission 
  (begin 
   (sleep 10) 
   (print "01a tutorial") 
   (print "designer - jaime") 
   (print "env. artists - paul, dave")
  )
)

(script dormant training_fade 
  (begin 
   (player_disable_movement True) 
   (player_camera_control False) 
   (sleep 30) 
   (cinematic_set_title title_1) 
   (sleep 150) 
   (hud_cinematic_fade 1 0.5) 
   (cinematic_show_letterbox False)
  )
)

(script startup mission_01a 
  (begin 
   (player_disable_movement True) 
   (player_camera_control False) 
   (if (game_is_cooperative) 
   (game_won)) 
   (objectives_clear) 
   (ai_allegiance player human) 
   (fade_out 1 1 1 0) 
   (hud_enable_training False) 
   (ai_dialogue_enable False) 
   (start_mission) 
   (training_setup) 
   (camera_control False) 
   (sleep 1) 
   (cache_block_for_one_frame) 
   (objects_predict_high (ai_get_object guns)) 
   (sleep 2) 
   (cinematic_fade_from_white_bars) 
   (wake training_fade) 
   (training_look) 
   (hud_enable_training True) 
   (training_move) 
   (training_shield) 
   (save_tram_start) 
   (training_done) 
   (training_tram) 
   (print "you win!") 
   (sound_class_set_gain "" 0 15) 
   (cinematic_fade_to_white) 
   (hud_enable_training True) 
   (ai_dialogue_enable True) 
   (game_won)
  )
)

