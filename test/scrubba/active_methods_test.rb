# frozen_string_literal: true

require "test_helper"
require "active_model"

class FakeModel
  include ActiveModel::Model
  include ActiveModel::Validations::Callbacks
  include Scrubba::ActiveMethods

  scrub :title, :slug, strip: true, collapse: true
  scrub :body, strip: true

  attr_accessor :title, :body, :slug

  # these methods are provided by ActiveRecord & ActiveAttr -- implemented
  # here so we don't need another dev dependency
  def [](key)
    public_send(key)
  end

  def []=(key, val)
    public_send("#{key}=", val)
  end
end

class ActiveMethodsTest < Minitest::Test
  def test_strip
    f = FakeModel.new(title: " foo bar ", slug: " space", body: "blah blah. ")
    f.valid?
    assert_equal "foo bar", f.title
    assert_equal "space", f.slug
    assert_equal "blah blah.", f.body
  end

  def test_collapse
    f = FakeModel.new(title: " foo \t\n   bar ", body: "blah\n\nblah. ")
    f.valid?
    assert_equal "foo bar", f.title
    assert_equal "blah\n\nblah.", f.body
  end
end
