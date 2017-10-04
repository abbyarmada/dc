require 'rails_helper'
include DC

describe DC::PathHelper, 'path helper' do
  let(:name) do
    expect(helper.index_path(@component)).to eq('blog_index_path')
  end

  before(:each) do
    @component = :blog
  end
  after(:each) do
    @component = nil
  end

  it 'returns index path' do
    name
  end

  it 'returns new path' do
    expect(helper.new_path(@component)).to eq('new_blog_path')
  end

  it 'returns show path' do
    expect(helper.show_path(@component)).to eq('blog_path')
  end

  it 'returns edit path' do
    expect(helper.edit_path(@component)).to eq('edit_blog_path')
  end

  it 'returns delete path' do
    expect(helper.delete_path(@component)).to eq('blog_path')
  end

end
