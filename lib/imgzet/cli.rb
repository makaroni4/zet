# frozen_string_literal: true

require "optparse"
require "fileutils"

$LOAD_PATH << File.expand_path(__dir__)

module Imgzet
  # CLI class is responsible for handling command-line arguments.
  #
  class CLI
    # CLI is used when running imgzet from command line (check bin/imgzet) file.
    #
    def run(args = [])
      if !Dir.exists?("notes") || !Dir.exists?("images") || !Dir.exists?("input")
        puts "Create notes, images and input folders"
        return
      end

      if args.first == "names"
        # TODO: go over notes and generate slugs from headlines
      else
        Dir["input/*"].each do |input|
          next if input == "."
          next if input == ".."

          if File.directory?(input)
            process_input_foler(input)
          else
            process_input_file(input)
          end
        end

        0
      end
    end

    private

    def process_input_foler(folder)
      slug = temp_slug()

      note_file = File.join("notes", "#{slug}.md")
      image_folder = File.join("images", slug)

      Dir.mkdir(image_folder)

      images = []
      Dir[File.join(folder, "**/*")].sort_by { |f| File.mtime(f) }.each do |image|
        image_file_name = "#{temp_slug}-#{File.extname(image)}"
        image_file = File.join(image_folder, image_file_name)
        FileUtils.cp(image, image_file)
        images.push(image_file)
      end

      File.open(note_file, "w") do |f|
        template = File.read(File.join(Dir.pwd, "note_template.md"))
        template.gsub!("IMG", images.map { |image_file|
          "![#{image_file}](../#{image_file})"
        }.join("\n"))

        f.puts(template)
      end

      FileUtils.rm_rf(folder)

      system `code .`
      system `code #{note_file}`
    end

    def process_input_file(input_image_file)
      slug = temp_slug()

      note_file = File.join("notes", "#{slug}.md")
      image_file = File.join("images", "#{slug}#{File.extname(input_image_file)}")

      FileUtils.cp(input_image_file, image_file)
      File.open(note_file, "w") do |f|
        template = File.read(File.join(Dir.pwd, "note_template.md"))
        template.gsub!("IMG", "![#{image_file}](../#{image_file})")

        f.puts(template)
      end

      FileUtils.rm(input_image_file)

      system `code .`
      system `code #{note_file}`
    end

    def temp_slug
      random_slug = 6.times.map { ("a".."z").to_a.sample }.join
      timestamp = Time.now.strftime("%Y%m%d%H%M")

      "#{timestamp}-temp-#{random_slug}"
    end
  end
end
