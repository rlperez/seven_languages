module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods

    class CsvRow
      def method_missing name, *args
        @contents[@headers.index(name.to_s)]
      end

      attr_accessor :headers, :contents

      def initialize(headers, data)
        @headers = headers
        @contents = data
      end
    end

    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.csv'
      file = File.new(filename)
      @headers = file.gets.chomp.split(/\s*,\s*/)

      file.each do |row|
        @csv_contents << row.chomp.split(/\s*,\s*/)
      end
    end

    def each(&block)
      @csv_contents.each do |row|
        block.call CsvRow.new(@headers, row)
      end
    end

    attr_accessor :headers, :csv_contents

    def initialize
      read
    end
  end
end

class RubyCsv
  include ActsAsCsv
  acts_as_csv
end


csv = RubyCsv.new
csv.each { |row| puts row.usage }