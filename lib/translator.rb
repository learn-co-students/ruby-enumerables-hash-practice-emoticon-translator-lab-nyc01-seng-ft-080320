# require modules here
require "pry"
require "yaml"


file = '/lib/emoticons.yml'


def load_library(file)
  lib = YAML.load_file(file)

  output = lib.each_with_object({}) do |(key, value), final_array| 
    final_array[key] = {
      :english => value[0],
      :japanese => value[1]
    }
  end
end

#############################################
#############################################
#############################################



def get_english_meaning(file, emoji)
  lib = load_library(file)
  
  result = ''
  # iterate over the hash
  lib.each do |key, value|
    if lib[key][:japanese] == emoji
      result += key
    end
  end
  
  if result == ''
    result += "Sorry, that emoticon was not found"
  end
  result
end

# acc[0] = lib[key][:english]

#############################################
#############################################
#############################################

def get_japanese_emoticon(file, emoji)
  lib = load_library(file)
  
  result = ''
  # iterate over the hash
  lib.each do |key, value|
    if lib[key][:english] == emoji
      result += lib[key][:japanese]
    end
  end
  
  if result == ''
    result += "Sorry, that emoticon was not found"
  end
  result
end



# {
#   "angel"=>["O:)", "☜(⌒▽⌒)☞"],
# "angry"=>[">:(", "ヽ(ｏ`皿′ｏ)ﾉ"],
# "bored"=>[":O", "(ΘεΘ;)"],
# "confused"=>["%)", "(゜.゜)"],
# "embarrassed"=>[":$", "(#^.^#)"],
# "fish"=>["><>", ">゜))))彡"],
# "glasses"=>["8D", "(^0_0^)"],
# "grinning"=>["=D", "(￣ー￣)"],
# "happy"=>[":)", "(＾ｖ＾)"],
# "kiss"=>[":*", "(*^3^)/~☆"],
# "sad"=>[":'(", "(Ｔ▽Ｔ)"],
# "surprised"=>[":o", "o_O"],
# "wink"=>[";)", "(^_-)"]
# }
 
 