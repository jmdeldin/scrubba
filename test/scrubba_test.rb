# coding: utf-8
require "test_helper"
require "active_model"

class ScrubbaScrubTest < Minitest::Test
  def test_nil
    assert_nil Scrubba.strip(nil)
  end

  def test_empty_str
    assert_equal "", Scrubba.strip("")
  end

  def test_spaces
    assert_equal "foo", Scrubba.strip("  foo  \n\t")
  end

  def test_unicode_non_breaking_space
    assert_equal "foo", Scrubba.strip(" foo ")
  end

  def test_unicode_em_space
    assert_equal "foo", Scrubba.strip(" foo  ")
  end

  def test_orig_str_ref
    str = " foo bar "
    assert_equal "foo bar", Scrubba.strip(str)
    assert_equal " foo bar ", str
  end
end

class ScrubbaNormalizeTest < Minitest::Test
  def test_nil
    assert_nil Scrubba.normalize(nil)
  end

  def test_normalizes_newlines
    assert_equal " foo bar", Scrubba.normalize(" \t\n\r foo \n \n bar")
  end

  def test_normalizes_unicode_spaces
    assert_equal " foo bar", Scrubba.normalize(" foo bar")
  end
end
