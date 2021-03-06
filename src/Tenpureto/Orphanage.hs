{-# OPTIONS_GHC -fno-warn-orphans #-}

module Tenpureto.Orphanage where

import qualified Data.Text                     as T
import           Data.Set                       ( Set )
import qualified Data.Set                      as Set
import           Data.Map                       ( Map )
import qualified Data.Map                      as Map
import           Data.HashMap.Strict.InsOrd     ( InsOrdHashMap )
import qualified Data.HashMap.Strict.InsOrd    as InsOrdHashMap
import           Data.Text.Prettyprint.Doc
import           Path
import           Data.Yaml.Parser               ( FromYaml(..)
                                                , withText
                                                )

instance Pretty (Path a t) where
    pretty = pretty . toFilePath

instance Pretty a => Pretty (Set a) where
    pretty s = group . encloseSep "[ " " ]" ", " $ pretty <$> Set.toList s

instance (Pretty a, Pretty b) => Pretty (Map a b) where
    pretty s = group . encloseSep "{ " " }" ", " $ pretty <$> Map.toList s

instance (Pretty a, Pretty b) => Pretty (InsOrdHashMap a b) where
    pretty s =
        group . encloseSep "{ " " }" ", " $ pretty <$> InsOrdHashMap.toList s

instance FromYaml Bool where
    fromYaml = withText "Bool" $ \case
        x
            | elem
                x
                [ "y"
                , "Y"
                , "yes"
                , "Yes"
                , "YES"
                , "true"
                , "True"
                , "TRUE"
                , "on"
                , "On"
                , "ON"
                ]
            -> pure True
        x
            | elem
                x
                [ "n"
                , "N"
                , "no"
                , "No"
                , "NO"
                , "false"
                , "False"
                , "FALSE"
                , "off"
                , "Off"
                , "OFF"
                ]
            -> pure False
        other -> fail ("Expected Bool, but got: " ++ T.unpack other)

-- TODO: remove
instance (Ord a, FromYaml a) => FromYaml (Set a) where
    fromYaml = fmap Set.fromList . fromYaml
