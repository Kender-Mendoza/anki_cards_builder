# frozen_string_literal: true

class EntriesController < ApplicationController # :nodoc:
  def index
    @entries = Entry.all

    set_page_and_extract_portion_from Entry.order(created_at: :desc), per_page: [8]
  end

  def show
    @entry = Entry.find(params_permit[:id])

    respond_to do |format|
      if @entry.present?
        format.turbo_stream
      else
        format.turbo_stream { redirect_to entries_path, notice: 'Error when search the word' }
      end
    end
  end

  def create
    @entry = Entry.search_or_create!(params_permit[:term])

    respond_to do |format|
      if @entry.valid?
        format.turbo_stream
      else
        format.turbo_stream { redirect_to entries_path, notice: 'Error when search the word' }
      end
    end
  end

  def params_permit
    params.permit(:id, :term)
  end
end
