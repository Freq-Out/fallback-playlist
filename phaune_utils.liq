# This is where we define our default playlist and our audio processings.

                  


                    !!!
                       Place this script in "/usr/lib/airtime/pypo/bin/liquidsoap_scripts/library".
                       Be sure to include phaune_utils.liq in "/usr/lib/airtime/pypo/bin/liquidsoap_scripts/library/pervasives.liq"
                    !!!



# Default playlist:


## Build some Playlists:


earlybirds = playlist(mode="randomize", reload=300,"/srv/airtime/stor/fallback/earlybirds")

smartphaune = playlist(mode="randomize", reload=300,"/srv/airtime/stor/fallback/smartphaune")

nightowls = playlist(mode="randomize", reload=300, "/srv/airtime/stor/fallback/nightowls")

jingles = playlist(mode="randomize", reload=3600,"/srv/airtime/stor/fallback/jingles")

clock = single("/srv/airtime/stor/clock/fallback/timematic.mp3")


## Security (make playlist infallible):


e = mksafe(earlybirds)
k = mksafe(smartphaune)
n = mksafe(nightowls)
j = mksafe(jingles)
c = mksafe(clock)


## Define playlists hours:

m = fallback([ switch([({ 7h-10h }, e),
                       ({ 10h-23h30 }, k),
                       ({ 23h30-7h }, n)
                     ])
            ])
 
## Add some schedule events:

   ### Nothing to schedule :)

## Let' s play the music:

   ### Add static jingles rotation:

atpointofchange = rotate (weights = [1,4],[j, m])

   ### Add OTH jingles mixed over the current track:

atpointofchange = add([atpointofchange, switch([({0m0s},c)])])


# Audio processing:

def phaunepressor(s)

  # 3-band crossover

  low = filter.iir.eq.low(frequency = 200.)
  mh = filter.iir.eq.high(frequency = 200.)
  mid = filter.iir.eq.low(frequency = 4000.)
  high = filter.iir.eq.high(frequency = 4000.)

  # Add back

  add(normalize = false,
      [ compress(attack = 100., release = 300., threshold = -2.,
                 ratio = 0.8, gain = 2., knee = 1.3,
                 low(s)),
        compress(attack = 100., release = 400., threshold = -1.,
                 ratio = 1., gain = 1., knee =1.3,
                 mid(mh(s))),
        compress(attack = 100., release = 300., threshold = -2.,
		ratio = 0.8, gain = 2., knee = 1.3,
                 high(s))
      ])
end

atpointofchange=phaunepressor(atpointofchange)                                                                                                                              
                                                                                                                                     
#"jukebox.liq" 45L, 1039C                                                                                           1,3           All

