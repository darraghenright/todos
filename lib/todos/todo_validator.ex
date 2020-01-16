defmodule Todos.TodoValidator do
  defguard is_valid_text(text) when is_binary(text) and byte_size(text) > 0
end
