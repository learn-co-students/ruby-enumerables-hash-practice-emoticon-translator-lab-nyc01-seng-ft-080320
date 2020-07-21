require "yaml"
filename = "./lib/emoticons.yml"

def load_library(filename)
  the_hash = {}
  emotions = YAML.load_file(filename)
  emotions.each do |emotion, symbols|
    the_hash[emotion] = {}
    the_hash[emotion][:english] = symbols[0]
    the_hash[emotion][:japanese] = symbols[1]
  end
  the_hash
end

def get_english_meaning(filename, emoticon)
  the_hash = load_library(filename)
  the_hash.each do |emotion, dictionary|
    dictionary.each do |key, value|
      if value == emoticon
        return emotion
      end
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_japanese_emoticon(filename, emoticon)
  the_hash = load_library(filename)
  the_hash.each do |emotion, dictionary|
    if the_hash[emotion][:english] == emoticon
      return the_hash[emotion][:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end

