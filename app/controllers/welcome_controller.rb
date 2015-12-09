require 'json'
require 'open-uri'
require 'rubygems'
require 'mongo'

include Mongo

class WelcomeController < ApplicationController

#Data already in mongodb as in project 2
#Data Source: "http://ws.audioscrobbler.com/2.0/?method=artist.getsimilar&artist=editors&api_key=4d7847876fa96f67f881aaf1b73e0e30&format=json" 
	#def index
	#end

#Retreiving data from mongodb
	def datasend
	db = Mongo::Client.new([ 'ds041924.mongolab.com:41924' ], :database => 'heroku_vc7qfh9v', :user => 'sharan', :password => 'sharan')

	k=params[:Id]
	rs2 = db[:heroku_vc7qfh9v].find({:ID => k}).to_json
	render :json => rs2
	end
end