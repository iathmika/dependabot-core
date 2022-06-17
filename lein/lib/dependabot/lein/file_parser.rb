# frozen_string_literal: true

require "dependabot/maven/file_parser"
require "dependabot/dependency"

module Dependabot
  module Lein
    class FileParser < Dependabot::Maven::FileParser
      def parse
        super.map do |dep|
          Dependabot::Dependency.new(
            package_manager: "lein",
            name: dep.name,
            version: dep.version,
            requirements: dep.requirements,
            previous_version: dep.previous_version,
            # previous_requirements: dep.previous_requirements,
            subdependency_metadata: dep.subdependency_metadata
          )
        end
      end

      private

      # Required to pass shared examples for file parsers
      def check_required_files # rubocop:disable Lint/UselessMethodDefinition
        super
      end
    end
  end
end

Dependabot::FileParsers.register("lein", Dependabot::Lein::FileParser)
