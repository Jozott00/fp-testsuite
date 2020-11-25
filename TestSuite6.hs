module TestSuite6 where

import Angabe6
import qualified Control.Exception as E
import qualified Control.Monad as M
import Test.Tasty
import Test.Tasty.HUnit
import Test.Tasty.Ingredients.ConsoleReporter (consoleTestReporter)
import Prelude as P

main :: IO ()
main = defaultMainWithIngredients [consoleTestReporter] spec

spec :: TestTree
spec =
  testGroup
    "Angabe6 Tests"
    [ gen_sort_tests,
      gen_insert_tests,
      auf_ord_tests,
      ab_ord_tests,
      showInstanceTests,
      eqInstanceTests,
      ordInstanceTests,
      showTreeTests,
      eqTreeTests,
      ordTreeTests,
      auf_lst_tests,
      ab_lst_tests,
      auf_fun_tests
    ]

-- Aufgabe A.1
gen_sort_tests :: TestTree
gen_sort_tests =
  testGroup
    "A.1 gen_sort"
    [ testCase "A1 01" $ gen_sort (<=) ([] :: [Int]) @?= [],
      testCase "A1 02" $ gen_sort (<=) [3, 5, 2, 4] @?= [2, 3, 4, 5],
      testCase "A1 03" $ gen_sort (<=) [3, 5, 3, 4, 2, 4] @?= [2, 3, 3, 4, 4, 5],
      testCase "A1 04" $ gen_sort (<) ([] :: [Int]) @?= [],
      testCase "A1 05" $ gen_sort (<) [3, 5, 2, 4] @?= [2, 3, 4, 5],
      testCase "A1 06" $ gen_sort (<) [3, 5, 3, 4, 2, 4] @?= [2, 3, 3, 4, 4, 5],
      testCase "A1 07" $ gen_sort (>=) ([] :: [Int]) @?= [],
      testCase "A1 08" $ gen_sort (>=) [3, 5, 2, 4] @?= [5, 4, 3, 2],
      testCase "A1 09" $ gen_sort (>=) [3, 5, 3, 4, 2, 4] @?= [5, 4, 4, 3, 3, 2],
      testCase "A1 10" $ gen_sort (>) ([] :: [Int]) @?= [],
      testCase "A1 11" $ gen_sort (>) [3, 5, 2, 4] @?= [5, 4, 3, 2],
      testCase "A1 12" $ gen_sort (>=) [3, 5, 3, 4, 2, 4] @?= [5, 4, 4, 3, 3, 2]
    ]

gen_insert_tests :: TestTree
gen_insert_tests =
  testGroup
    "A.1 gen_insert"
    [ testCase "A1 13" $ gen_insert (<=) 4 [] @?= [4],
      testCase "A1 14" $ gen_insert (<=) 4 [1, 3, 5, 7, 9] @?= [1, 3, 4, 5, 7, 9],
      testCase "A1 15" $ gen_insert (<=) 4 [1, 3, 4, 4, 5, 7, 9] @?= [1, 3, 4, 4, 4, 5, 7, 9],
      testCase "A1 16" $ gen_insert (<=) 4 [1, 3, 1, 3, 6, 8] @?= [1, 3, 1, 3, 4, 6, 8],
      testCase "A1 17" $ gen_insert (<) 4 [] @?= [4],
      testCase "A1 18" $ gen_insert (<) 4 [1, 3, 5, 7, 9] @?= [1, 3, 4, 5, 7, 9],
      testCase "A1 19" $ gen_insert (<) 4 [1, 3, 4, 4, 5, 7, 9] @?= [1, 3, 4, 4, 4, 5, 7, 9],
      testCase "A1 20" $ gen_insert (<) 4 [1, 3, 1, 3, 6, 8] @?= [1, 3, 1, 3, 4, 6, 8],
      testCase "A1 21" $ gen_insert (>=) 4 [] @?= [4],
      testCase "A1 22" $ gen_insert (>=) 4 [9, 7, 5, 3, 1] @?= [9, 7, 5, 4, 3, 1],
      testCase "A1 23" $ gen_insert (>=) 4 [1, 3, 4, 4, 5, 7, 9] @?= [4, 1, 3, 4, 4, 5, 7, 9],
      testCase "A1 24" $ gen_insert (>=) 4 [1, 3, 1, 3, 6, 8] @?= [4, 1, 3, 1, 3, 6, 8],
      testCase "A1 25" $ gen_insert (>=) 4 [10, 13, 4, 4, 5, 7, 9] @?= [10, 13, 4, 4, 4, 5, 7, 9],
      testCase "A1 25" $ gen_insert (>) 4 [] @?= [4],
      testCase "A1 26" $ gen_insert (>) 4 [9, 7, 5, 3, 1] @?= [9, 7, 5, 4, 3, 1],
      testCase "A1 27" $ gen_insert (>) 4 [1, 3, 4, 4, 5, 7, 9] @?= [4, 1, 3, 4, 4, 5, 7, 9],
      testCase "A1 28" $ gen_insert (>) 4 [1, 3, 1, 3, 6, 8] @?= [4, 1, 3, 1, 3, 6, 8],
      testCase "A1 29" $ gen_insert (>) 4 [10, 13, 4, 4, 5, 7, 9] @?= [10, 13, 4, 4, 5, 7, 9, 4]
    ]

