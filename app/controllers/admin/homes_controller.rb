class Admin::HomesController < ApplicationController
  def top
    @reports = Report.all.order(created_at: :desc)
  end
end
