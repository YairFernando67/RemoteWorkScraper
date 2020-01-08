#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/scraper'

welcome_input = 1
puts "Find your next job!!!"
while welcome_input == 1
  puts "CHECK OUT SOME JOBS THAT MIGHT BE INTERESTING FOR YOU!!"
  puts "What type of jobs are you interested in?"
  welcome = "Ruby and Rails developer  ==>> TYPE 1" + "\n" + "React developer  ==>> TYPE 2" + "\n" + "Java Script Developer  ==>> TYPE 3"
  puts welcome
  puts "Enter 9 to finish searching.."
  input = gets.chomp.to_i
  while input != 1 && input != 2 && input != 9 && input != 3
    puts "Please select one of the following options:"
    puts welcome
    puts "Enter 9 to finish searching.."
    input = gets.chomp.to_i
  end
  scraper = Scraper.new()
  jobs = scraper.getData
  jobList = scraper.getJobListing(jobs)
  case input
    when 1
      puts "Loading Ruby and Rails jobs....."
      rubyJobs = scraper.rubyJobs(jobList)
      puts "There are #{rubyJobs.size} jobs that might be interesting for you in Ruby:"
      rubyJobs.each do |job|
        p job
      end
    when 2
      puts "Loading React jobs....."
      reactJobs = scraper.reactJobs(jobList)
      puts "There are #{reactJobs.size} jobs that might be interesting for you in React:"
      reactJobs.each do |job|
        p job
      end
    when 3
      puts "Loading JavaScript jobs....."
      jsJobs = scraper.jsJobs(jobList)
      puts "There are #{jsJobs.size} jobs that might be interesting for you in JavaScript:"
      jsJobs.each do |job|
        p job
      end
  end
  welcome_input = 2
end