-- Aufgabe A.3

auf_ord_tests :: TestTree
auf_ord_tests =
  testGroup
    "A.3 auf_ord"
    [ testCase "A3 01" $ auf_ord ([] :: [Int]) @?= [],
      testCase "A3 02" $ auf_ord [3, 5, 2, 4] @?= [2, 3, 4, 5],
      testCase "A3 03" $ auf_ord [3, 5, 3, 4, 2, 4] @?= [2, 3, 3, 4, 4, 5],
      testCase "A3 04" $ auf_ord [3, 5, 2, 4] @?= [2, 3, 4, 5],
      testCase "A3 05" $ auf_ord [3, 5, 3, 4, 2, 4] @?= [2, 3, 3, 4, 4, 5]
    ]

ab_ord_tests :: TestTree
ab_ord_tests =
  testGroup
    "A.3 ab_ord"
    [ testCase "A3 06" $ ab_ord ([] :: [Int]) @?= [],
      testCase "A3 07" $ ab_ord [3, 5, 2, 4] @?= [5, 4, 3, 2],
      testCase "A3 08" $ ab_ord [3, 5, 3, 4, 2, 4] @?= [5, 4, 4, 3, 3, 2],
      testCase "A3 09" $ ab_ord [3, 5, 2, 4] @?= [5, 4, 3, 2],
      testCase "A3 10" $ ab_ord [3, 5, 3, 4, 2, 4] @?= [5, 4, 4, 3, 3, 2]
    ]

-- Aufgabe A.5

showInstanceTests :: TestTree
showInstanceTests =
  testGroup
    "Show Instance Tests"
    [ testCase "Test 1" $ do
        P.show Ungueltig @?= "Kein Intervall",
      testCase "Test 2" $ do
        P.show Leer @?= "<>",
      testCase "Test 3" $ do
        P.show (IV (1, 2)) @?= "<1,2>",
      testCase "Test 4" $ do
        P.show (IV (-2, 4)) @?= "<-2,4>",
      testCase "Test 5" $ do
        P.show (IV (2, 1)) @?= "<>"
    ]

eqInstanceTests :: TestTree
eqInstanceTests =
  testGroup
    "Eq Instance Tests"
    [ testCase "Test 1" $ do
        IV (2, 5) P.== IV (2, 5) @?= True,
      testCase "Test 2" $ do
        IV (2, 5) P.== IV (5, 2) @?= False,
      testCase "Test 3" $ do
        IV (2, 5) P./= IV (2, 5) @?= False,
      testCase "Test 4" $ do
        Leer P.== IV (5, 2) @?= True,
      testCase "Test 5" $ do
        (IV (2, 5) P./= Ungueltig) `expectError` "Vergleich nicht moeglich",
      testCase "Test 6" $ do
        (Leer P.== Ungueltig) `expectError` "Vergleich nicht moeglich"
    ]

ordInstanceTests :: TestTree
ordInstanceTests =
  testGroup
    "Ord Instance Tests"
    [ testCase "Test 1" $ do
        IV (2, 5) P.<= IV (2, 5) @?= True,
      testCase "Test 2" $ do
        IV (2, 5) P.> IV (1, 4) @?= False,
      testCase "Test 3" $ do
        IV (2, 3) P.<= IV (2, 5) @?= True,
      testCase "Test 4" $ do
        IV (3, 4) P.< IV (2, 5) @?= True,
      testCase "Test 5" $ do
        IV (3, 5) P.< IV (2, 4) @?= False,
      testCase "Test 6" $ do
        (IV (2, 5) P.<= Ungueltig) `expectError` "Vergleich nicht moeglich",
      testCase "Test 7" $ do
        (Leer P.> Ungueltig) `expectError` "Vergleich nicht moeglich"
    ]

showTreeTests :: TestTree
showTreeTests =
  testGroup
    "Show Tree Tests"
    [ testCase "Test 1" $ do
        P.show (B ([] :: Info Int)) @?= "<[]>",
      testCase "Test 2" $ do
        P.show (B [1, 2]) @?= "<[1,2]>",
      testCase "Test 3" $ do
        P.show (K (B [1]) [2] (B [3])) @?= "<Wurzel [2] <[1]> <[3]>>",
      testCase "Test 4" $ do
        P.show (K (K (B [1]) [2] (B [3])) [4] (B [5])) @?= "<Wurzel [4] <Wurzel [2] <[1]> <[3]>> <[5]>>"
    ]

