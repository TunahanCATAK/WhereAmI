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
%## @deftypefn {Function File} {@var{retval} =} offline_training_rss_values (@var{input1}, @var{input2})
%##
%## @seealso{}
%## @end deftypefn

%## Author: tuna <tuna@tuna-LIFEBOOK-E734>
%## Created: 2018-12-16

function [offline_fingerprints] = offline_training_rss_values (M, aps, bps, row_count, column_count, wifi_n, ble_n, wifi_Pd0, ble_Pd0)
   
  Prow = 0:0.5:row_count;
  Pcolumn = 0:0.5:column_count;
  
  offline_fingerprints = zeros(length(Prow)*length(Pcolumn), 2+length(aps) + length(bps));
  count = 1;
  
  for i=1:length(Prow)
    for j=1:length(Pcolumn)
      x = Prow(1,i);
      y = Pcolumn(1,j);
      offline_fingerprints(count, 1) = x;
      offline_fingerprints(count, 2) = y;
      
      [fp, fp_wn] = calculate_fingerprint(M, aps, bps, x, y, wifi_n, ble_n, wifi_Pd0, ble_Pd0, 0);
      offline_fingerprints(count, 3:2+length(aps) + length(bps)) = fp;      
      
      count = count+1;
    end  
  end
    
  
endfunction
