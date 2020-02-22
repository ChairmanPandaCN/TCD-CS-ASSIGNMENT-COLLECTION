module Paths_ex03 (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/chairmanpanda/Desktop/code/introToFunctionalProgramming/CSU34016-1920/Exercise03/.stack-work/install/x86_64-linux/35a73f03ce065e6c21dc35314dd892a8c4cedb3ce6491d996816d2701f32c8a9/7.10.3/bin"
libdir     = "/home/chairmanpanda/Desktop/code/introToFunctionalProgramming/CSU34016-1920/Exercise03/.stack-work/install/x86_64-linux/35a73f03ce065e6c21dc35314dd892a8c4cedb3ce6491d996816d2701f32c8a9/7.10.3/lib/x86_64-linux-ghc-7.10.3/ex03-0.1.0.0-0cqVf5TZfmsJcBFB6H73XQ"
datadir    = "/home/chairmanpanda/Desktop/code/introToFunctionalProgramming/CSU34016-1920/Exercise03/.stack-work/install/x86_64-linux/35a73f03ce065e6c21dc35314dd892a8c4cedb3ce6491d996816d2701f32c8a9/7.10.3/share/x86_64-linux-ghc-7.10.3/ex03-0.1.0.0"
libexecdir = "/home/chairmanpanda/Desktop/code/introToFunctionalProgramming/CSU34016-1920/Exercise03/.stack-work/install/x86_64-linux/35a73f03ce065e6c21dc35314dd892a8c4cedb3ce6491d996816d2701f32c8a9/7.10.3/libexec"
sysconfdir = "/home/chairmanpanda/Desktop/code/introToFunctionalProgramming/CSU34016-1920/Exercise03/.stack-work/install/x86_64-linux/35a73f03ce065e6c21dc35314dd892a8c4cedb3ce6491d996816d2701f32c8a9/7.10.3/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "ex03_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "ex03_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "ex03_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "ex03_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "ex03_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
