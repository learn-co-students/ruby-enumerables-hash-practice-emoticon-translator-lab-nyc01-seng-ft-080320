require "pry"
require "yaml"

test_emo = "☜(⌒▽⌒)☞"
file = "lib/emoticons.yml"

def load_library(filepath)
  source = YAML.load_file(filepath)
  library = {}
  source.each do |name, emoticons|
    library[name] = {"english": emoticons[0], "japanese": emoticons[1]}
  end
  library
end

def get_english_meaning(filepath, emoticon)
  library = load_library(filepath)
  meaning = library.keys.find do |key|
    library[key][:japanese] == emoticon
    end
  meaning ? meaning : "Sorry, that emoticon was not found"
end

def get_japanese_emoticon(filepath, western_emoticon)
  library = load_library(filepath)
  meaning = library.keys.find do |key|
    library[key][:english] == western_emoticon
    end
  meaning ? library[meaning][:japanese] : "Sorry, that emoticon was not found"
end


def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)
  emoticon = library.keys.find do |key|
    library[key][:english] == emoticon
  end
  emoticon ? library[emoticon][:japanese] : "Sorry, that emoticon was not found"
end

