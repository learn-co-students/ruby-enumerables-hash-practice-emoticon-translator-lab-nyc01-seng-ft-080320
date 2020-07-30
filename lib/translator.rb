# require modules here

require 'yaml'
require 'pry'

def load_library(file)
  emoticons = YAML.load_file(file)
  new_hash = {}
  emoticons.each do |key, value|
    new_hash[key] = {}
    new_hash[key][:english] = value[0]
    new_hash[key][:japanese] = value[1]
    end
  new_hash 
end



def get_japanese_emoticon(file, emoticon)
  library = load_library(file)
  word = library.keys.find do |key|
    library[key][:english] == emoticon  
  end
  if word 
    library[word][:japanese]  
  else
    "Sorry, that emoticon was not found"
  end
end



def get_english_meaning(file, emoticon)
  library = load_library(file)
  word = library.keys.find do |key|
    library[key][:japanese] == emoticon 
  end
  if word 
    word
  else
    "Sorry, that emoticon was not found"
  end
end