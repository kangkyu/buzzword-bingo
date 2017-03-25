module Bingo exposing (..)

import Html


givenString =
    "bingo!"


main =
    Html.text (String.repeat 3 (String.toUpper givenString))
