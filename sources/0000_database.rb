def database
  inside 'config' do
    remove_file 'database.yml'
    copy_file 'database.yml'
  end
end
