require 'rails_helper'
include DC

describe DC::Configuration, 'configuration' do
  it 'should not boot up without implementation file passed', boot: false do
    expect { DC.boot }.to raise_error(NoMethodError)
  end

  it 'should boot with implementation file passed', boot: false do
    expected = expect do
      DC.configure do |config|
        config.boot_files = %w[dummy]
      end
      DC.boot
    end
    expected.not_to raise_error

    # put the configure file back to nil
    DC.configure do |config|
      config.boot_files = nil
    end
  end

  it 'should have a settings object' do
    expect(Settings).to be_kind_of Config::Options
  end

  it 'should load default components if booted' do
    expect(Settings.components).to_not be_nil
  end
end
