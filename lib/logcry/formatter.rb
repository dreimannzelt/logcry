module Logcry
  module Formatter
    def self.format(hash={}, object)
      method = caller_locations(1, 3).map(&:label) - ["cry", "run_and_cry"]
      [
        [object.class.to_s.parameterize, method].join("#"),
        hash.compact.map{ |k,v| [k, v].join "=" }.join(" ")
      ].join(" ")
    end
  end
end
