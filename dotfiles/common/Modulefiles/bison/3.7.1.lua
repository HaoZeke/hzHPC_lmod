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
whatis("Category: tools")
whatis("https://www.gnu.org/software/bison/")

-- Dependencies
always_load("autotools/autotools")

-- Variables
local home    = os.getenv("HOME")
local version = myModuleVersion()
local pkgName = myModuleName()
local bisonh   = pathJoin(home,".hpc",pkgName,version)

-- Paths
prepend_path("MANPATH",pathJoin(bisonh,"share"))
prepend_path("LD_LIBRARY_PATH",pathJoin(bisonh,"lib"))
prepend_path("PATH",pathJoin(bisonh,"bin"))
