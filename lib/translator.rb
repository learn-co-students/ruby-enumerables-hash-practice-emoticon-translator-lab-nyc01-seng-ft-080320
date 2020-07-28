# require modules here
require 'pry'
require 'yaml'

def load_library(emotes)
  # code goes here
  em = YAML.load_file(emotes)
  final = {}
  em.each do |k,v|
    final[k] = Hash.new
    final[k][:english] = v[0]
    final[k][:japanese] = v[1]
  end
  final
end

def get_japanese_emoticon(emotes, emoticon)
  # code goes here
  em = load_library(emotes)
  em.each do |k,v|
    return v[:japanese] if v[:english] == emoticon
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(emotes, emoticon)
  # code goes here
  em = load_library(emotes)
  em.each do |k,v|
    return k if v[:japanese] == emoticon
  end
  "Sorry, that emoticon was not found"
end