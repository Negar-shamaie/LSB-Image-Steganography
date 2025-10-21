function decoded_message = decoding(encoded_image, mapset,block_section)
    decoded_message_bin = '';
    flag = true;
    ind = 1;
    
    while flag
        character_bin = zeros(1,block_section);
        % Extract 5 bits from the encoded image
        for cont = 1:block_section
            vals = encoded_image(ind);
            vals_bin = dec2bin(vals, 8);
            character_bin(cont) = str2double(vals_bin(end));
            ind = ind + 1;        
        end
        % Convert binary to decimal
        num = sum(character_bin .* (2 .^ (4:-1:0))) + 1;
 
        if strcmp(mapset{1,num}, ' ')
            flag = false;
        else
            decoded_message_bin = strcat(decoded_message_bin, mapset{1,num});
        end
    end
    decoded_message = decoded_message_bin;
    fprintf('the message is : %s ',decoded_message);
end
