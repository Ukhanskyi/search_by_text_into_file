# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DocumentsController, type: :controller do
  render_views

  let!(:document) { FactoryBot.create(:document) }

  before do
    DocumentsIndex.sync
  end

  describe 'GET #index' do
    it 'renders the :index view' do
      get :index

      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let!(:params) { FactoryBot.attributes_for(:document) }

      it 'creates new document' do
        expect { post :create, params: { document: params } }.to change(Document, :count).by(1)
      end
    end

    context 'with invalid params' do
      let!(:invalid_params) { FactoryBot.attributes_for(:document, :image_doc) }

      it 'does not create new document' do
        expect { post :create, params: { document: invalid_params } }.to raise_error('Document wasn`t created.')
      end
    end
  end

  describe 'POST #search' do
    let!(:searched_text) { FactoryBot.create(:document, text_body: 'Searched_text_body') }

    it 'returns true' do
      post :search, params: { query: 'Searched_text_body' }, format: :turbo_stream

      expect(response).to render_template(partial: 'documents/_search_results')
      expect(response).to have_http_status(200)
    end
  end
end
