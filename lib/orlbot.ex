defmodule Orlbot do
  def start(_type, _args) do
    import Supervisor.Spec
    children = [supervisor(Orlbot.Bot, [[name: Orlbot.Bot]])]
    {:ok, _pid} = Supervisor.start_link(children, strategy: :one_for_one)
  end
end
