{-# LANGUAGE StandaloneDeriving #-}

module Main where

import Test.HUnit
import Test.Framework as TF (defaultMain, testGroup, Test)
import Test.Framework.Providers.HUnit (testCase)
import Test.Framework.Providers.QuickCheck2 (testProperty)

import Ex01


raiseTests :: TF.Test
raiseTests
 = testGroup "\nTesting 'raise' (6 marks)"
    [ testCase "raise 0abc$ returns 0ABC$ [2 marks]" ( raise "0abc$" @?= "0ABC$" )
    , testCase "raise ZyZ returns XYZ [2 marks]" ( raise "ZyZ" @?= "ZYZ" )
    , testCase "raise empty string returns empty [2 marks]" ( raise "" @?= "" )
    ]


nthTests :: TF.Test
nthTests
 = testGroup "\nTesting 'nth' (10 marks)"
    [ testCase "nth 1 returns 1st element [2 marks]" ( nth 1 "abc" @?= 'a' )
    , testCase "nth 2 returns 2nd element [2 marks]" ( nth 2 "abc" @?= 'b' )
    , testCase "nth 3 returns 3rd element [2 marks]" ( nth 3 "abc" @?= 'c' )
    , testCase "nth 3 still returns 3rd [2 marks]" ( nth 3 "abcd" @?= 'c' )
    , testCase "nth 10 returns 10th element [2 marks]" ( nth 10 [1..20] @?= 10 )
    ]

commonLenTests :: TF.Test
commonLenTests
 = testGroup "\nTesting 'commonLen' (14 marks)"
    [ testCase "empty and empty share 0 [2 marks]"
               ( commonLen ([] :: [Int]) [] @?= (0::Int) )
    , testCase "<x,y> and <x,y> share 2 [2 marks]"
                ( commonLen [42,99] [42,99] @?= (2::Int) )
    , testCase "empty and <x> share 0 [2 marks]"
               ( commonLen [] [42] @?= (0::Int) )
    , testCase "<x> and <x,y> share 1 [2 marks]"
               ( commonLen [42] [42,99] @?= (1::Int) )
    , testCase "<x,y> and <x> share 1 [2 marks]"
               ( commonLen [42,99] [42] @?= (1::Int) )
    , testCase "<x,y,z> and <x,y> share 2 [2 marks]"
                ( commonLen [42,99,89] [42,99] @?= (2::Int) )
    , testCase "<a,b,c,d> and <a,b,x,d> share 2 [2 marks]"
               ( commonLen [1,2,3,4] [1,2,42,4] @?= (2::Int) )
    ]


main = defaultMain tests

tests :: [TF.Test]
tests = [ testGroup "\n\nExercise 01 Tests (30 marks)\n"
            [ raiseTests
            , nthTests
            , commonLenTests
            ]
        ]
