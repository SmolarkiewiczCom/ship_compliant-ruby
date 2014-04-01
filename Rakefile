require 'bundler/gem_tasks'

require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec) do |t|
  t.verbose = false
  t.ruby_opts = "-I./spec -rspec_helper"
  t.rspec_opts = %w[--format progress]
end

require 'cucumber/rake/task'
Cucumber::Rake::Task.new

task default: [:spec, :cucumber]

# SDoc command
# sdoc --main README.md lib README.md -o pages/rdoc --template=ship_complaint
require 'sdoc'

class RDoc::Generator::SDoc
  protected
  ### Create class tree structure and write it as json
  def generate_class_tree
    my_topclasses = %W(SearchSalesOrders VoidSalesOrder AddUpdateProduct CheckCompliance CommitSalesOrder GetInventoryDetails GetSalesOrderExtended AddUpdateBrand SearchMoreSalesOrders)

    debug_msg "Generating class tree"
    topclasses = @classes.select do |klass|
      !(!my_topclasses.include?(klass.name) && RDoc::ClassModule === klass.parent)
    end
    tree = generate_file_tree + generate_class_tree_level(topclasses)
    debug_msg "  writing class tree to %s" % TREE_FILE
    File.open(TREE_FILE, "w", 0644) do |f|
      f.write('var tree = '); f.write(tree.to_json(:max_nesting => 0))
    end unless @options.dry_run
  end
end

RDoc::Task.new('docs') do |rdoc|
  rdoc.title = 'ShipCompliant API'
  rdoc.template = 'ship_complaint'
  rdoc.options << '--format' << 'sdoc'
  rdoc.options << '--github'

  rdoc.rdoc_dir = 'pages/rdoc'
  rdoc.rdoc_files.include('lib/**/*.rb', 'README.md')
  rdoc.main = 'README.md'
end
