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
    attr_accessor :headers, :csv_contents

    def initialize
      read
    end

    class CsvRow
      attr_accessor :headers, :data

      def initialize(headers, data)
        @headers = headers
        @data = data
      end

      def self.method_missing(name, *args)
        @data[@headers.index(name.to_s)]
      end
    end

    def each(&block)
      @csv_contents.each do |csv_row|
        yield(csv_row)
      end
    end

    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.csv'
      file = File.new(filename)

      @headers = file.gets.chomp.split(',')

      file.each do |row|
        @csv_contents << CsvRow.new(@headers, row.chomp.split(', '))
      end
    end
  end
end

class RubyCsv
  include ActsAsCsv
  acts_as_csv
end

csv = RubyCsv.new
puts csv.headers.inspect
puts csv.csv_contents.inspect
csv.each {|row| puts row.type}