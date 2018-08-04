class WorkbookController < ApplicationController
  def index
  end

  def create
    if params[:workbook_config]
      file = params[:workbook_config]
      #system('powershell -File C:\Temp\CreateADUser.ps1 -Name "Name" -Email "Email" -Password "Password"')
      #spreadsheet = Roo::Spreadsheet.open(file.path)
      #p spreadsheet.info
      #spreadsheet.sheets.each_with_pagename do |name, sheet|
    # p sheet.row(1)
      #end
      redirect_to reports_workbook_index
    else
      redirect_to workbook_path, :flash => { :error => "Please choose a valid workbook!" }
    end
  end

  def reports
  end
  
  def console
    @console_log = File.read(File.open("log/config_workbook_log.log", "r"))
  end
  
  def success
    @success_log = File.read(File.open("log/config_workbook_log.log", "r"))
  end

  def warning
    @warning_log = File.read(File.open("log/config_workbook_log.log", "r"))
  end

  def error
    @error_log = File.read(File.open("log/config_workbook_log.log", "r"))
  end

end
