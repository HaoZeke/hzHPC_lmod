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

local home    = os.getenv("HOME")
local version = myModuleVersion()
local pkgName = myModuleName()
local pkghome     = pathJoin(home,".hpc","autotools",pkgName,version)
prepend_path("PATH", pathJoin(pkg,"bin"))
prepend_path("MANPATH", pathJoin(pkg,"share"))
