class Admin::SettingsController < ApplicationController
  def index
    @settings = Setting.all
  end

  def update
    setting_params.each do |key, value|
      Setting.where(key: key).first.update_attribute(:value, value)
    end
    Rails.application.reload.routes!
    redirect_to admin_settings_path, notice: "Settings saved."
  end

  private

  def setting_params
    params.require(:setting).permit(:homepage, :theme) #will have an array of settings with different keys
  end
end
