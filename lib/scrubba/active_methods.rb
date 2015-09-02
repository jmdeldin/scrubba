module Scrubba
  module ActiveMethods
    def self.included(base)
      base.extend(ClassMethods)
    end

    def scrubba_apply(key, func)
      self[key] = Scrubba.public_send(func, self[key]) if self[key].present?
    end

    module ClassMethods
      # Strip and/or collapse whitespace from given attributes.
      def scrub(*keys, strip: false, collapse: false)
        before_validation do
          keys.each do |k|
            scrubba_apply(k, :strip) if strip
            scrubba_apply(k, :collapse) if collapse
          end
        end
      end
    end
  end
end
