# frozen_string_literal: true

class EntriesController < ApplicationController # :nodoc:
  def index
    @entries = Entry.all
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
    params.permit(:term)
  end
end
