defmodule Procs do
    def start_all(count) do
        1..count
        |> Enum.to_list
        |> Enum.map(fn n -> start_link(n) end)
    end

    def send_all(pids, msg) do
        pids |> Enum.each(fn {:ok, p} -> send(p, {:msg, msg, self()}) end)
    end

    def start_link(n) do
        Task.start_link(fn -> loop(n) end)
    end

    def loop(n) do
        receive do
            {:msg, text, caller} ->
                send(caller, {:reply, text <> " reply from " <> to_string(n)})
                loop(n)
        end
    end
end