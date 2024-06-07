require 'fluent/plugin/filter'
require 'fluent/time'

module Fluent::Plugin
  class FloatTimeToEventTimeFilter < Filter
    Fluent::Plugin.register_filter('float_time_to_event_time', self)

    def configure(conf)
      super
    end

    def filter_with_time(tag, time, record)

      seconds = time.to_i
      nseconds = ((time - seconds) * 1000000000).to_i
      new_time = Fluent::EventTime.new(seconds, nseconds)
      
      return [new_time, record]
    end
  end
end