eqTreeTests :: TestTree
eqTreeTests =
  testGroup
    "Eq Tree Tests"
    [ testCase "Eq Test 1" $ (B "bier") == (B "bier") @?= True,
      testCase "Eq Test 2" $ (B "Knopers") == (B []) @?= False,
      testCase "Eq Test 3" $ (K (B "bier") "bier" (B "bier")) == (B "bier") @?= False,
      testCase "Eq Test 4" $ (B "bier") == (K (B "bier") "bier" (B "bier")) @?= False,
      testCase "Eq Test 5" $ (K (B "b") "a" (B "c")) == (K (B "b") "a" (B "c")) @?= True,
      testCase "Eq Test 6" $ (K (B "b") "x" (B "c")) == (K (B "b") "a" (B "c")) @?= False,
      testCase "Eq Test 7" $ (K (B "x") "a" (B "c")) == (K (B "b") "a" (B "c")) @?= False,
      testCase "Eq Test 8" $ (K (B "b") "a" (K (B "d") "c" (B "e"))) == (K (B "b") "a" (B "c")) @?= False
    ]

ordTreeTests :: TestTree
ordTreeTests =
  testGroup
    "Ord Tree Tests"
    [ testCase "Test 1" $ do
        P.compare (B [1]) (K (B []) [1, 2] (B [])) @?= P.LT,
      testCase "Test 2" $ do
        P.compare (K (B []) [1, 2] (B [])) (B [1]) @?= P.GT,
      testCase "Test 3" $ do
        P.compare (K (B [1]) [] (B [2])) (K (B [1]) [] (B [2])) @?= P.EQ,
    -- advanced testcases:
      testCase "ord 1" $ (K (K (B "") "a" (B "")) "abc" (B "a")) > (K (B "") "ab" (B "")) @?= True,
      testCase "ord 2" $ (B "") > (B "") @?= False,
      testCase "ord 3" $ (B "") >= (B "") @?= True,
      testCase "ord 4" $ (B "") < (B "") @?= False,
      testCase "ord 5" $ (B "") <= (B "") @?= True,
      testCase "ord 6" $ (K (B "") "" (B "")) > (B "") @?= False,
      testCase "ord 7" $ (K (B "") "" (B "")) >= (B "") @?= False,
      testCase "ord 8" $ (K (B "") "a" (B "")) > (B "") @?= True,
      testCase "ord 9" $ (K (B "") "abc" (B "")) > (B "ab") @?= True,
      testCase "ord 10" $ (K (B "") "abc" (B "")) > (B "abc") @?= False,
      testCase "ord 11" $ (K (B "") "abc" (B "")) >= (B "abc") @?= False,
      testCase "ord 12" $ (B "") < (K (B "") "" (B "")) @?= False,
      testCase "ord 13" $ (B "") <= (K (B "") "" (B "")) @?= False,
      testCase "ord 14" $ (B "") < (K (B "") "a" (B "")) @?= True,
      testCase "ord 15" $ (B "ab") < (K (B "") "abc" (B "")) @?= True,
      testCase "ord 16" $ (B "abc") < (K (B "") "abc" (B "")) @?= False,
      testCase "ord 17" $ (B "abc") <= (K (B "") "abc" (B "")) @?= False,
      testCase "ord 18" $ (K (K (B "") "" (B "")) "" (B "")) < (K (B "a") "a" (K (B "a") "a" (B "a"))) @?= False,
      testCase "ord 19" $ (K (K (B "") "" (B "")) "" (B "")) <= (K (B "a") "a" (K (B "a") "a" (B "a"))) @?= False,
      testCase "ord 20" $ (K (K (B "a") "a" (B "a")) "a" (B "a")) > (K (B "") "" (K (B "") "a" (B ""))) @?= False,
      testCase "ord 21" $ (K (K (B "a") "a" (B "a")) "a" (B "a")) >= (K (B "") "" (K (B "") "a" (B ""))) @?= False,
      testCase "ord 22" $ (K (K (B "") "" (B "")) "abc" (B "")) > (K (B "") "ab" (B "")) @?= False,
      testCase "ord 23" $ (B "a") > (B "") @?= False,
      testCase "ord 24" $ (B "") > (B "a") @?= False,
      testCase "ord 25" $ (B "a") >= (B "") @?= False,
      testCase "ord 26" $ (B "") >= (B "a") @?= False,
      testCase "ord 27" $ (B "a") < (B "") @?= False,
      testCase "ord 28" $ (B "") < (B "a") @?= False,
      testCase "ord 39" $ (B "") <= (B "a") @?= False,
      testCase "ord 30" $ (B "a") <= (B "") @?= False,
      testCase "ord 31" $ (K (K (B "") "" (B "")) "" (B "")) < (K (K (B "a") "a" (B "a")) "a" (B "a")) @?= False,
      testCase "ord 32" $ (K (K (B "") "" (B "")) "" (B "")) <= (K (K (B "a") "a" (B "a")) "a" (B "a")) @?= False,
      testCase "ord 33" $ (K (K (B "a") "a" (B "a")) "a" (B "a")) > (K (K (B "") "" (B "")) "" (B "")) @?= False,
      testCase "ord 34" $ (K (K (B "a") "a" (B "a")) "a" (B "a")) >= (K (K (B "") "" (B "")) "" (B "")) @?= False,
      testCase "ord 35" $ (K (K (B "") "" (B "")) "" (B "")) < (K (K (B "a") "a" (B "a")) "a" (K (B "a") "a" (B "a"))) @?= True,
      testCase "ord 36" $ (K (K (B "") "" (B "")) "" (B "")) <= (K (K (B "a") "a" (B "a")) "a" (K (B "a") "a" (B "a"))) @?= True,
      testCase "ord 37" $ (K (K (B "a") "a" (B "a")) "a" (K (B "a") "a" (B "a"))) > (K (K (B "") "" (B "")) "" (B "")) @?= True,
      testCase "ord 38" $ (K (K (B "a") "a" (B "a")) "a" (K (B "a") "a" (B "a"))) >= (K (K (B "") "" (B "")) "" (B "")) @?= True,
      testCase "ord 39" $ (K (K (B "") "" (B "")) "" (B "")) < (K (K (B "") "" (B "")) "" (B "")) @?= False,
      testCase "ord 40" $ (K (K (B "") "" (B "")) "" (B "")) <= (K (K (B "") "" (B "")) "" (B "")) @?= True,
      testCase "ord 41" $ (K (K (B "") "" (B "")) "" (B "")) > (K (K (B "") "" (B "")) "" (B "")) @?= False,
      testCase "ord 42" $ (K (K (B "") "" (B "")) "" (B "")) >= (K (K (B "") "" (B "")) "" (B "")) @?= True
    ]

