def git
  git :init
  
  append_file '.gitignore', "coverage\n"
  append_file '.gitignore', ".idea\n"
  append_file '.gitignore', ".DS_Store\n"
end
