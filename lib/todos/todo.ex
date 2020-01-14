defmodule Todos.Todo do
  alias Todos.Todo

  @enforce_keys [:text]
  defstruct text: nil, complete?: false

  def new(text) do
    %Todo{text: text}
  end

  def complete(%Todo{} = todo) do
    %Todo{todo | complete?: true}
  end
end
