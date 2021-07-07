require "pry"
# require modules here
require "yaml"



def load_library(emoji_file)
emoji_file = YAML.load_file("./lib/emoticons.yml")
emoji_file.each do |key, value| emoji_file[key] = {:english => value[0],:japanese => value[1]
}
end
end

  #language.each do |language_version,emoticon|
  # code goes here


def get_japanese_emoticon(emoji_file,emoticon)
  # code goes here
  
  emoji_hash = load_library(emoji_file)
  emoji_hash.each do |key, value|
    #binding.pry
    if value[:english] == emoticon
      return value[:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end
  
  
  
#end
#binding.pry
def get_english_meaning(emoji_file,emoticon)
  # code goes here
 
  emoji_hash = load_library(emoji_file)
  emoji_hash.each do |key,value|
    #binding.pry
    if value[:japanese] == emoticon
      return key
#binding.pry
  
end
#binding.pry
end
#binding.pry
return "Sorry, that emoticon was not found"
#binding.pry
end
#binding.pry
