module TestPackage (
  NoExportedCtors(),
  ExportedCtors(..),
  exportedFn,
  dataWithDocs,
  withoutTypeSig
 ) where

data NoExportedCtors
  = ThisShouldNotBeExported
  | NeitherShouldThis String

data ExportedCtors
  = ThisShouldBeExported
  | SoShouldThis Number

-- | This function should be exported.
exportedFn :: String -> String
exportedFn = nonExportedFn

-- | This function should not be exported.
nonExportedFn :: Number -> Number
nonExportedFn = id

-- | Documentation for this type.
--   This should be **strong** in the output.
dataWithDocs :: Number
dataWithDocs = 3

-- | This is what happens when you don't include an explicit type signature.
withoutTypeSig = "hello"

-- | Testing searching for symbolic functions.
(<++>) :: Number -> Number
(<++>) x y = if x > y then x + y else x * y

class Thingy a where
  -- | This should show up as forall a. (Thingy a) => a -> a
  thingy :: a -> a
