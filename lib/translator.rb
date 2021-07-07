require "yaml"
require "pry"


def load_library(file_path)
  library = YAML.load_file(file_path)
  result = {}
  library.each do |meaning, emoticons|
    result[meaning]= {}
    result[meaning][:english] = emoticons[0]
    result[meaning][:japanese] = emoticons[1]
  end
  result
end




def get_japanese_emoticon(file_path = './lib/emoticons.yml', english_emoticon)
  result = load_library(file_path)
  return_value = result.keys.find do |key|
    result[key][:english] == english_emoticon
      
  end
  
  if return_value
    result[return_value][:japanese]
  else
    "Sorry, that emoticon was not found"
  end
end
  
  
def get_english_meaning(file_path = './lib/emoticons.yml', japanese_emoticon)
  result = load_library(file_path)
  return_value = result.keys.find do |key|
    result[key][:japanese] == japanese_emoticon
  end
  
  if return_value
    return_value
  else
    "Sorry, that emoticon was not found"
  end
end