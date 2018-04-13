defmodule SumAll do
  defmacro sum({:all, _env, values}) do
    res =
      values
      |> Enum.map(&Macro.expand(&1, __CALLER__))
      |> Enum.reduce(fn value, acc ->
        case value do
          {:-, _, [v]} -> acc - v
          _ -> value + acc
        end
      end)

    quote do
      unquote(res)
    end
  end
end
