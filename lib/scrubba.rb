require "scrubba/version"

module Scrubba
  autoload :ActiveMethods, "scrubba/active_methods"

  # Removes leading and trailing whitespace from a string.
  #
  # @param [String] str
  # @return [String]
  def self.scrub(str)
    str.gsub(/(\A[[:space:]]+|[[:space:]]+\z)/, "") if str
  end

  # Converts and compresses ASCII and Unicode whitespace into single spaces.
  #
  # @param [String] str
  # @return [String]
  def self.normalize(str)
    str.gsub(/[[:space:]]+/, " ") if str
  end
end
