module Scrubba
  module ActiveMethods
    def scrub(*keys)
      before_validation do
        keys.each do |k|
          self[k] = Scrubba.scrub(self[k]) if self[k].present?
        end
      end
    end

    def normalize(*keys)
      before_validation do
        keys.each do |k|
          self[k] = Scrubba.normalize(self[k]) if self[k].present?
        end
      end
    end
  end
end
