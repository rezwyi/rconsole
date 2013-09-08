require 'singleton'

module Rconsole
  class Base
    include Singleton

    def initialize
      @dump = []
    end

    def log(message)
      @dump << message
    end

    def dump
      dump = @dump.dup
      @dump.clear
      dump
    end
  end
end