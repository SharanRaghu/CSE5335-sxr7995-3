require 'json'
require 'open-uri'
require 'rubygems'
require 'mongo'

include Mongo

class WelcomeController < ApplicationController

	def index
	end

	def datasend
	db = Mongo::Client.new([ 'ds041924.mongolab.com:41924' ], :database => 'heroku_vc7qfh9v', :user => 'sharan', :password => 'sharan')
	
	k=params[:Id]
	rs2 = db[:heroku_vc7qfh9v].find({:ID => k}).to_json
	render :json => rs2
	end
end