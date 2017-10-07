module DC
  class Configuration
    attr_accessor :boot_files

    def initialize
      @boot_files = nil
      @current_user_lookup = nil
      @sign_in_url = nil
    end

    def current_user_lookup(&block)
      @current_user_lookup = block if block
      @current_user_lookup
    end

    def sign_in_url(&block)
      @sign_in_url = block if block
      @sign_in_url
    end

  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration
  end

  def self.boot
    check_config

    Settings.reload_from_files(
      Rails.root.join('dc/defaults', 'components.yml').to_s
    )

    configuration.boot_files.each do |boot_file|
      Settings.add_source!(Rails.root.join('dc', "#{boot_file}.yml").to_s)
    end

    Settings.reload!
  end

  private

  def self.check_config
    raise 'No configuration file provided' if configuration.boot_files.nil?
    raise 'No user lookup provided' if configuration.current_user_lookup.nil?
    raise 'No sign in url provided!' if configuration.sign_in_url.nil?
  end

end
