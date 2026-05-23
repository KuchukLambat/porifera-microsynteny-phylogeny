library(ape)

# 1. Downloading and rooting
my_tree <- read.tree("tree_bootstrap_percent.nwk")
rooted_tree <- root(my_tree, outgroup = "C.owczarzaki", resolve.root = TRUE)

# 2. We take C.owczarzaki to the very bottom
node_root <- length(rooted_tree$tip.label) + 1
if (which(rooted_tree$tip.label == "C.owczarzaki") != length(rooted_tree$tip.label)) {
  rooted_tree <- rotate(rooted_tree, node = node_root)
}

# 3. Reversing a Polytomy (Node 65) ---
node_65 <- which(rooted_tree$node.label == "65") + length(rooted_tree$tip.label)
edge_indices <- which(rooted_tree$edge[, 1] == node_65)
rooted_tree$edge[edge_indices, 2] <- rev(rooted_tree$edge[edge_indices, 2])

# 4. Remove .oot from the root
rooted_tree$node.label[1] <- "" 

png(filename = "phylogenetic_tree.png", width = 2400, height = 1800, res = 300)

# 5. Drawing
plot(rooted_tree,
     use.edge.length = FALSE,
     type = "phylogram",       
     edge.color = "#3a81e8",  
     edge.width = 2,           
     cex = 0.8,
     x.lim = c(0, 40))                

# 6. Adding supports
nodelabels(rooted_tree$node.label, 
           adj = c(1.2, -0.5),       
           frame = "none",           
           cex = 0.7,                
           col = "#e31a1c")

dev.off() 
