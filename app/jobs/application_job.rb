class ApplicationJob < ActiveJob::Base
    def perform file_path
        # Perform powershell script for IP Tool
        # TOD0: Here need to update the file path of shellscript
        system('powershell -File C:\Users\Jay\myproject\helloworld.ps1 '+ file_path)
    end
end

