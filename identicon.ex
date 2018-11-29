defmodule Identicon do
  @moduledoc """
  Generating a string into an unique image,
  that is always equel to the string.
  """

  def main(string) do
    string
    |> hashing
    |> pick_color
    |> build_grid
  end

  def build_grid(%Identicon.Image{hex: hex_list} = image) do
   hex_list
   |> Enum.chunk(3)
   |> Enum.map(&mirror_row/1)
  end

  def mirror_row([a, b, c] = row) do
    #[a, b, c, b, a] or:
    [a, b | _tail] = row
    row ++ [a, b]
  end

  def pick_color(%Identicon.Image{hex: [r, g, b | _tail]} = image) do
    %Identicon.Image{image | color: {r, g, b}}
  end

  def hashing(string) do
    hex = :crypto.hash(:md5, string)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end



end
