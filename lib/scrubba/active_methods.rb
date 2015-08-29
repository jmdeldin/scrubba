module Scrubba
  module ActiveMethods
    def self.included(base)
      base.extend(ClassMethods)
    end

    def scrubba_apply(keys, func)
      keys.each do |k|
        self[k] = Scrubba.public_send(func, self[k]) if self[k].present?
      end
    end

    module ClassMethods
      def scrub(*keys)
        before_validation { scrubba_apply(keys, :scrub) }
      end

      def normalize(*keys)
        before_validation { scrubba_apply(keys, :normalize) }
      end
    end
  end
end
