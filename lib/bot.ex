defmodule Orlbot.Bot do
  use Orlbot.Module
  require IEx

  handle :text do
    command "ping", do: reply send_message("Pong!")
    match ["hi", "hello"], do: reply send_message("Hello!")
  end
  handle :update do
    IEx.pry
    IO.inspect update
    if update.inline_query do
      IO.puts "query"
      Nadia.send_message(update.inline_query.from.id, "mest")
      results = [%{type: "article", id: "1", title: "batman", input_message_content: %{message_text: "My text"}}]
      IO.puts length(results)
      Nadia.answer_inline_query(update.inline_query.id, results)
      end
    end
  handle :chosen_inline_result do
     IO.inspect :chosen_inline_result
  end
end
