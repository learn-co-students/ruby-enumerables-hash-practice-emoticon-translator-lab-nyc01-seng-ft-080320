# require modules here
require "yaml"
require 'pry'

def load_library(file_path)
  # code goes here
 emoticons = YAML.load_file('./lib/emoticons.yml')
 result = {}
 emoticons.each_pair do |key, value| 
   emoticons[key] = {:english => value[0], :japanese => value[1]}
 end
 return emoticons
 end

def get_japanese_emoticon(yaml_file, emoticon)
  # code goes here
  emoticons = load_library('./lib/emoticons.yml')
  emoticons.each do |key, value|
    if emoticon == value[:english]
      return value [:japanese]
    end
end
p "Sorry, that emoticon was not found"
end

def get_english_meaning(yaml_file, emoticon)
  # code goes here
   emoticons = load_library('./lib/emoticons.yml')
   emoticons.each do |key, value|
     if emoticon == value[:japanese]
       return key
     end
   end
   p "Sorry, that emoticon was not found"
end