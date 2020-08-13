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
User module to load pyenv
]])

whatis("Name: " .. myModuleName())
whatis("Version: " .. myModuleVersion())
whatis("Category: lang")
whatis("https://github.com/pyenv/pyenv/")

-- Dependencies
always_load("autotools/autotools")
always_load("openssl/1.1.1d")
always_load("bzip2/1.0.8")
always_load("readline/8.1-alpha")
always_load("sqlite/3.32.3")

-- Variables
local home    = os.getenv("HOME")
local version = myModuleVersion()
local pkgName = myModuleName()
local pyenvh   = pathJoin(home,".pyenv")

-- environment
setenv("PYENV_ROOT",pyenvh)

-- Paths
prepend_path("PATH",pathJoin(pyenvh,"bin"))
