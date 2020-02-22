module Paths_ex00 (
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

bindir     = "/users/ugrad/lusi/Level3/CSU34016-1920/Exercise00/.stack-work/install/x86_64-linux-nopie/lts-6.19/7.10.3/bin"
libdir     = "/users/ugrad/lusi/Level3/CSU34016-1920/Exercise00/.stack-work/install/x86_64-linux-nopie/lts-6.19/7.10.3/lib/x86_64-linux-ghc-7.10.3/ex00-0.1.0.0-5e2NMMgyKud6wfAfD3Wvb0"
datadir    = "/users/ugrad/lusi/Level3/CSU34016-1920/Exercise00/.stack-work/install/x86_64-linux-nopie/lts-6.19/7.10.3/share/x86_64-linux-ghc-7.10.3/ex00-0.1.0.0"
libexecdir = "/users/ugrad/lusi/Level3/CSU34016-1920/Exercise00/.stack-work/install/x86_64-linux-nopie/lts-6.19/7.10.3/libexec"
sysconfdir = "/users/ugrad/lusi/Level3/CSU34016-1920/Exercise00/.stack-work/install/x86_64-linux-nopie/lts-6.19/7.10.3/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "ex00_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "ex00_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "ex00_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "ex00_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "ex00_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
