# Build some Playlists


earlybirds = playlist(mode="randomize", reload=300,"/srv/airtime/stor/fallback/earlybirds")

smartphaune = playlist(mode="randomize", reload=300,"/srv/airtime/stor/fallback/smartphaune")

nightowls = playlist(mode="randomize", reload=300, "/srv/airtime/stor/fallback/nightowls")

jingles = playlist(mode="randomize", reload=3600,"/srv/airtime/stor/fallback/jingles")

clock = single("/srv/airtime/stor/clock/fallback/timematic.mp3")


# Security: make playlist infallible


e = mksafe(earlybirds)
s = mksafe(smartphaune)
n = mksafe(nightowls)
j = mksafe(jingles)
c = mksafe(clock)


#Define playlists rotation 

m = fallback([ switch([({ 7h-10h }, e),
                       ({ 10h-23h30 }, s),
                       ({ 23h30-7h }, n)
                     ])
            ])

# Add schedule events

   ## Nothing to schedule :)

# Let' s play the music

   ## Add static jingles rotation:

 atpointofchange = rotate (weights = [1,4],[j, m])

   ## Add OTH jingles mixed over the current track:

 atpointofchange = add([atpointofchange, switch([({0m0s},c)])])
~                                                                                                                                    
                                                                                                                                     
"jukebox.liq" 45L, 1039C                                                                                           1,3           All
