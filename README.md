# schrodingersbox/spec-cat README

This gem contains trivial matchers to make RSpecs a bit more effective and annoying.

 * eql_file
 * have_a_spec

 NOTE: This gem does not depend on Rails.  All paths are relative to cwd, which
 may be Rails.root or anywhere else.

## Getting Started

Add this to your gemfile...

      gem 'spec-cat', :git => 'https://github.com/schrodingersbox/spec-cat.git'

## eql_file

`eql_file` will compare method output to a ground truth file and fail if they
are different.

It also writes a .tmp file to replace the old ground truth if it's gone stale.

e.g.  #foo produces a gnarly string too nasty to copy and paste into code.

     foo.should eql_file( 'spec/data/foo.json' )

... if it fails for a valid change, you can just....

    cp spec/truth/foo.json.tmp spec/truth/foo.json

... and all will be good again.

This mechanism is a bit brittle, but great for big blobs of data.

If you use this, you should add `*.tmp` to your .gitignore.

## have_a_spec

`have_a_spec` will ensure that any given path has a corresponding spec file to
help ensure that you have good coverage.

    'app/controllers/application_controller.rb'.should have_a_spec

... is a good thing to write right after you integrate RSpec.

Here's an example coverage spec...

<https://github.com/schrodingersbox/www/blob/master/spec/coverage_spec.rb>

## Testing

    `rspec spec`

## Reference

 * [RSpec](https://github.com/rspec/rspec-rails)
 * [Markdown](http://daringfireball.net/projects/markdown)

## TODO

 * Add helper method to accept ground truth files  - "cp #{path}.tmp #{path}"
 * Add more matchers
 * Publish to rubygems.org


