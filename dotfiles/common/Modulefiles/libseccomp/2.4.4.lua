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
whatis("https://github.com/seccomp/libseccomp")

-- Dependencies
always_load("autotools/autotools")
always_load("zlib/1.2.11")
always_load("gcc/9.2.0")
always_load("xz/5.2.5")
always_load("brotli/1.0.1")
always_load("gperf/3.1")

-- Variables
local home    = os.getenv("HOME")
local version = myModuleVersion()
local pkgName = myModuleName()
local sechome   = pathJoin(home,".hpc",pkgName,version)

-- Paths
prepend_path("MANPATH",pathJoin(sechome,"share"))
prepend_path("PATH",pathJoin(sechome,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(sechome,"lib"))
prepend_path("INCLUDE",pathJoin(sechome,"include"))
prepend_path("PKG_CONFIG_PATH",pathJoin(sechome,"lib","pkgconfig"))
