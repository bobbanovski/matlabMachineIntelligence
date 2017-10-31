function result = find_template_2D(template, image)
    c = normxcorr2(template, image);
    [yRaw, xRaw] = find(c == max(c(:))); %find image wide maximum
    yIndex = yRaw - size(template, 1) + 1;
    xIndex = xRaw - size(template, 2) + 1;
    result = [yIndex, xIndex, yRaw, xRaw];