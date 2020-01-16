defmodule Todos.Todo do
  alias Todos.Todo
  import Todos.TodoValidator

  @enforce_keys [:id, :text]
  defstruct id: nil,
            text: nil,
            complete?: false

  def new(text) when is_valid_text(text) do
    %Todo{id: UUID.uuid4(), text: text}
  end

  def update(%Todo{} = todo, text) when is_valid_text(text) do
    %Todo{todo | text: text}
  end

  def complete(%Todo{} = todo) do
    %Todo{todo | complete?: true}
  end
end
