require 'json'
require 'open-uri'
require 'rubygems'
require 'mongo'

include Mongo
#class WelcomeController < ApplicationController


	def index
	end
	#helper_method :datasend
	def datasend
	#db = Mongo::Client.new([ 'ds027345.mongolab.com:27345' ], :database => 'heroku_g0481j0g', :user => 'test', :password => 'test123')
	db = Mongo::Client.new([ 'ds041924.mongolab.com:41924' ], :database => 'heroku_vc7qfh9v', :user => 'sharan', :password => 'sharan')

	#@coll = db.collection("heroku_g0481j0g")

	k=params[:Id]
	rs2 = db[:heroku_vc7qfh9v].find({:ID => k}).to_json
	render :json => rs2
	end
#end