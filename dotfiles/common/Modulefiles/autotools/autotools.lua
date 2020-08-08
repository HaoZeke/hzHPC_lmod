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
The autotools modulefile defines m4, autoconf, automake and libtool
]])
-- 1 --
if (os.getenv("USER") ~= "root") then
append_path("PATH", ".")
end
-- Dependencies
always_load("gcc/9.2.0")

-- 2 --
load("autotools/m4/1.4.18","autotools/autoconf/2.68","autotools/automake/1.16.2","autotools/libtool/2.4.6")
