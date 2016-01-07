module CustomAssertions
  def assert_valid_json(json)
    JSON.parse(json, quirks_mode: true)
  rescue JSON::ParserError
    flunk("expected data to be valid json")
  end
end
