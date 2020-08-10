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
User module to load a newer library built against gcc 9.2.0
]])

whatis("Name: " .. myModuleName())
whatis("Version: " .. myModuleVersion())
whatis("Category: lib")
whatis("")

-- Dependencies
always_load("autotools/autotools")
always_load("pkg-config/0.29.2")
always_load("bzip2/1.0.8")
always_load("libseccomp/2.0.5")
always_load("editline/3.32.3")
always_load("boost/boost-1.73.0")


-- Variables
local home    = os.getenv("HOME")
local version = myModuleVersion()
local pkgName = myModuleName()
local nixh   = pathJoin(home,"nix-boot")
local nixp   = pathJoin(home,".nix-profile")

-- Environment
pushenv("NIX_PATH","nixpkgs=" .. pathJoin(home,"Git","Github","nixpkgs"))

-- Paths
prepend_path("MANPATH",pathJoin(nixh,"man"))
prepend_path("LD_LIBRARY_PATH",pathJoin(nixh,"lib"))
prepend_path("INCLUDE",pathJoin(nixh,"include"))
prepend_path("PATH",pathJoin(nixh,"bin"))
prepend_path("PKG_CONFIG_PATH",pathJoin(nixh,"lib","pkgconfig"))

-- Automated
setenv("NIX_PROFILES","/users/home/rog32/.nix/var/nix/profiles/default /users/home/rog32/.nix-profile")
setenv("NIX_SSL_CERT_FILE","/etc/ssl/certs/ca-bundle.crt")
prepend_path("PATH",pathJoin(nixp,"bin"))
prepend_path("MANPATH",pathJoin(nixp,"share","man"))
