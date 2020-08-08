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

-- Variables
local home    = os.getenv("HOME")
local version = myModuleVersion()
local pkgName = myModuleName()
local pbrewhome = pathJoin(home,".perlbrew")
local pbrewroot = home.."/perl5/perlbrew/"
local perl5home = pbrewroot.."/perls/perl-5.28.0/"

-- environment
setenv("PERLBREW_HOME",pbrewhome)
setenv("PERLBREW_MANPATH",perl5home,"man")
setenv("PERLBREW_PERL","perl-5.28.0")
setenv("PERLBREW_ROOT",pbrewroot)
setenv("PERLBREW_SHELLRC_VERSION","0.88")
setenv("PERLBREW_VERSION","0.88")
setenv("PERLBREW_PATH",pathJoin(pbrewroot,"bin"))

-- paths
prepend_path("MANPATH",perl5home.."man")
prepend_path("PATH",pathJoin(perl5home,"bin"))
prepend_path("PATH",pathJoin(pbrewroot,"bin"))
prepend_path("PERLBREW_PATH",pathJoin(perl5home,"bin"))
prepend_path("PERL_PATH",pathJoin(pbrewroot,"bin","perl"))
