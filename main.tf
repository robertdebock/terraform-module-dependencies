# Module "one" make a file: file.txt
# Input: nothing.
# Output: nothing.
# Artefact: "file.txt".
module "one" {
  source = "./one"
}

# Module "two" reads a file: file.txt
# Input: nothing.
# Output: "output" containing the contents of artefact "file.txt".
# Artefact: nothing.
module "two" {
  source = "./two"
  # This is an explicit depdendency.
  depends_on = [module.one]
}

# Module "three" takes the output of module "two" and show the content.
# Input: "input",  a string.
# Output: "result", the contents of the variable "input".
# Artefact: nothing.
module "three" {
  source = "./three"
  # This is an implicit dependency.
  input  = module.two.output
}

# Show the output of module "three".
output "result" {
  # This is actually also an implicit dependency.
  value = module.three.result
}
