module DC
  class Configuration
    attr_accessor :boot_files
    def initialize
      @boot_files = proc { raise 'No boot file provided!' }
    end
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration
  end

  def self.boot
    Settings.reload_from_files(
      Rails.root.join('dc/defaults', 'components.yml').to_s
    )

    configuration.boot_files.each do |boot_file|
      Settings.add_source!(Rails.root.join('dc', "#{boot_file}.yml").to_s)
    end

    Settings.reload!
  end
end
