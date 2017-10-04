require 'rails_helper'
include DC

describe DC::SettingsHelper, 'settings helper' do
  it 'can retrieve single path settings' do
    expect(settings('components')).not_to be_nil
  end

  it 'can retrieve multiple path settings' do
    expect(settings('components.blog.name')).to eq 'Blog'
  end

  it 'returns nil if the end point does not exist' do
    expect(settings('components.blog.undefined')).to be nil
  end

  it 'returns nil if the first item in the path is non existent' do
    expect(settings('undefined.blog.name')).to be nil
  end

  it 'returns nil if the middle item is non existent' do
    expect(settings('components.undefined.name')).to be nil
  end

  it 'throws a fatal exception if the first item in path is non existent' do
    expect{ settings('undefined.blog.name', fatal_exception: true) }.to raise_exception(RuntimeError)
  end

  it 'throws a fatal exception if the middle item in path is non existent' do
    expect{ settings('components.undefined.name', fatal_exception: true) }.to raise_exception(RuntimeError)
  end

  it 'throws a fatal exception if the last item in path is non existent' do
    expect{ settings('components.blog.undefined', fatal_exception: true) }.to raise_exception(RuntimeError)
  end


end

