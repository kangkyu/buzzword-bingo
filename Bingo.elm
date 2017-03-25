module Bingo exposing (..)

import Html


givenString =
    "bingo!"


main =
    givenString
        |> String.toUpper
        |> String.repeat 3
        |> String.pad 100 '*'
        |> Html.text
