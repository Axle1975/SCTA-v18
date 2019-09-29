# Layer caps
LAND = 0x01
SEABED = 0x02
SUB = 0x04
WATER = 0x08
AIR = 0x10
ORBIT = 0x20

# Flags
IgnoreStructures = 0x01

#TA only footprints
#Some depth values are x2

LOG("Loading SCTA Footprints")

SpecFootprints {
    { Name = 'Commander2x2',   SizeX=2,  SizeZ=2,  Caps=LAND|SEABED, MaxWaterDepth=15, MaxSlope=1.25, Flags=0 },
    { Name = 'Vehicle3x3',   SizeX=3,  SizeZ=3,  Caps=LAND, MaxWaterDepth=1.5, MaxSlope=0.75, Flags=0 },
    { Name = 'Kbot2x2',   SizeX=2,  SizeZ=2,  Caps=LAND, MaxWaterDepth=1.5, MaxSlope=1, Flags=0 },
    { Name = 'Amphibious1x1',   SizeX=1,  SizeZ=1,  Caps=LAND|SEABED, MaxWaterDepth=15, MaxSlope=0.75, Flags=0 },
    { Name = 'Amphibious3x3',   SizeX=3,  SizeZ=3,  Caps=LAND|SEABED, MaxWaterDepth=15, MaxSlope=0.75, Flags=0 },
    { Name = 'Spider1x1',   SizeX=1,  SizeZ=1,  Caps=LAND, MaxWaterDepth=1.5, MaxSlope=255, Flags=0 },
    { Name = 'Ship3x3',   SizeX=3,  SizeZ=3,  Caps=WATER, MinWaterDepth=1.25, Flags=0 },
    { Name = 'Ship6x6',   SizeX=6,  SizeZ=6,  Caps=WATER, MinWaterDepth=1.69, Flags=0 },
    { Name = 'Hover3x3',   SizeX=3,  SizeZ=3,  Caps=LAND|WATER, MaxWaterDepth=15, MaxSlope=0.5, Flags=0 },
    { Name = 'Sub3x3',   SizeX=3,  SizeZ=3,  Caps=WATER|SUB, MinWaterDepth=2.5, Flags=0 },
}
