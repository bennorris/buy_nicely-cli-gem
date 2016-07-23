# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'domestic_goods/version'

Gem::Specification.new do |spec|
  spec.name          = "domestic_goods"
  spec.version       = DomesticGoods::VERSION
  spec.authors       = ["Ben Norris"]
  spec.email         = ["bennorris07@gmail.com"]

  spec.summary       = %q{A gem to help navigate you toward American-made goods.}
  spec.description   = %q{Browse through American-made companies randomly or by categories, including women's apparel, men's apparel, home goods, and gifts.}
  spec.homepage      = "https://github.com/bennorris/domestic_goods-cli-gem"
  spec.license       = "MIT"

  # # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "to-do: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  # end

  spec.files         = ["bin/console", "bin/domestic-goods", "bin/setup", "lib/domestic_goods/american_list.rb", "lib/domestic_goods/version.rb", "lib/cli.rb", "lib/domestic_goods.rb"]
  spec.bindir        = "bin"
  spec.executables   = ["domestic-goods"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  

  spec.add_dependency "nokogiri"

end
