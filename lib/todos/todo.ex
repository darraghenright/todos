defmodule Todos.Todo do
  alias Todos.Todo

  @enforce_keys [:id, :text]
  defstruct id: nil,
            text: nil,
            complete?: false

  def new(text) do
    %Todo{id: UUID.uuid4(), text: text}
  end

  def complete(%Todo{} = todo) do
    %Todo{todo | complete?: true}
  end
end
