defmodule ProcsTest do
    use ExUnit.Case
    doctest Procs

    test "start" do
        pids = Procs.start_all(10)
        assert 10 == Enum.count(pids)
        assert :ok == Procs.send_all(pids, "Test")
    end
end