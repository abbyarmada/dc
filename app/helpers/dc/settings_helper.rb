module DC
  # Responsible for helping with the settings object
  module SettingsHelper
    def settings(path, options = {})
      # split the path into an array
      path_array = path.split('.')
      value = nil
      path_array.each_with_index do |fragment, index|
        if index.eql? 0
          value = Settings[fragment]
        else
          value = value[fragment]
        end
        raise "fragment `#{fragment}` does not exist within `#{path}`" if value.nil? && options[:fatal_exception]
        return nil if value.nil?
      end
      value
    end
  end
end
