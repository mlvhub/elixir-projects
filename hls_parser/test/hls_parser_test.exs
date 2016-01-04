defmodule HlsParserTest do
  use ExUnit.Case, async: true
  doctest HlsParser

  alias HlsParser.M3U8

  @index_file "test/master.m3u8"

  test "find index file in a directory" do
    assert HlsParser.find_index("test") == @index_file
  end

  test "text returns nil for not available" do
    assert HlsParser.find_index("/does/not/exist") == nil
  end

  test "extracts m3u8 from the index file" do
    m3u8s = HlsParser.extract_m3u8 @index_file

    assert List.first(m3u8s) == %M3U8{program_id: 1, bandwidth: 464000, resolution: "680x360"}
  end
end
