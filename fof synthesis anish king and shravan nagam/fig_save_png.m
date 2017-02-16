function [ output_args ] = fig_save_png( f_width, f_height, s_file_name )
%FIG_SAVE_PDF Summary of this function goes here
%   Detailed explanation goes here

set(gcf, 'PaperSize', [f_width f_height]); 
set(gcf, 'PaperPositionMode', 'manual'); 
set(gcf, 'PaperPosition', [0 0 f_width f_height]);
set(gcf, 'PaperUnits', 'inches'); 
set(gcf, 'PaperSize', [f_width f_height]); 
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition', [0 0 f_width f_height]);  
set(gcf, 'renderer', 'painters'); 
print(gcf, '-dpng', s_file_name);

end
