# require modules here
require "yaml"

def load_library(path)
  library = YAML.load_file(path)
  
  library.each do |name, array|
    library[name] = {
      english: array[0],
      japanese: array[1]
    }
  end
end

def get_japanese_emoticon(path, emoticon)
  organized_library = load_library(path)
  
  organized_library.each do |name, language|
    if organized_library[name][:english] == emoticon
      return organized_library[name][:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon)
  organized_library = load_library(path)
  
  organized_library.each do |name, language|
    organized_library[name].each do |language, representation|
      if emoticon == representation
        return name
      end
    end
  end
  return "Sorry, that emoticon was not found"
end