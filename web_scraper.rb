require 'kimurai'

class JobScraper < Kimurai::Base
  # can name it whatever, or omit if scraper is only one file
  @name= 'eng_job_scraper'
  # array of start urls, processed one by one
  @start_urls = ["https://www.indeed.com/jobs?q=software+engineer&l=New+York%2C+NY"]
  @engine = :selenium_chrome

  def parse(response, url:, data: {})
  end
end