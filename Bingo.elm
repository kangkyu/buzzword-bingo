module Bingo exposing (..)

import Html


givenString =
    "bingo!"


main =
    givenString
        |> String.toUpper
        |> String.repeat 3
        |> Html.text
