


# default = amplify(id="silence_src", 0.00001, noise())
ref_off_air_meta = ref off_air_meta
if !ref_off_air_meta == "" then
    ref_off_air_meta := "Airtime - offline"
end
# default = rewrite_metadata([("title", !ref_off_air_meta)], default)

default = atpointofchange

 ignore(output.dummy(default, fallible=true))
