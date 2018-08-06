class WorkbookController < ApplicationController
  def index
  end

  def create
    if params[:workbook_config]
      file = params[:workbook_config]
      p "*************FIlE*****************"
      p file
      p "=================File path ================="
      p file.tempfile.path
      p "-------------------------"
      ApplicationJob.set(wait: 5.seconds).perform_later file.tempfile.path
      #spreadsheet = Roo::Spreadsheet.open(file.path)
      #p spreadsheet.info
      #spreadsheet.sheets.each_with_pagename do |name, sheet|
      # p sheet.row(1)
      #end
      redirect_to reports_workbook_index_path
    else
      redirect_to workbook_path, :flash => { :error => "Please choose a valid workbook!" }
    end
  end

  def reports
  end
  
  def console
    @console_log = File.read(File.open("log/config_workbook_log.log", "r")).html_safe
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
