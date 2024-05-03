require 'spec_helper'

describe TranslationIO::Client::SyncOperation::CreateYamlPotFileStep do
  it do

    yaml_locales_path = 'tmp/config/locales'
    FileUtils.mkdir_p(yaml_locales_path)

    File.open("#{yaml_locales_path}/en.yml", 'wb') do |file|
      file.write <<-EOS
---
en:
  main:
    hello: Hello world
    female: false
  other:
    stuff: This is string stuff
  value: 42
  other_value: 78
  faker:
    name: "Jorge Pina Puissant"
  empty:
    empty_string: " "
EOS
    end

    File.open("#{yaml_locales_path}/empty.en.yml", 'wb') do |file|
      file.write <<-EOS
---
en:
EOS
    end

    source_locale   = 'en'
    yaml_file_paths = Dir["#{yaml_locales_path}/*.yml"]

    step_operation = TranslationIO::Client::SyncOperation::CreateYamlPotFileStep.new(source_locale, yaml_file_paths)
    params = {}
    step_operation.run(params)

    params['yaml_pot_data'].should == <<-EOS
msgctxt "main.hello"
msgid "Hello world"
msgstr ""

msgctxt "other.stuff"
msgid "This is string stuff"
msgstr ""

msgctxt "empty.empty_string"
msgid " "
msgstr ""
EOS
  end
end
