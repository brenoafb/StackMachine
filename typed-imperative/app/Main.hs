module Main where

import Parser
import Typechecker
import Interpreter
import Text.Pretty.Simple (pPrint)

main :: IO ()
main = do
  code <- getContents
  let program = parseStr code
      typechecks = typecheck program
  pPrint program
  case typecheck program of
    Just err -> putStrLn $ "type check error: " ++ err
    Nothing -> do
      putStrLn "type check succeeded"
      let env = runProgram program
      print env
