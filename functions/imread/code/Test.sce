clear
clc
exec builder_gateway_cpp.sce
exec loader.sce
bl = aimread('color.tif')
disp("XXXXXXX")
disp(bl(1))
disp(bl(2))
disp(bl(3))


