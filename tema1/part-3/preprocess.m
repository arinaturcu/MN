function [X, y] = preprocess(path_to_dataset, histogram, count_bins)
    cats = fullfile(path_to_dataset, 'cats/');
    not_cats = fullfile(path_to_dataset, 'not_cats/');

    # pemtru imaginile cu pisici
    cat_images = dir(fullfile(cats, '*.jpg'));
    n_c = numel(cat_images);

    # pentru imaginile fara pisici
    ncat_images = dir(fullfile(not_cats, '*.jpg'));
    n_n = numel(ncat_images);

    # initializare X si y
    X = zeros(n_c + n_n, count_bins * 3);
    y(1:n_c, 1) = 1;
    y(n_c + 1:n_c + n_n, 1) = -1;

    # prelucrarea imaginilor
    imgs_cats = fullfile(cats, {cat_images(:).name});
    imgs_not_cats = fullfile(not_cats, {ncat_images(:).name});

    imgs = [imgs_cats imgs_not_cats];

    if histogram == 'RGB'
        X = cellfun(@(path_to_image)rgbHistogram(path_to_image, count_bins), imgs, "UniformOutput", false);
    else
        X = cellfun(@(path_to_image)hsvHistogram(path_to_image, count_bins), imgs, "UniformOutput", false);
    endif

    X = cell2mat(X);
    X = reshape(X, count_bins * 3, n_c + n_n)';

endfunction
