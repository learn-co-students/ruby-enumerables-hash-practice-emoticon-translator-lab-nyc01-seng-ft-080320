require 'pry';
require 'yaml';

def load_library(path)
  yDS = YAML.load_file(path);
  emotesHash = {};
  
  yDS.each {|emoteName, arrayOfEmotes|
    emotesHash[emoteName] = {
      english: arrayOfEmotes[0],
      japanese: arrayOfEmotes[1]
    };
  }
  return emotesHash
end

def get_japanese_emoticon(path, emote)
  emoHash = load_library(path);
  
  emoHash.each {|name, emoticonHash|
    if emoticonHash[:english] == emote
      return emoticonHash[:japanese];
    end
  }
  return 'Sorry, that emoticon was not found'
end

def get_english_meaning(path, emote)
  emoHash = load_library(path);
  
  emoHash.each {|name, emoticonHash|
    if emoticonHash[:japanese] == emote
      return name;
    end
  }
  return 'Sorry, that emoticon was not found'
end