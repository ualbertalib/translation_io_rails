module TranslationIO
  class Client
    class BaseOperation
      class DumpDBTextKeysStep
        def initialize(db_query_procs)
          @db_query_procs = db_query_procs
        end

        def run
          if @db_query_procs
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
          # Execute each proc to fetch DB strings and flatten the results
          entries = @db_query_procs.flat_map(&:call)
          TranslationIO.info "#{entries.size} entries found in the database", 2, 2
          entries
        end

      end
    end
  end
end
