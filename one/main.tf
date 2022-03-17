resource "local_file" "default" {
  content     = "Hello world!"
  filename = "file.txt"
}
