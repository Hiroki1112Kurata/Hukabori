class Admin::HomesController < ApplicationController

  before_action :authenticate_admin!,except: [:top]

  def top
    @reports = Report.all.order(created_at: :desc)
  end
end
