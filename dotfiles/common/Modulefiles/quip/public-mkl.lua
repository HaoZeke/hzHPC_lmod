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
User module to load quip
]])

whatis("Name: " .. myModuleName())
whatis("Version: " .. myModuleVersion())
whatis("Category: lib")
whatis("https://github.com/libAtoms/QUIP/tree/public")

-- Dependencies
always_load("intel/mkl/2017.2")
always_load("intel/compiler/2017.2")
always_load("openmpi/intel/2.1.1")

-- Variables
local home    = os.getenv("HOME")
local version = myModuleVersion()
local pkgName = myModuleName()
local quiph   = pathJoin(home,".hpc",pkgName,version)

-- environment
setenv("QUIP_ARCH","linux_x86_64_ifort_icc_mpi")
setenv("QUIP_INSTALLDIR",quiph)

-- Paths
prepend_path("MANPATH",pathJoin(quiph,"share"))
prepend_path("LD_LIBRARY_PATH",pathJoin(quiph,"lib"))
prepend_path("INCLUDE",pathJoin(quiph,"include"))
prepend_path("PATH",pathJoin(quiph,"bin"))
prepend_path("PKG_CONFIG_PATH",pathJoin(quiph,"lib","pkgconfig"))
