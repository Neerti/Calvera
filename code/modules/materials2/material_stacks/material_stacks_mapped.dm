#define STACK_SUBTYPES(MAT_ID, MAT_NAME, MAT_TYPE, STACK_TYPE, REINF_TYPE) \
/obj/item/stack/material/##STACK_TYPE/mapped/##MAT_ID {                    \
	name = "1 " + #MAT_NAME;                                               \
	material = /decl/material/MAT_TYPE;                                    \
	reinf_material = REINF_TYPE;                                           \
	amount = 1;                                                            \
}                                                                          \
/obj/item/stack/material/##STACK_TYPE/mapped/##MAT_ID/five {               \
	name = "5 " + MAT_NAME;                                                \
	amount = 5;                                                            \
}                                                                          \
/obj/item/stack/material/##STACK_TYPE/mapped/##MAT_ID/ten {                \
	name = "10 " + MAT_NAME;                                               \
	amount = 10;                                                           \
}                                                                          \
/obj/item/stack/material/##STACK_TYPE/mapped/##MAT_ID/fifteen {            \
	name = "15 " + MAT_NAME;                                               \
	amount = 15;                                                           \
}                                                                          \
/obj/item/stack/material/##STACK_TYPE/mapped/##MAT_ID/twenty {             \
	name = "20 " + MAT_NAME;                                               \
	amount = 20;                                                           \
}                                                                          \
/obj/item/stack/material/##STACK_TYPE/mapped/##MAT_ID/twentyfive {         \
	name = "25 " + MAT_NAME;                                               \
	amount = 25;                                                           \
}                                                                          \
/obj/item/stack/material/##STACK_TYPE/mapped/##MAT_ID/thirty {             \
	name = "30 " + MAT_NAME;                                               \
	amount = 30;                                                           \
}                                                                          \
/obj/item/stack/material/##STACK_TYPE/mapped/##MAT_ID/forty {              \
	name = "40 " + MAT_NAME;                                               \
	amount = 40;                                                           \
}                                                                          \
/obj/item/stack/material/##STACK_TYPE/mapped/##MAT_ID/fifty {              \
	name = "50 " + MAT_NAME;                                               \
	amount = 50;                                                           \
}

// Organics
STACK_SUBTYPES(meat,           "meat",                          solid/meat,                       slab,   null)

// Gemstones
STACK_SUBTYPES(diamond,        "diamond",                       solid/gemstone/diamond,           gemstone,   null)
STACK_SUBTYPES(ruby,           "ruby",                          solid/gemstone/corundum/ruby,     gemstone,   null)
STACK_SUBTYPES(sapphire,       "sapphire",                      solid/gemstone/corundum/sapphire, gemstone,   null)
STACK_SUBTYPES(emerald,        "emerald",                       solid/gemstone/emerald,           gemstone,   null)
STACK_SUBTYPES(amethyst,       "amethyst",                      solid/gemstone/amethyst,          gemstone,   null)

//STACK_SUBTYPES(tritium,        "tritium",                       gas/hydrogen/tritium,       aerogel,    null)
//STACK_SUBTYPES(deuterium,      "deuterium",                     gas/hydrogen/deuterium,     aerogel,    null)

STACK_SUBTYPES(iron,           "iron",                          solid/metal/iron,           ingot,      null)
STACK_SUBTYPES(copper,         "copper",                        solid/metal/copper,         ingot,      null)
STACK_SUBTYPES(gold,           "gold",                          solid/metal/gold,           ingot,      null)
STACK_SUBTYPES(silver,         "silver",                        solid/metal/silver,         ingot,      null)
STACK_SUBTYPES(platinum,       "platinum",                      solid/metal/platinum,       ingot,      null)
STACK_SUBTYPES(osmium,         "osmium",                        solid/metal/osmium,         ingot,      null)
STACK_SUBTYPES(zinc,           "zinc",                          solid/metal/zinc,           ingot,      null)
STACK_SUBTYPES(tin,            "tin",                           solid/metal/tin,            ingot,      null)
STACK_SUBTYPES(lead,           "lead",                          solid/metal/lead,           ingot,      null)
STACK_SUBTYPES(brass,          "brass",                         solid/metal/brass,          ingot,      null)
STACK_SUBTYPES(bronze,         "bronze",                        solid/metal/bronze,         ingot,      null)
STACK_SUBTYPES(chromium,       "chromium",                      solid/metal/chromium,       ingot,      null)
STACK_SUBTYPES(blackbronze,    "black bronze",                  solid/metal/blackbronze,    ingot,      null)
STACK_SUBTYPES(redgold,        "red gold",                      solid/metal/redgold,        ingot,      null)

// Fissibles
STACK_SUBTYPES(uranium,        "uranium",                       solid/metal/uranium,        puck,       null)

// Stones
STACK_SUBTYPES(sandstone,      "sandstone",                     solid/stone/sandstone,      brick,      null)
STACK_SUBTYPES(marble,         "marble",                        solid/stone/marble,         brick,      null)


//STACK_SUBTYPES(plastic,        "plastic",                       solid/plastic,              panel,      null)
//STACK_SUBTYPES(fiberglass,     "fiberglass",                    solid/fiberglass,           reinforced, null)

//STACK_SUBTYPES(mhydrogen,      "metallic hydrogen",             solid/metallic_hydrogen,    segment,    null)

//STACK_SUBTYPES(ocp,            "osmium-carbide plasteel",       solid/metal/plasteel/ocp,   reinforced, null)

