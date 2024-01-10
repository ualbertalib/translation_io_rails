module TranslationIO
  class Client
    class BaseOperation
      class DumpDBTextKeysStep
        DEFAULT_ORG_NAME = 'Portage Network'
        TEMPLATE_RELATED_TABLES = ['Template', 'Phase', 'Section', 'Question', 'Annotation', 'QuestionOption']
        TEMPLATE_INCLUDES_ARGS = { phases: { sections: { questions: [:annotations, :question_options] } } }

        def initialize(db_fields)
          @db_fields         = db_fields
        end

        def run
          if @db_fields
            TranslationIO.info "Extracting source fields from database."

            FileUtils.mkdir_p(File.join('tmp', 'translation'))

            file_path = File.join('tmp', 'translation', 'database_strings.rb')
            File.open(file_path, 'w') do |file|
              file.puts "def fake"
              extracted_db_entries.each do |entry|
                file.puts "_(\"#{escape_entry(entry)}\")" if entry.present?
              end
              file.puts "end"
            end
          end
        end

        protected

        # Make sure we do not break fake method calls with mismatching quotes or 
        # multi-line strings
        def escape_entry(entry)          
          entry.gsub('"', '\"')
               .gsub("\n", '\n')
        end

        def extracted_db_entries
          unscoped_item = ["Phase", "Section", "Question"]
          entries = template_query_db_entries
          # Remove the templates-related tables from @db_fields (we already have the needed entries)
          @db_fields.except!(*TEMPLATE_RELATED_TABLES)
          @db_fields.keys.each do |table_name|
            table = table_name.constantize
            @db_fields[table_name].each do |column_name|
              db_strings = if unscoped_item.include? table_name.to_s then table.unscoped.distinct.pluck(column_name) else table.distinct.pluck(column_name) end
              entries += db_strings
            end
          end

          TranslationIO.info "#{entries.size} entries found in the database", 2, 2
          entries
        end

        # Returns an array of db entries, queried on the Template-related tables
        def template_query_db_entries
          default_org = Org.find_by!(name: DEFAULT_ORG_NAME)
          Template.includes(TEMPLATE_INCLUDES_ARGS)
            .where(org_id: default_org.id)
            .pluck(*get_template_query_pluck_args)
            .flatten.uniq
        end

        def get_template_query_pluck_args
          pluck_args = []
          TEMPLATE_RELATED_TABLES.each do |table_name|
            table_columns = @db_fields[table_name]
            # e.g. if table_name == 'Phase' and columns == ['title', 'description'], then pluck_args += ['phases.title', 'phases.description']
            pluck_args += table_columns.map{ |col| "#{table_name.tableize}.#{col}" }
          end
          pluck_args
        end

      end
    end
  end
end
