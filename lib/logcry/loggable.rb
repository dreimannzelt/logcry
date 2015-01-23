module Logcry
  module Loggable
    # include ActiveSupport::Concern

    def cry(hash={})
      if self.respond_to?(:to_cry)
        hash = self.to_cry.merge(hash)
      end

      if hash.any?
        Rails.logger.info Formatter.format(hash, self)
      end
    end

    def run_and_cry(hash={}, &block)
      runtime = Benchmark.ms do
        yield
      end

      cry hash.merge(_runtime: runtime)
    end
  end
end

ActiveModel.send(:include, Logcry::Loggable) if defined?(Rails)
