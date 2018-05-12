require 'rails_helper'
require 'clearance/rspec'

RSpec.describe SongsController do
  describe 'POST create' do
    let(:blob) do
      { artist: 'Childish Gambino', track_title: 'This Is America', album_title: 'This Is America' }
    end

    it 'creates a new user' do
      expect{ post :create, params: { song: blob } }.to change{ Song.count }
    end
  end

  describe 'GET show' do
    song = Song.create(artist: 'Childish Gambino', track_title: 'This Is America', album_title: 'This Is America')

    it 'returns the specified song' do
      get :show, params: { id: song.id }
      expect(assigns(:song)).to eq(song)
    end
  end

  describe 'GET index' do
    songs = Song.all

    it 'returns all the songs' do
      get :index
      expect(assigns(:songs)).to eq songs
    end
  end

  describe 'PATCH update' do
    song = Song.create(artist: 'Childish Gambino', track_title: 'This Is America', album_title: 'This Is America')

    it 'updates the specified song' do
      patch :update, params: { id: song.id, song: { album_title: 'Childish Gambino Greatest Hits' } }
      expect(song.reload.album_title).to eq 'Childish Gambino Greatest Hits'
    end
  end
end
