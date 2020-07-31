# require modules here
require 'yaml'
require 'pry'


def load_library(file)
  # code goes here
   emoticons = YAML.load_file(file)
  result_hash = {}
  emoticons.each do |key, value|
    result_hash[key] = {}
    result_hash[key][:english] = value[0]
    result_hash[key][:japanese] = value[1]
    end
  result_hash
end

def get_japanese_emoticon(file, emoticon)
  #code goes here
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
  #code goes here
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