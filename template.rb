def source_paths
  Array(super) + [File.expand_path(File.dirname(__FILE__)) + '/files']
end

def inside_initializers
  inside 'config' do
    inside 'initializers' do
      yield
    end
  end
end

Dir[File.dirname(__FILE__) + '/sources/*.rb'].each {|file| require file }

database
gemfile
rspec
