defmodule NathanwhyteWeb.HomePageLive do
  use NathanwhyteWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :greeting, "")}
  end

  def handle_event("report_user_time", params, socket) do
    date_time =
      case DateTime.from_unix(params["unix_timestamp"], :millisecond) do
        {:ok, date_time} -> date_time
        _ -> nil
      end

    local_date_time =
      case DateTime.shift_zone(date_time, params["timezone"]) do
        {:ok, local_date_time} -> local_date_time
        _ -> nil
      end

    greeting =
      case local_date_time.hour do
        h when h in 0..11 -> "Good morning"
        h when h in 12..17 -> "Good afternoon"
        h when h in 18..23 -> "Good evening"
        _ -> "Hello"
      end

    {:noreply, assign(socket, :greeting, greeting)}
  end
end
