#define DEFAULT_TABLE_MATERIAL "plastic"
#define DEFAULT_WALL_MATERIAL "steel"

#define MAT_IRON			"iron"
#define MAT_MARBLE			"marble"
#define MAT_STEEL			"steel"
#define MAT_PLASTIC			"plastic"
#define MAT_GLASS			"glass"
#define MAT_SILVER			"silver"
#define MAT_GOLD			"gold"
#define MAT_URANIUM			"uranium"
#define MAT_TITANIUM		"titanium"
#define MAT_PHORON			"phoron"
#define MAT_DIAMOND			"diamond"
#define MAT_SNOW			"snow"
#define MAT_SNOWBRICK		"packed snow"
#define MAT_WOOD			"wood"
#define MAT_LOG				"log"
#define MAT_SIFWOOD			"alien wood"
#define MAT_SIFLOG			"alien log"
#define MAT_STEELHULL		"steel hull"
#define MAT_PLASTEEL		"plasteel"
#define MAT_PLASTEELHULL	"plasteel hull"
#define MAT_DURASTEEL		"durasteel"
#define MAT_DURASTEELHULL	"durasteel hull"
#define MAT_TITANIUMHULL	"titanium hull"
#define MAT_VERDANTIUM		"verdantium"
#define MAT_MORPHIUM		"morphium"
#define MAT_MORPHIUMHULL	"morphium hull"
#define MAT_VALHOLLIDE		"valhollide"
#define MAT_LEAD			"lead"
#define MAT_SUPERMATTER		"supermatter"
#define MAT_METALHYDROGEN	"mhydrogen"
#define MAT_OSMIUM			"osmium"
#define MAT_GRAPHITE		"graphite"
#define MAT_LEATHER			"leather"
#define MAT_CHITIN			"chitin"
#define MAT_CLOTH			"cloth"
#define MAT_SYNCLOTH		"syncloth"
#define MAT_COPPER			"copper"
#define MAT_QUARTZ			"quartz"
#define MAT_TIN				"tin"
#define MAT_VOPAL			"void opal"
#define MAT_ALUMINIUM		"aluminium"
#define MAT_BRONZE			"bronze"
#define MAT_PAINITE			"painite"
#define MAT_BOROSILICATE	"borosilicate glass"
#define MAT_SANDSTONE		"sandstone"

#define SHARD_SHARD "shard"
#define SHARD_SHRAPNEL "shrapnel"
#define SHARD_STONE_PIECE "piece"
#define SHARD_SPLINTER "splinters"
#define SHARD_NONE ""

#define MATERIAL_UNMELTABLE 0x1
#define MATERIAL_BRITTLE    0x2
#define MATERIAL_PADDING    0x4

#define DEFAULT_TABLE_MATERIAL "plastic"
#define DEFAULT_WALL_MATERIAL "steel"

#define TABLE_BRITTLE_MATERIAL_MULTIPLIER 4 // Amount table damage is multiplied by if it is made of a brittle material (e.g. glass)

//Arbitrary weight thresholds
#define MATERIAL_WEIGHT_EXTREMELY_LIGHT	10
#define MATERIAL_WEIGHT_VERY_LIGHT		30
#define MATERIAL_WEIGHT_LIGHT			40
#define MATERIAL_WEIGHT_NORMAL			50
#define MATERIAL_WEIGHT_HEAVY			70
#define MATERIAL_WEIGHT_VERY_HEAVY		80
#define MATERIAL_WEIGHT_EXTREMELY_HEAVY	100

//Construction difficulty
#define MATERIAL_DIFFICULTY_EASY		0
#define MATERIAL_DIFFICULTY_NORMAL		1
#define MATERIAL_DIFFICULTY_HARD		2
#define MATERIAL_DIFFICULTY_VERY_HARD	3

//Arbitrary hardness thresholds
#define MATERIAL_HARDNESS_SOFT				10
#define MATERIAL_HARDNESS_FLEXIBLE			20
#define MATERIAL_HARDNESS_RIGID				30
#define MATERIAL_HARDNESS_NORMAL			50
#define MATERIAL_HARDNESS_HARD				70
#define MATERIAL_HARDNESS_VERY_HARD			80
#define MATERIAL_HARDNESS_EXTREMELY_HARD	100

// Arbitrary reflectiveness thresholds
#define MATERIAL_REFLECTIVITY_DULL				10
#define MATERIAL_REFLECTIVITY_MATTE				20
#define MATERIAL_REFLECTIVITY_SHINY				40
#define MATERIAL_REFLECTIVITY_VERY_SHINY		60
#define MATERIAL_REFLECTIVITY_MIRROR			80
#define MATERIAL_REFLECTIVITY_PERFECT_MIRROR	100