require "#{Rails.root}/lib/dictionary.rb"

DICTIONARY_FILE_PATH = "#{Rails.root}/config/dictionary.txt"
$dictionary = Dictionary.new(DICTIONARY_FILE_PATH)
