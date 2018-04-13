defmodule SumAll do
  defmacro sum({:all, _env, values}) do
    quote do
      Enum.sum([unquote_splicing(values)])
    end
  end
end
