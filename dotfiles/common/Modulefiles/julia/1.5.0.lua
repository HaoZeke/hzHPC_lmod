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
User module to load julia (with MKL)
]])

whatis("Name: " .. myModuleName())
whatis("Version: " .. myModuleVersion())
whatis("Category: lang")
whatis("https://julialang.org/")

-- Dependencies
always_load("intel/mkl/2017.2")
always_load("intel/compiler/2017.2")
always_load("openmpi/intel/2.1.1")

-- Variables
local home    = os.getenv("HOME")
local version = myModuleVersion()
local pkgName = myModuleName()
local juliah   = pathJoin(home,".hpc",pkgName,version)

-- Paths
prepend_path("MANPATH",pathJoin(juliah,"share"))
prepend_path("LD_LIBRARY_PATH",pathJoin(juliah,"lib"))
prepend_path("INCLUDE",pathJoin(juliah,"include"))
prepend_path("PATH",pathJoin(juliah,"bin"))