auf_lst_tests :: TestTree
auf_lst_tests =
  testGroup
    "A.8 auf_lst"
    [ testCase "A8 01" $ auf_lst ([] :: [[Int]]) @?= [],
      testCase "A8 02" $ auf_lst [[1 .. 4], [], [2, 1]] @?= [[], [2, 1], [1 .. 4]],
      testCase "A8 03" $ auf_lst [[], [1 .. 5], [], [2, 3, 1]] @?= [[], [], [2, 3, 1], [1 .. 5]],
      testCase "A8 04" $ auf_lst [[1 .. 5], [1], [1 .. 3], [1 .. 4], [1, 2]] @?= [[1], [1, 2], [1 .. 3], [1 .. 4], [1 .. 5]]
    ]

ab_lst_tests :: TestTree
ab_lst_tests =
  testGroup
    "A.8 ab_lst"
    [ testCase "A8 05" $ ab_lst ([] :: [[Int]]) @?= [],
      testCase "A8 06" $ ab_lst [[1 .. 4], [], [2, 1]] @?= [[1 .. 4], [2, 1], []],
      testCase "A8 07" $ ab_lst [[], [1 .. 5], [], [2, 3, 1]] @?= [[1 .. 5], [2, 3, 1], [], []],
      testCase "A8 08" $ ab_lst [[1 .. 5], [1], [1 .. 3], [1 .. 4], [1, 2]] @?= [[1 .. 5], [1 .. 4], [1 .. 3], [1, 2], [1]]
    ]

{-
p1 :: Int -> Int
p1 num = num + 1

p2 :: Int -> Int
p2 num = num + 2

p3 :: Int -> Int
p3 num = num + 3

auf_fun_tests :: TestTree
auf_fun_tests =
  testGroup
    "A.10 auf_fun"
    []
-}

--testCase "A10 01" $  auf_fun [p1] @?= [p1]
--testCase "A10 02" $  auf_fun [p3,p2,p1] @?= [p1,p2,p3],
--testCase "A10 03" $  auf_fun [p3,p1,p2] @?= [p1,p2,p3],
--testCase "A10 04" $  auf_fun [p1,p2,p3] @?= [p1,p2,p3]

expectError :: Show a => a -> String -> Assertion
expectError val expectedMsg = do
  err <- E.try (E.evaluate val)
  case err of
    Left (E.ErrorCall actual) ->
      M.unless (expectedMsg P.== actual) $
        assertFailure $
          "expected: " ++ expectedMsg ++ "\n but got: " ++ actual
    Right r -> do
      assertFailure $ "Expected an exception but got: " ++ P.show r
