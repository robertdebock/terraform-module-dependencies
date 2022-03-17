data "local_file" "default" {
  filename = "file.txt"
}

output "output" {
  value = data.local_file.default.content
}
