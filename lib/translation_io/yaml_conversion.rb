module TranslationIO
  module YAMLConversion
    class << self

      def get_yaml_data_from_po_data(po_data, target_locale)
        parser            = GetText::POParser.new
        po_representation = GetText::PO.new
        flat_translations = {}

        parser.parse(po_data, po_representation)

        po_representation.each do |po_entry|
          flat_translations["#{target_locale}.#{po_entry.msgctxt}"] = po_entry.msgstr
        end

        translations = YAMLConversion.get_yaml_data_from_flat_translations(flat_translations)

        return translations
      end

      # Shortcut methods

      def get_flat_translations_for_yaml_file(file_path)
        yaml_data = File.read(file_path)
        return get_flat_translations_for_yaml_data(yaml_data)
      end

      def get_flat_translations_for_yaml_data(yaml_data)
        translations = TranslationIO.yaml_load(yaml_data)

        if translations.present? && translations.values.all? { |value| value.present? }
          return FlatHash.to_flat_hash(translations)
        else # loading an empty file, or file with only the language, returns false
          return {}
        end
      end

      def get_yaml_data_from_flat_translations(flat_translations, force_keep_empty_keys: false)
        if force_keep_empty_keys
          remove_empty_keys = false
        else
          remove_empty_keys = TranslationIO.config.yaml_remove_empty_keys
        end

        translations = FlatHash.to_hash(flat_translations, remove_empty_keys)

        if TranslationIO.config.yaml_line_width
          data = translations.to_yaml(:line_width => TranslationIO.config.yaml_line_width)
        else
          data = translations.to_yaml
        end

        data.gsub(/ $/, '') # remove trailing spaces
      end

    end
  end
end
