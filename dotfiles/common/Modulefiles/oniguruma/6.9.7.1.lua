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
User module to load a newer library
]])

whatis("Name: " .. myModuleName())
whatis("Version: " .. myModuleVersion())
whatis("Category: lib tools")
whatis("https://github.com/kkos/oniguruma")

-- Dependencies
always_load("autotools/autotools")
always_load("bison/3.7.1")
always_load("flex/2.6.4")

-- Variables
local home    = os.getenv("HOME")
local version = myModuleVersion()
local pkgName = myModuleName()
local onih   = pathJoin(home,".hpc",pkgName,version)

-- Paths
prepend_path("LD_LIBRARY_PATH",pathJoin(onih,"lib"))
prepend_path("INCLUDE",pathJoin(onih,"include"))
prepend_path("PATH",pathJoin(onih,"bin"))
prepend_path("PKG_CONFIG_PATH",pathJoin(onih,"lib","pkgconfig"))
