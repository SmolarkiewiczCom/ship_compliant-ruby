# SDoc command
# sdoc --main README.md lib README.md -o pages/rdoc --template=ship_complaint

require 'sdoc'

RDoc::Task.new('docs') do |rdoc|
  rdoc.template = 'ship_complaint'
  rdoc.options << '--format' << 'sdoc'

  rdoc.rdoc_dir = 'pages/rdoc'
  rdoc.rdoc_files.include('lib/**/*.rb', 'README.md')
  rdoc.main = 'README.md'
end
