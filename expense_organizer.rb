require 'pg'
require './lib/category'
require './lib/company'
require './lib.purchase'

DB = PG.connect({:dbname => 'expense_organizer'})
