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
User module to load readline
]])

whatis("Name: " .. myModuleName())
whatis("Version: " .. myModuleVersion())
whatis("Category: lib")

-- Dependencies
always_load("autotools/autotools")
always_load("termcap/1.3.1")

-- Variables
local home    = os.getenv("HOME")
local version = myModuleVersion()
local pkgName = myModuleName()
local rlineh   = pathJoin(home,".hpc",pkgName,version)

-- Paths
prepend_path("MANPATH",pathJoin(rlineh,"share"))
prepend_path("LD_LIBRARY_PATH",pathJoin(rlineh,"lib"))
prepend_path("INCLUDE",pathJoin(rlineh,"include"))
prepend_path("PATH",pathJoin(rlineh,"bin"))
prepend_path("PKG_CONFIG_PATH",pathJoin(rlineh,"lib","pkgconfig"))
