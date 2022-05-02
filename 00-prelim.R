require(OUwie)

dat <- read.csv("2022_flower-size-houwie/data/petal_color_fruit_all_data.csv")
phy <- read.tree("2022_flower-size-houwie/data/tree.txt")

# organize data
shared_species <- intersect(dat$species, phy$tip.label)

all(shared_species %in% dat$species)
all(shared_species %in% phy$tip.label)

dat <- dat[match(shared_species, dat$species),]
phy <- keep.tip(phy, shared_species)
dat <- dat[match(phy$tip.label, dat$species),]

hOUwie(phy, dat, 1, "ER", "OUM", FALSE, 25, diagn_msg = TRUE, adaptive_sampling = FALSE)
require(corHMM)
getStateMat4Dat(dat[,c(1,2,3)])