# Be sure to restart your server when you modify this file.

# Add new mime types for use in respond_to blocks:
# Mime::Type.register "text/richtext", :rtf
#Mime::Type.register "video/ogg", :ogg
#Mime::Type.register "video/x-flv", :flv
require 'mimemagic'
MimeMagic.by_extension('flv').text?
MimeMagic.by_extension('.flv').child_of? 'video/x-flv'
MimeMagic.by_extension('ogg').text?
MimeMagic.by_extension('.ogg').child_of? 'video/ogg'
