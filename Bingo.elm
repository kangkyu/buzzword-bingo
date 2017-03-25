module Bingo exposing (..)

import Html exposing (Html, text, h2, h1, a, footer, header, div, ul, li, span, button)
import Html.Attributes exposing (id, class, href)
import Html.Events exposing (onClick)


-- MODEL


type alias Entry =
    { id : Int, phrase : String, points : Int, marked : Bool }


type alias Model =
    { name : String, gameNumber : Int, entries : List Entry }


initialModel : Model
initialModel =
    { name = "Mike"
    , gameNumber = 1
    , entries = initialEntries
    }


initialEntries : List Entry
initialEntries =
    [ Entry 1 "future-proof" 100 False
    , Entry 2 "doing agile" 200 False
    , Entry 3 "in the cloud" 300 False
    , Entry 4 "rock-star ninja" 400 False
    ]



-- UPDATE


type Msg
    = NewGame


update : Msg -> Model -> Model
update msg model =
    case msg of
        NewGame ->
            { model | gameNumber = model.gameNumber + 1 }



-- VIEW


playerInfo : String -> Int -> String
playerInfo name gameNumber =
    name ++ " - Game #" ++ (toString gameNumber)


viewPlayer : String -> Int -> Html msg
viewPlayer name gameNumber =
    let
        playerInfoText =
            playerInfo name gameNumber
                |> String.toUpper
                |> text
    in
        h2 [ id "info", class "classy" ]
            [ playerInfoText ]


viewHeader : String -> Html msg
viewHeader title =
    header []
        [ h1 [] [ text title ]
        ]


viewFooter : Html msg
viewFooter =
    footer []
        [ a [ href "http://elm-lang.org" ]
            [ text "Powered by Elm" ]
        ]


viewEntryList : List Entry -> Html msg
viewEntryList entries =
    entries
        |> List.map viewEntryItem
        |> ul []



--let
--    listOfEntries =
--        (List.map viewEntryItem entries)
--in
--    ul [] listOfEntries


viewEntryItem : Entry -> Html msg
viewEntryItem entry =
    li []
        [ span [ class "phrase" ] [ text entry.phrase ]
        , span [ class "points" ] [ text (toString entry.points) ]
        ]


view : Model -> Html Msg
view model =
    div [ class "content" ]
        [ viewHeader "BUZZWORD BINGO"
        , viewPlayer model.name model.gameNumber
        , viewEntryList model.entries
        , div [ class "button-group" ]
            [ button [ onClick NewGame ] [ text "New Game" ] ]
        , div [ class "debug" ] [ text (toString model) ]
        , viewFooter
        ]



--main : Html Msg
--main =
--    update NewGame initialModel
--        |> view


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = initialModel
        , update = update
        , view = view
        }
