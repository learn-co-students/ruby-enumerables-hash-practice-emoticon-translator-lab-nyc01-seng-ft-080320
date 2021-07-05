require 'pry'
require 'yaml'

def load_library(file_path)
  yamfile = YAML.load_file(file_path)
  
  yamfile.each_with_object({}) do |(key, emoticons), new_hash|
    if !new_hash.include?(key)
      new_hash[key] = {}
    end
    new_hash[key][:english] = emoticons.first
    new_hash[key][:japanese] = emoticons.last
  end
end

def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
  english_meaning = nil
  
  library.each do |meaning, language|
    if emoticon == library[meaning][:japanese]
      english_meaning = meaning
    end
  end
  if english_meaning == nil
    return "Sorry, that emoticon was not found"
  else
    return english_meaning
  end
end

def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)
  japanese_emoticon = ""
  
  library.each do |meaning, language|
    if emoticon == library[meaning][:english]
      japanese_emoticon = library[meaning][:japanese]
    end
  end
  if japanese_emoticon == ""
    return "Sorry, that emoticon was not found"
  else
    return japanese_emoticon
  end
end




