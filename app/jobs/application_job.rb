class ApplicationJob < ActiveJob::Base
    def perform
        # Perform powershell script for IP Tool
        system('powershell -File C:\Temp\CreateADUser.ps1 -Name "Name" -Email "Email" -Password "Password"')
    end
end
