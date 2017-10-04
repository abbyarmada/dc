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
    expect(helper.new_path(@component)).to eq 'new_blog_path'
  end

  it 'returns show path' do
    expect(helper.show_path(@component)).to eq 'blog_path'
  end

  it 'returns edit path' do
    expect(helper.edit_path(@component)).to eq 'edit_blog_path'
  end

  it 'returns delete path' do
    expect(helper.delete_path(@component)).to eq 'blog_path'
  end
end

describe DC::PathHelper, 'meta path helper' do
  before(:each) do
    params[:component] = 'blog'
    @entry = FactoryGirl.create(:blog)
  end
  after(:each) do
    params[:component] = nil
    @entry = nil
  end

  it 'calls the index path' do
    expect(helper.meta_index_path).to eq '/blog'
  end

  it 'calls the new path' do
    expect(helper.meta_new_path).to eq '/blog/new'
  end

  it 'calls the show path' do
    expect(helper.meta_show_path(@entry)).to eq "/blog/#{@entry.id}"
  end

  it 'calls the edit path' do
    expect(helper.meta_edit_path(@entry)).to eq "/blog/#{@entry.id}/edit"
  end

  it 'calls the delete path' do
    expect(helper.meta_delete_path(@entry)).to eq "/blog/#{@entry.id}"
  end
end
