{-# LANGUAGE StandaloneDeriving #-}

module Main where

import Test.HUnit
import Test.Framework as TF (defaultMain, testGroup, Test)
import Test.Framework.Providers.HUnit (testCase)
-- import Test.Framework.Providers.QuickCheck2 (testProperty)

import Ex03
import Data.Maybe (fromJust)

main = defaultMain tests -- runs the tests

tests :: [TF.Test]
tests = [ testGroup "\n\nExercise 03 Tests (XX marks)\n"
            [ insBSTTests
            , assoc2bstTests
            , bst2assocTests
            ]
        ]

-- Test bits and pieces
a = "a" ; b = "b" ; c = "c"
a1 = ("a",1) ; a2 = ("a",2) ; a3 = ("a",3)
b1 = ("b",1) ; b2 = ("b",2) ; b3 = ("b",3)
c1 = ("c",1) ; c2 = ("c",2) ; c3 = ("c",3)

sngl k d = Branch Leaf k d Leaf
sa1 = sngl a 1
sb1 = sngl b 1 ; sb2 = sngl b 2 ; sb3 = sngl b 3
sc3 = sngl c 3

bal123  = Branch (sngl a 1) b 2 (sngl c 3)
left123 = Branch (Branch (sngl a 1) b 2 Leaf) c 3 Leaf
right123 = Branch Leaf a 1 (Branch Leaf b 2 (sngl c 3))

-- tests for Part 1 (insBST) -----------------------------------------------------

insBSTTests :: TF.Test
insBSTTests
 = testGroup "\nPart 1 - insBSTTests (13 marks)"
    [ testCase "insert into Leaf [1 mark]" (insBST a 1 Leaf @?= sa1)
    , testCase "insert small into single [1 mark]"
        (insBST a 1 sb2 @?= Branch sa1 b 2 Leaf )
    , testCase "insert large into single [1 mark]"
        (insBST c 3 sb2 @?= Branch Leaf b 2 sc3 )
    , testCase "insert same into single [1 mark]"
        (insBST b 2 sb2 @?= sb2 )
    , testCase "insert same key, diff val into single [1 mark]"
        (insBST b 1 sb2 @?= sb1 )
    , testCase "insert balanced low to high [2 marks]"
       ( (insBST a 1 $ insBST c 3 $ sb2)  @?= bal123 )
    , testCase "insert balanced high to low [2 marks]"
       ( (insBST c 3 $ insBST a 1 $ sb2)  @?= bal123 )
    , testCase "left biased [2 marks]"
       ( (insBST a 1 $ insBST b 2 $ sc3)  @?= left123 )
    , testCase "right biased [2 marks]"
       ( (insBST c 3 $ insBST b 2 $ sa1)  @?= right123 )
    ]


-- tests for Part 2 (assoc2bst) -----------------------------------------------------

leaf = Leaf :: BT String Int

assoc2bstTests :: TF.Test
assoc2bstTests
 = testGroup "\nPart 2 - assoc2bst (6 marks)"
    [ testCase "empty assoc-list [1 mark]"  ( assoc2bst []   @?= leaf )
    , testCase "single assoc-list [1 mark]" ( assoc2bst [a1] @?= sngl a 1 )
    , testCase "double ordered [1 mark]"
          ( assoc2bst [b2,c3] @?= Branch (sngl b 2) c 3 leaf )
    , testCase "double unordered [1 mark]"
          ( assoc2bst [b2,a1] @?= Branch leaf a 1 (sngl b 2) )
    , testCase "triple balanced [1 mark]"
          ( assoc2bst [a1,c3,b2] @?= Branch (sngl a 1) b 2 (sngl c 3) )
    , testCase "three similar [1 mark]" ( assoc2bst [c3,c2,c1] @?= sngl c 3 )
    ]

-- tests for Part 3 (assoc2bst) -----------------------------------------------------

none = [] :: Assoc String Int

bst2assocTests :: TF.Test
bst2assocTests
 = testGroup "\nPart 3 - bst2assoc (6 marks)"
    [ testCase "Leaf [1 mark]" ( bst2assoc Leaf @?= none )
    , testCase "Single [1 mark]" ( bst2assoc (sngl a 1) @?= [a1] )
    , testCase "Left double [1 mark]"
         ( bst2assoc (Branch (sngl a 1) c 3 leaf) @?= [a1,c3] )
    , testCase "Right double [1 mark]"
         ( bst2assoc (Branch leaf a 1 (sngl b 2)) @?= [a1,b2] )
    , testCase "Balanced triple [1 mark]"
         ( bst2assoc (Branch (sngl a 1) b 2 (sngl c 3)) @?= [a1,b2,c3] )
    , testCase "Righthand triple [1 mark]" ( bst2assoc right123 @?= [a1,b2,c3] )
    ]