// Strong metals
STACK_SUBTYPES(steel,          "steel",                         solid/metal/steel,          sheet,      null)
STACK_SUBTYPES(aluminium,      "aluminium",                     solid/metal/aluminium,      shiny,      null)
STACK_SUBTYPES(titanium,       "titanium",                      solid/metal/titanium,       reinforced, null)
STACK_SUBTYPES(plasteel,       "plasteel",                      solid/metal/plasteel,       reinforced, null)
STACK_SUBTYPES(durasteel,      "durasteel",                     solid/metal/durasteel,      shiny,      null)

// Woods
STACK_SUBTYPES(wood,           "wood",                          solid/wood,                 plank,      null)
STACK_SUBTYPES(wood_log,       "wood log",                      solid/wood,                 log,        null)

STACK_SUBTYPES(mahogany,       "mahogany",                      solid/wood/mahogany,        plank,      null)
STACK_SUBTYPES(mahogany_log,   "mahogany log",                  solid/wood/mahogany,        log,        null)

STACK_SUBTYPES(maple,          "maple",                         solid/wood/maple,           plank,      null)
STACK_SUBTYPES(maple_log,      "maple log",                     solid/wood/maple,           log,        null)

STACK_SUBTYPES(ebony,          "ebony",                         solid/wood/ebony,           plank,      null)
STACK_SUBTYPES(ebony_log,      "ebony log",                     solid/wood/ebony,           log,        null)

STACK_SUBTYPES(walnut,         "walnut",                        solid/wood/walnut,          plank,      null)
STACK_SUBTYPES(walnut_log,     "walnut log",                    solid/wood/walnut,          log,        null)

STACK_SUBTYPES(bamboo,         "bamboo",                        solid/wood/bamboo,          plank,      null)
STACK_SUBTYPES(bamboo_log,     "bamboo log",                    solid/wood/bamboo,           log,       null)

STACK_SUBTYPES(yew,            "yew",                           solid/wood/yew,             plank,      null)
STACK_SUBTYPES(yew_log,        "yew log",                       solid/wood/yew,             log,        null)

STACK_SUBTYPES(sif,            "sif",                           solid/wood/sif,             plank,      null)
STACK_SUBTYPES(sif_log,        "sif log",                       solid/wood/sif,             log,        null)

STACK_SUBTYPES(cardboard,      "cardboard",                     solid/paper/cardboard,      cardstock,  null)

// Leathers
//STACK_SUBTYPES(leather,        "leather",                       solid/leather,              skin,       null)
//STACK_SUBTYPES(synthleather,   "synthleather",                  solid/leather/synth,        skin,       null)

// Glasses
//STACK_SUBTYPES(glass,          "glass",                         solid/glass,                pane,       null)
//STACK_SUBTYPES(borosilicate,   "borosilicate glass",            solid/glass/borosilicate,   pane,       null)
//STACK_SUBTYPES(aliumium,       "aliumium",                      solid/metal/aliumium,       cubes,      null)
//STACK_SUBTYPES(rglass,         "reinforced glass",              solid/glass,                pane,       /decl/material/solid/metal/steel)
//STACK_SUBTYPES(rborosilicate,  "reinforced borosilicate glass", solid/glass/borosilicate,   pane,       /decl/material/solid/metal/steel)
//STACK_SUBTYPES(stainlesssteel, "stainless steel",               solid/metal/stainlesssteel, ingot,      null)
//STACK_SUBTYPES(ice,            "ice",                           liquid/water,               cubes,      null)

// Textiles
STACK_SUBTYPES(white,          "white fabric",                  solid/textile/fabric,        bolt,       null)
STACK_SUBTYPES(pink,           "pink fabric",                   solid/textile/fabric/pink,   bolt,       null)
STACK_SUBTYPES(red,            "red fabric",                    solid/textile/fabric/red,    bolt,       null)
STACK_SUBTYPES(orange,         "orange fabric",                 solid/textile/fabric/orange, bolt,       null)
STACK_SUBTYPES(yellow,         "yellow fabric",                 solid/textile/fabric/yellow, bolt,       null)
STACK_SUBTYPES(lime,           "lime fabric",                   solid/textile/fabric/lime,   bolt,       null)
STACK_SUBTYPES(green,          "green fabric",                  solid/textile/fabric/green,  bolt,       null)
STACK_SUBTYPES(teal,           "teal fabric",                   solid/textile/fabric/teal,   bolt,       null)
STACK_SUBTYPES(blue,           "blue fabric",                   solid/textile/fabric/blue,   bolt,       null)
STACK_SUBTYPES(purple,         "purple fabric",                 solid/textile/fabric/purple, bolt,       null)
STACK_SUBTYPES(beige,          "beige fabric",                  solid/textile/fabric/beige,  bolt,       null)
STACK_SUBTYPES(grey,           "grey fabric",                   solid/textile/fabric/grey,   bolt,       null)
STACK_SUBTYPES(black,          "black fabric",                  solid/textile/fabric/black,  bolt,       null)

STACK_SUBTYPES(steel,          "steel",                         solid/metal/steel,          strut,      null)
STACK_SUBTYPES(aluminium,      "aluminium",                     solid/metal/aluminium,      strut,      null)
STACK_SUBTYPES(titanium,       "titanium",                      solid/metal/titanium,       strut,      null)

#undef STACK_SUBTYPES