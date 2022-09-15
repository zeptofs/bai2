# frozen_string_literal: true

module Fixtures
  FIXTURE_PATH = Pathname.new(File.expand_path("../fixtures", __dir__))
  private_constant :FIXTURE_PATH

  def self.path(path)
    FIXTURE_PATH / path
  end
end
