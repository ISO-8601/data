require 'rubygems'
require 'sinatra'
require 'datamapper'

### SETUP

#DataMapper.setup(:default, "sqlite3:///#{Dir.pwd}/data.db")
#DataMapper::Logger.new(STDOUT, :debug)



get '/' do
  @title = 'Home'
  haml :index
end

get '/find/:resource' do
  @resource = params[:resource]
  @title = @resource
  haml :resource
end

post '/create/?' do
  builder do |xml|
    xml.resource do
      xml.uri params[:resource]
    end
  end

#  @resource = params[:resource]
#  @title = @resource
#  :layout => false  
#  response = { :Say => "Hello, I am a big monkey" }
#  response.to_xml(:root => 'Response')  
end
  


use_in_file_templates!

__END__

#@@ layout
!!! XML
!!!
%html
%head
    %title
      =@title
      \- data.ISO-8601.info
  %body
    = yield


@@ index
%h1 I am the international space station
%p Sign my guestbook
%div.title Hello world.

  
@@ resource
%h1= @resource
