function encoded_image = coding(message, image, mapset)
    message_len = length(message);
    message_bin = cell(1, message_len);

    % Iterate over each character in the message
    for i = 1:message_len
        ch = message(i);
        index = find(strcmp(ch, mapset(1, :)));
        message_bin{i} = mapset{2, index};
    end

    % Convert the cell array of binary representations into a single binary string
    binary_message = cell2mat(message_bin);
    binary_message_len = length(binary_message);
    image_len = numel(image);
    if binary_message_len > image_len
        fprintf('Cannot perform the action: the message is too long.\n');
        encoded_image = [];
    else
        encoded_image = image;
        for i = 1:binary_message_len 
            x = encoded_image(i);
        
            % Convert the pixel value to binary
            x_bin = dec2bin(x, 8); 
            
            % Replace the last bit of the binary representation of the pixel value with
            x_bin(end) = binary_message(i);
 
            x_dec = bin2dec(x_bin);
            encoded_image(i) = x_dec;
        end
        figure;
        plot1= subplot(1, 2, 1);
        imshow(image);
        title('Original Photo');
        
        plot2=  subplot(1, 2, 2);
        imshow(encoded_image);
        title('Encoded Photo');
        linkaxes([plot1 plot2])
    end
    imwrite(encoded_image, 'encoded_image.jpg');
end
