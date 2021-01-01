# frozen_string_literal: true

require "optparse"

$LOAD_PATH << File.expand_path(__dir__)

module Zet
  # CLI class is responsible for handling command-line arguments.
  #
  class CLI
    # CLI is used when running zet from command line (check bin/zet) file.
    #
    def run(args = [])
      if args.first == "note"
        require "fileutils"

        if Dir.exists?("notes")
          note_name = args[1]

          if note_name.nil?
            puts "Provide a name of your note, please"
          else
            note_file = note_file(note_name)

            if File.exists?(note_file)
              puts "This file already exists: #{note_file}! 🙀"
            else
              File.open(note_file, "w") do |file|
                template = File.read(File.join(Dir.pwd, "note_template.md"))
                template.gsub!("# HEADLINE", "# #{note_name}")

                file.puts(template)
              end

              system `code .`
              system `code #{note_file}`
            end
          end
        else
          puts "Hm, I don't see the \"notes\" folder 🤔"
        end

        0
      else
        puts "Hm, I don't know this command 🤔"
      end
    end

    private

    # This method is needed to unindent
    # ["here document"](https://en.wikibooks.org/wiki/Ruby_Programming/Here_documents)
    # help description.
    #
    def unindent(str)
      str.gsub(/^#{str.scan(/^[ \t]+(?=\S)/).min}/, "")
    end

    def note_file(name)
      slug = name.downcase.split(" ").map { |w| w.gsub(/\W/, "") }.join("-")
      timestamp = Time.now.strftime("%Y%m%d%H%M")

      File.join(Dir.pwd, "notes", "#{timestamp}-#{slug}.md")
    end
  end
end
