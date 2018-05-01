module Main where

import Prelude

import Control.Monad.Eff (Eff)
import Data.Maybe (Maybe(..))
import Halogen as H
import Halogen.Aff as HA
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import Halogen.Themes.Tachyons as TCH
import Halogen.VDom.Driver (runUI)

main :: Eff (HA.HalogenEffects ()) Unit
main = HA.runHalogenAff do
  body <- HA.awaitBody
  runUI component unit body

newtype Query a = Query a

component :: ∀ m. H.Component HH.HTML Query Unit Void m
component =
  H.component
    { initialState: const unit 
    , render
    , eval: \(Query a) -> pure a
    , receiver: const Nothing
    }
  where

  render :: Unit -> H.ComponentHTML Query
  render _ =
    HH.article
      [ HP.class_ TCH.athelas ]
      [ HH.div
        [ HP.classes [ TCH.vh_100, TCH.dt, TCH.w_100, TCH.tc, TCH.bg_dark_gray, TCH.white, TCH.cover, HH.ClassName "bg-image" ] ]
        [ HH.div
          [ HP.classes [ TCH.dtc, TCH.v_mid ] ]
          [ HH.header
            [ HP.class_ TCH.white_70 ]
            [ HH.h2
              [ HP.classes [ TCH.f6, TCH.fw1, TCH.ttu, TCH.tracked, TCH.mb2, TCH.lh_title ] ]
              [ HH.text "Issue Six" ]
            , HH.h3
              [ HP.classes [ TCH.f6, TCH.fw1, TCH.lh_title ] ]
              [ HH.text "Summer MMXVI" ]
            ]
          , HH.h1
            [ HP.classes [ TCH.f1, TCH.f_headline_l, TCH.fw1, TCH.i, TCH.white_60 ] ]
            [ HH.text "The Chronicles" ]
          , HH.blockquote
            [ HP.classes [ TCH.ph0, TCH.mh0, TCH.measure, TCH.f4, TCH.lh_copy, TCH.center ] ] 
            [ HH.p
              [ HP.classes [ TCH.fw1, TCH.white_70 ] ]
              [ HH.text "It's the space you put between the notes that make the music." ]
            , HH.cite
              [ HP.classes [ TCH.f6, TCH.ttu, TCH.tracked, TCH.fs_normal ] ]
              [ HH.text "Massimo Vignelli" ]
            ]
          ]
        ]
      , HH.div
        [ HP.classes [ TCH.center, TCH.measure_wide, TCH.f5, TCH.pv5, TCH.lh_copy, TCH.ph2 ] ]
        [ HH.h1
          [ HP.classes [ TCH.f1, TCH.lh_title ] ]
          [ HH.text "The repercussion of ugliness is endless" ]
        , HH.p_
          [ HH.text $ 
              "The choice of paper size is one of the first of any given work to be printed. "
              <> "There are two basic paper size systems in the world: "
              <> "the international A sizes, and the American sizes." 
          ]
        , HH.p_
          [ HH.text $
              "The international Standard paper sizes, called the A series, is based "
              <> "on a golden rectangle, the divine proportion. It is extremely handsome "
              <> "and practical as well. It is adopted by many countries around the world "
              <> "and is based on the German DIN metric Standards. The United States uses "
              <> "a basic letter size (8 1/2 x 11”) of ugly proportions, and results in "
              <> "complete chaos with an endless amount of paper sizes. It is a "
              <> "by-product of the culture of free enterprise, competition and waste. "
              <> "Just another example of the misinterpretations of freedom."
          ]
        , HH.p_
          [ HH.text $
              "These are the basic DIN sizes in mm. for : A0, 841x1189 - A1, 594x841 - "
              <> "A2, 420x594 - A3, 297x420 - A4, 210x297 - A5, 148x210 - A6, 105 x148 - "
              <> "A7, 74x 105 - A8, 52x74 - A9, 37x52 - A10, 26x37."
          ]
        , HH.p_
          [ HH.text $
              "The A4 is the basic size for stationary. Two thirds of it is a square,"
              <> "a nice economical happenstance resulting from the golden rectangle. "
              <> "It is one of the reasons we tend to use as much "
              <> "as possible the DIN sizes: proportions are always leading to other nice proportions."
          ]
        , HH.p_
          [ HH.text $
              "This does not happen with the American basic size which leads to nothing. "
              <> "I counted 28 different standard sizes in USA!. The only reason we use it "
              <> "is because everybody in USA uses it, all stationary in USA is that size, "
              <> "so are manilla folders, les and of ce equipment!  The repercussion of ugliness is endless."
          ]
        ]
      ]
