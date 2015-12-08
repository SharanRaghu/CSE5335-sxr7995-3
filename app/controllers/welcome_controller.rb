
#class WelcomeController < ApplicationController
require 'json'
require 'open-uri'
require 'rubygems'
require 'mongo'

include Mongo


#def index
i = 0
num = 5
var = 0

quotes="'"

#db = Mongo::MongoClient.new("localhost", "27017").db("Movie")
db = Mongo::Client.new([ 'ds041924.mongolab.com:41924' ], :database => 'heroku_vc7qfh9v', :user => 'sharan', :password => 'sharan')
puts '-------------------------------------------------------------------------------------------------------------------------'

#@coll = db.collection("movies")
#@coll.remove()

while i < 1 do

    data = JSON.parse(open("http://ws.audioscrobbler.com/2.0/?method=artist.getsimilar&artist=editors&api_key=4d7847876fa96f67f881aaf1b73e0e30&format=json").read)
      
      # iterate through the Array of returned artists and print their names                                                                                 
        data["similarartists"]["artist"].each do |artist|
	      #puts "#{testvar}"
    	  #insertintable = @coll.insert({ID: var.to_s, Title: artist["name"]})
      	  insertintable = db[:heroku_vc7qfh9v].insert_one({ID: var.to_s, Title: artist["name"]})
         
            #0  puts artist["name"];
    	  var = var + 1;
    	end

    i = i + 1;

end

puts '-------------------------------------------------------------------------------------------------------------------------'
#end

#helper_method :datasend
#def datasend
	db = Mongo::Client.new([ 'ds041924.mongolab.com:41924' ], :database => 'heroku_vc7qfh9v', :user => 'sharan', :password => 'sharan')
 #   @coll = db.collection("movies")

	k=params[:Id]
    rs2 = @coll.find({:ID => k}).to_json
    render :nothing => true, :json => rs2
#end