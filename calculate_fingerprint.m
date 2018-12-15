## Copyright (C) 2018 tuna
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {Function File} {@var{retval} =} calculate_fingerprint (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: tuna <tuna@tuna-LIFEBOOK-E734>
## Created: 2018-12-15

function [fingerprints, fingerprints_wnoise] = calculate_fingerprint (M, aps, bps, TProw, TPcolumn, n, ble_n, Pd0, ble_Pd0, sigma)
  
  fingerprints = zeros(1, length(aps)+length(bps));
  
  for i=1:length(aps)
    randomAPValue=aps(i);
    [AProw, APcolumn]=find(M == randomAPValue);
    
    location_matrix = [AProw, APcolumn; TProw, TPcolumn];
    rss_value = calculate_rss_value(location_matrix, n, Pd0);
    fingerprints(1, i) = rss_value;
    
  end
  
  for i=1:length(bps)
    randomAPValue=bps(i);
    [BleProw, BlePcolumn]=find(M == randomAPValue);
    
    location_matrix = [BleProw, BlePcolumn; TProw, TPcolumn];
    rss_value = calculate_rss_value(location_matrix, ble_n, ble_Pd0);
    fingerprints(1, i+length(aps)) = rss_value;
    
  end
  
  % TODO: add gaussian noise to the fingerprint vector. 
  fingerprints_wnoise = fingerprints + sqrt(sigma) * randn(size(fingerprints));
  
endfunction
