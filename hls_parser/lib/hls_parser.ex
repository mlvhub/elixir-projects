defmodule HlsParser do

  alias HlsParser.M3U8

  def find_index(directory) do
    files = Path.join(directory, "*.m3u8")
    if file = Enum.find(Path.wildcard(files), &is_index?(&1)) do
      file
    end
  end

  def extract_m3u8(index_file) do
    File.open! index_file, fn(pid) ->
      IO.read(pid)
      do_extract_m3u8(pid, [])
    end
  end

  defp do_extract_m3u8(pid, acc) do
    case IO.read(pid) do
      :eof -> Enum.reverse(acc)
      stream_inf ->
        path = IO.read(pid)
        do_extract_m3u8(pid, stream_inf, path, acc)
    end
  end

  defp do_extract_m3u8(pid, stream_inf, path, acc) do
    << "#EXT-X-STREAM-INF:PROGRAM-ID=", program_id, ",BANDWIDTH=", bandwidth, ",RESOLUTION=", resolution, ",CODECS=avc1.77.30, mp4a.40.2" >> = stream_inf
    m3u8 = %M3U8{program_id: program_id, path: path, bandwidth: bandwidth, resolution: resolution}
    do_extract_m3u8(pid, [m3u8 | acc])
  end

  defp is_index?(file) do
    File.open! file, fn(pid) ->
      IO.read(pid, 25) == "#EXTM3U\n#EXT-X-STREAM-INF"
    end
  end

end
