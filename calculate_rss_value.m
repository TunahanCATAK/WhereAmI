%## Copyright (C) 2018 tuna
%## 
%## This program is free software; you can redistribute it and/or modify it
%## under the terms of the GNU General Public License as published by
%## the Free Software Foundation; either version 3 of the License, or
%## (at your option) any later version.
%## 
%## This program is distributed in the hope that it will be useful,
%## but WITHOUT ANY WARRANTY; without even the implied warranty of
%## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%## GNU General Public License for more details.
%## 
%## You should have received a copy of the GNU General Public License
%## along with this program.  If not, see <http://www.gnu.org/licenses/>.

%## -*- texinfo -*- 
%## @deftypefn {Function File} {@var{retval} =} calculate_rss_value (@var{input1}, @var{input2})
%##
%## @seealso{}
%## @end deftypefn

%## Author: tuna <tuna@tuna-LIFEBOOK-E734>
%## Created: 2018-12-15


function rss_value = calculate_rss_value (location_matrix, n, Pd0)
  %pkg load statistics;

  d = pdist(location_matrix);
  rss_value = Pd0 - (10.*n.*log10(d));

  
end
