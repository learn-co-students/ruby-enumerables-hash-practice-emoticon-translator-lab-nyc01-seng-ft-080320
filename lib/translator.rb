# require modules here
require 'yaml'
require 'pry'

def load_library(locat)
  emoticons = YAML.load_file(locat)
  emoticon_hash = {}

#method to organize the hash
    emoticons.each do |meaning, emoticon_set|
        english_emote = emoticon_set[0]
        japanese_emote = emoticon_set[1]
        emoticon_hash[meaning] = {
          english: {},
          japanese: {}
        }
        emoticon_hash[meaning][:english] = english_emote
        emoticon_hash[meaning][:japanese] = japanese_emote
      end
    emoticon_hash
end

def get_japanese_emoticon(locat, emoticon)
  # code goes here
  emoticon_hash = load_library(locat)
  response = nil
  emoticon_hash.each do |meaning, language|
    if language[:english] == emoticon
      response = language[:japanese]
    end
  end
  if response == nil
    return "Sorry, that emoticon was not found"
  else
    return response
  end
end

def get_english_meaning(locat, emoticon)
  # code goes here
  emoticon_hash = load_library(locat)
  response = nil
  emoticon_hash.each do |meaning, language|
    if language[:japanese] == emoticon
      response = meaning
    end
  end
    if response == nil
      return "Sorry, that emoticon was not found"
    else
      return response
    end
end
