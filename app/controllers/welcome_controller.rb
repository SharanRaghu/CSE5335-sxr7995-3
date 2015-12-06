#class WelcomeController < ApplicationController
require 'json'
require 'open-uri'
require 'rubygems'
require 'mongo'

#include Mongo


def index
i = 0
num = 5
var = 0

quotes="'"

db = Mongo::MongoClient.new("localhost", "27017").db("Movie")

@coll = db.collection("movies")
@coll.remove()

while i < num  do

    data = JSON.parse(open("http://ws.audioscrobbler.com/2.0/?method=artist.getsimilar&artist=editors&api_key=4d7847876fa96f67f881aaf1b73e0e30&format=json").read)
      
      # iterate through the Array of returned artists and print their names                                                                                 
        data["similarartists"]["artist"].each do |artist|
	      #puts "#{testvar}"
    	  insertintable = @coll.insert({ID: var.to_s, Title: artist["name"]})
      	   #  puts artist["name"];
    	  var = var + 1;
    	end

    i = i + 1;

end


end
#helper_method :datasend
def datasend
	db = Mongo::MongoClient.new("localhost", "27017").db("Movie")
	@coll = db.collection("movies")

	k=params[:Id]
    @rs2 = @coll.find({:ID => k}).to_json
    render :nothing => true, :json => @rs2
end