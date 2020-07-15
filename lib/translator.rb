require 'yaml'

require 'pry'

def load_library(path)
  emoticons = YAML.load_file(path)
  emoticon_hash = Hash.new

emoticons.each do |english_word, emoticon_set|
  emoticon_hash[english_word] = Hash.new
  emoticon_hash[english_word][:english] = emoticon_set.first
  emoticon_hash[english_word][:japanese] = emoticon_set.last
  end
  emoticon_hash
end

def get_english_meaning(path, emoticon)
  emoticon_hash = load_library(path)
  emoticon_meaning = ""

  emoticon_hash.each do |key, language|
    if emoticon == emoticon_hash[key][:japanese]
      emoticon_meaning = key
    end
  end
if emoticon_meaning == ""
    "Sorry, that emoticon was not found"
  else
    emoticon_meaning
  end
end

def get_japanese_emoticon(path, emoticon)
  emoticon_hash = load_library(path)
  japanese_emoticon = ""

  emoticon_hash.each do |key, language|
    if emoticon == emoticon_hash[key][:english]
      japanese_emoticon = emoticon_hash[key][:japanese]
  end
end
if japanese_emoticon == ""
    "Sorry, that emoticon was not found"
  else
    japanese_emoticon 
  end
end