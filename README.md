# Ruby parser for SeeYou .cup files

# THIS IS A VERY EARLY VERSION

File format specs can be found [here](http://download.naviter.com/docs/CUP-file-format-description.pdf).

Example:

```
require 'seeyoucup'

waypoints = SeeYouCup::Parser.new("#{__dir__}/samples/basic.cup").parse
wp = waypoints.first
wp.name     # String
wp.code     # String
wp.country  # String
wp.elev     # String
wp.rwydir   # String
wp.rwylen   # String
wp.freq     # String
wp.desc     # String
wp.lat      # Float
wp.lon      # Float
```

Limitations:

* Only files containing ONLY `Waypoints` section are supported
* Files that combine `Waypoints` and `Tasks` have not been tested
