-- Copyright 2020 Rohit Goswami (HaoZeke) <rog32[at]hi.is>
--
-- Licensed under the Apache License, Version 2.0 (the "License");
--
-- you may not use this file except in compliance with the License.
--
-- You may obtain a copy of the License at
--
-- http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
--
-- distributed under the License is distributed on an "AS IS" BASIS,
--
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--
-- See the License for the specific language governing permissions and
--
-- limitations under the License.

help([[
User module to load bootstrapped nix
]])

whatis("Name: " .. myModuleName())
whatis("Version: " .. myModuleVersion())
whatis("Category: lib")
whatis("")

-- Variables
local home    = os.getenv("HOME")
local version = myModuleVersion()
local pkgName = myModuleName()
local nixp   = pathJoin(home,".nix-profile")
local nixs   = pathJoin(home,".nix")

-- Environment
setenv("NIX_PROFILES", pathJoin(home,".nix") .. "/var/nix/profiles/default" .. nixp )
setenv("NIX_IGNORE_SYMLINK_STORE",1)
setenv("NIX_STORE_DIR",pathJoin(nixs,"store"))
setenv("NIX_STATE_DIR",pathJoin(nixs,"state"))
setenv("NIX_LOG_DIR",pathJoin(nixs,"var","log","nix"))
setenv("NIX_CONF_DIR",pathJoin(nixs,"etc","nix"))
setenv("NIX_PATH", "nixpkgs=" .. nixs .. "/state/profiles/per-user/" .. os.getenv("USER") .. "/channels/nixpkgs")

-- Paths (native)
prepend_path("MANPATH",pathJoin(nixp,"man"))
prepend_path("LD_LIBRARY_PATH",pathJoin(nixp,"lib"))
prepend_path("INCLUDE",pathJoin(nixp,"include"))
prepend_path("PATH",pathJoin(nixp,"bin"))
prepend_path("PKG_CONFIG_PATH",pathJoin(nixp,"lib","pkgconfig"))

-- Automated
setenv("NIX_PROFILES", pathJoin(home,".nix") .. "/var/nix/profiles/default" .. nixp )
pushenv("NIX_SSL_CERT_FILE","/etc/ssl/certs/ca-bundle.crt")
