class WorkbookController < ApplicationController
  def index
  end

  def create
    if params[:workbook_config]
      file = params[:workbook_config]
      workbook = RubyXL::Parser.parse(file.tempfile.path)
      workbook.write(Rails.root.join('public', 'workbook_config', file.original_filename))
      file_path = "C:\/IP Tool\/ezdc_ip_tools\/public\/workbook_config\/#{file.original_filename}"
      ApplicationJob.set(wait: 5.seconds).perform_later file_path
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
    @console_log = File.read(File.open("log/console.log", "r"))
  end
  
  def success
    @success_log = File.read(File.open("log/success.log", "r"))
  end

  def warning
    @warning_log = File.read(File.open("log/warning.log", "r"))
  end

  def error
    @error_log = File.read(File.open("log/error.log", "r"))
  end

end
