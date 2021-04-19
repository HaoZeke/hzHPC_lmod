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
User module to load a newer boost
]])

whatis("Name: " .. myModuleName())
whatis("Version: " .. myModuleVersion())
whatis("Category: runtime library")
whatis("Description: Boost free peer-reviewed portable C++ source libraries")
whatis("http://www.boost.org")

family("boost")

-- Dependencies
always_load("autotools/autotools")

-- Variables
local home    = os.getenv("HOME")
local version = myModuleVersion()
local pkgName = myModuleName()
local bhome   = pathJoin(home,".hpc",pkgName,version)

-- environment
setenv("BOOST_DIR",bhome)
setenv("BOOST_ROOT",bhome)
setenv("BOOST_LIB",pathJoin(bhome,"lib"))
setenv("BOOST_INC",pathJoin(bhome,"include"))

-- Paths
prepend_path("INCLUDE",pathJoin(bhome,"include"))
prepend_path("LD_LIBRARY_PATH",pathJoin(bhome,"lib"))
