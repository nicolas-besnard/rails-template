def database
  inside 'config' do
    replace_file 'database.yml'
  end
end
