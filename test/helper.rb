$:.unshift File.expand_path('..', __FILE__)
$:.unshift File.expand_path('../../lib', __FILE__)
require 'simplecov'
SimpleCov.start
require 'validates_url_format_of'
require 'active_record'
require 'model'
require 'minitest/unit'

MiniTest::Unit.autorun

unless ActiveRecord::Base.connected?
  ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => ':memory:')
  ActiveRecord::Migration.verbose = false
  ActiveRecord::Schema.define(:version => 0) do
    create_table :models, :force => true do |t|
      t.string :homepage
      t.string :my_UrL_hooray
      t.string :custom_url
    end
  end
end
