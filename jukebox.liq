# Build some Playlists


music = playlist(mode="randomize", reload=300,"/srv/airtime/stor/imported")

jingles = playlist(mode="randomize", reload=3600,"/srv/airtime/stor/jingles")

clock = single("/srv/airtime/stor/clock/timematic.mp3")


# Security


m = mksafe(music)
j = mksafe(jingles)



# Add schedule events


clock=
         add([
              switch([

                        ({1h0m0s}, clock),
                        ({2h0m0s}, clock),
                        ({3h0m0s}, clock),
                        ({4h0m0s}, clock),
                        ({5h0m0s}, clock),
                        ({6h0m0s}, clock),
                        ({7h0m0s}, clock),
                        ({8h0m0s}, clock),
                        ({9h0m0s}, clock),
                        ({10h0m0s}, clock),
                        ({11h0m0s}, clock),
                        ({12h0m0s}, clock),
                        ({13h0m0s}, clock),
                        ({14h0m0s}, clock),
                        ({15h0m0s}, clock),
                        ({16h0m0s}, clock),
                        ({17h0m0s}, clock),
                        ({18h0m0s}, clock),
                        ({19h0m0s}, clock),
                        ({20h0m0s}, clock),
                        ({21h0m0s}, clock),
                        ({22h0m0s}, clock),
                        ({23h0m0s}, clock),
                      ])
             ])


# Let' s play the music


 atpointofchange = rotate (weights = [1,4],[j, m])
