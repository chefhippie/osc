#
# Cookbook Name:: osc
# Attributes:: default
#
# Copyright 2013-2014, Thomas Boerger <thomas@webhippie.de>
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

default["osc"]["packages"] = value_for_platform_family(
  "debian" => %w(
    quilt
    osc
  ),
  "suse" => %w(
    quilt
    osc
    obs-service-tar_scm
    obs-service-source_validator
    obs-service-set_version
    obs-service-recompress
    obs-service-verify_file
    obs-service-format_spec_file
    obs-service-refresh_patches
  )
)

case node["platform_family"]
when "suse"
  repo = case node["platform_version"]
  when /\A13\.\d+\z/
    "openSUSE_#{node["platform_version"]}"
  when /\A42\.\d+\z/
    "openSUSE_#{node["platform_version"]}"
  when /\A\d{8}\z/
    "openSUSE_Tumbleweed"
  else
    raise "Unsupported SUSE version"
  end

  default["osc"]["zypper"]["enabled"] = true
  default["osc"]["zypper"]["alias"] = "opensuse-tools"
  default["osc"]["zypper"]["title"] = "openSUSE Tools"
  default["osc"]["zypper"]["repo"] = "http://download.opensuse.org/repositories/openSUSE:/Tools/#{repo}/"
  default["osc"]["zypper"]["key"] = "#{node["osc"]["zypper"]["repo"]}repodata/repomd.xml.key"
end
