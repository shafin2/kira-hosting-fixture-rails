# Fixture for Kira Hosting checks: proves migrations ran and data persists.
class NotesController < ApplicationController
  skip_forgery_protection

  def index
    @notes = Note.order(created_at: :desc).limit(20)
  end

  def create
    Note.create!(body: params[:body].presence || "note at #{Time.current.iso8601}")
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { render json: { count: Note.count } }
    end
  end

  def stats
    render json: { version: "rails-v1", notes: Note.count, ruby: RUBY_VERSION, rails: Rails.version }
  end
end
