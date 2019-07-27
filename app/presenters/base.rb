module Presenters
  class Base
    def initialize(object)
      self.object = object
    end

    private

    attr_accessor :object

  end
end
