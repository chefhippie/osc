#
# Cookbook Name:: osc
# Attributes:: default
#
# Copyright 2013, Thomas Boerger
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default["osc"]["packages"] = %w(
  osc
  obs-service-tar_scm 
  obs-service-source_validator 
  obs-service-set_version 
  obs-service-recompress 
  obs-service-verify_file 
  obs-service-format_spec_file
)