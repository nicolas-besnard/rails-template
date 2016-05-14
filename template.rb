def source_paths
  [File.expand_path(File.dirname(__FILE__)) + '/files']
end

def inside_initializers
  inside 'config' do
    inside 'initializers' do
      yield
    end
  end
end

def replace_file(file)
  remove_file file
  copy_file file
end

Dir[File.dirname(__FILE__) + '/sources/*.rb'].each {|file| require file }

database
gemfile
rspec

git
locale
