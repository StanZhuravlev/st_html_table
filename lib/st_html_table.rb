$LOAD_PATH.unshift File.join(File.dirname(__FILE__), *%w[.. lib])

require "st_html_table/version"
require 'rubygems'


module StHtmlTable
  require 'st_html_table/cell'
  require 'st_html_table/row'
  require 'st_html_table/table'

end
