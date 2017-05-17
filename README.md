[![Build Status](https://travis-ci.org/schrodingersbox/spec_cat.svg?branch=master)](https://travis-ci.org/schrodingersbox/spec_cat)
[![Coverage Status](https://coveralls.io/repos/schrodingersbox/spec_cat/badge.png?branch=master)](https://coveralls.io/r/schrodingersbox/spec_cat?branch=master)
[![Code Climate](https://codeclimate.com/github/schrodingersbox/spec_cat.png)](https://codeclimate.com/github/schrodingersbox/spec_cat)
[![Dependency Status](https://gemnasium.com/schrodingersbox/spec_cat.png)](https://gemnasium.com/schrodingersbox/spec_cat)
[![Gem Version](https://badge.fury.io/rb/spec_cat.png)](http://badge.fury.io/rb/spec_cat)

# schrodingersbox/spec_cat

This gem contains trivial matchers to make RSpecs a bit more effective and less annoying.

 * eql_file
 * have_a_spec
 * include_module
 * pass_rubocop

It also provides rake commands

 * rake spec_cat:accept
 * spec_cat:coverage

 NOTE: This gem does not depend on Rails.  All paths are relative to cwd, which
 may be Rails.root or anywhere else.

## Getting Started

Add this to your gemfile...

    gem 'spec_cat'
    gem 'simplecov', :require => false
     
Add this to your spec_helper.rb...

    # Initialize SimpleCov
    
    require 'simplecov'
    
    SimpleCov.start 'rails' do
      add_filter '/vendor/'
      add_filter '/spec/'
    end


## Matchers

### eql_file

`eql_file` will compare method output to a ground truth file and fail if they
are different.

It also writes a .tmp file to replace the old ground truth if it's gone stale.

e.g.  #foo produces a gnarly string too nasty to copy and paste into spec code.

     expect( foo ).to eql_file( 'spec/data/foo.json' )

... if it fails for a valid change, you can just....

    cp spec/truth/foo.json.tmp spec/truth/foo.json

... and all will be good again.

This mechanism is a bit brittle, but great for big blobs of data.

If you use this, you should add `*.tmp` to your .gitignore.

### have_a_spec

`have_a_spec` will ensure that any given path has a corresponding spec file to
help ensure that you have good coverage.

    expect( 'app/controllers/application_controller.rb' ).to have_a_spec

... is a good thing to write right after you integrate RSpec.

Here's an example coverage spec...

<https://github.com/schrodingersbox/spec_cat/blob/master/spec/coverage_spec.rb>

### include_module

`include_module` makes it easy to spec concern inclusion.

    it( 'is Taggable' ) { is_expected.to include_module( Taggable ) }

### pass_rubocop

`pass_rubcop` just executes [Rubocop](http://batsov.com/rubocop/) and passes or fails 
based on it's exit status.

    it( 'passes' ) { is_expected.to pass_rubocop }

## Rake Tasks

### spec_cat:accept

`rake spec_cat:accept` runs all specs and causes the eql_file matcher to overwrite
the ground truth files, rather than output .tmp files.

This is convenient when a code change impacts a large number of ground truth files,
but is also risky, as it may allow an incorrect change to become ground truth.

### spec_cat:coverage

`rake spec_cat:coverage` runs all specs and then opens the coverage report if all the
specs pass.

## Reference

 * [RSpec](https://github.com/rspec/rspec)
 * [Rubocop](http://batsov.com/rubocop/)
 * [Testing Rake Tasks with RSpec](http://www.philsergi.com/2009/02/testing-rake-tasks-with-rspec.html)
 * [Nathan Humbert's Blog: Rails 3: Loading rake tasks from a gem](http://blog.nathanhumbert.com/2010/02/rails-3-loading-rake-tasks-from-gem.html)
 * [Add Achievement Badges to Your Gem README](http://elgalu.github.io/2013/add-achievement-badges-to-your-gem-readme/)
 * [Publishing your gem](http://guides.rubygems.org/publishing/)
 * [Better Specs](http://betterspecs.org)

## Version History

 * 3.1.0 - Rubocop integration
 * 3.0.0 - RSpec 3 supported
 * 1.0.3 - Last version with RSpec 2.x support



