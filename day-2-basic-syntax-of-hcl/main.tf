#  a simple terraform file to automate  file creation

resource local_file automate_file_creation {
     filename = "create_file"
     content = "this file is created using terraform"
}
