class ApplicationJob < ActiveJob::Base
    def perform file_path
        # Perform powershell script for IP Tool
        # Development
        # system('powershell -File C:\Users\Jay\myproject\helloworld.ps1 '+ file_path)
        # Production
        system('powershell -File "C:\IP Tool\Script\workbook_config_new.ps1" -file_path '+ file_path)
    end
end

