DC.configure do |config|
  config.boot_files = %w[dummy]
  config.current_user_lookup do
    nil
  end
  config.sign_in_url do
    nil
  end
end
DC.boot
