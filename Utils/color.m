function [rgb] = color(cmap,v,vmin,vmax)

[m,n] = size(cmap);                  % m is the number of colors in map
dv = (vmax-vmin)/m;                  % Divide interval into m bins
if dv > 0                            % Select the bin index where v falls
   i = max(ceil((v-vmin)/dv), 1);
   rgb = cmap(i,:);                  % Return the color from the map
else
   rgb = cmap(ones(size(v)),:);
end

