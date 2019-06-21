class ApplicationController < ActionController::Base
  #We want the sessions helper methods to be globally available everywhere
  include SessionsHelper
end
