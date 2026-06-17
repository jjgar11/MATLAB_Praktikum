classdef ImageProcessing

    methods (Static)

        % static function to add motion blur to images
        function [B] = unschaerfe(A, N)
            mask = ones(1, N) ./ N;     % Create mask
            B = conv2(A, mask, 'same'); % Apply blur
        end

        % static and public function that calculates the magnitude 
        % of derivate, using eanderung static private function
        function [C] = edges(A)
            B = ImageProcessing.eanderung(A);
            C = sqrt(abs(B(:,:,1)).^2 + abs(B(:,:,2)).^2);
        end

        % static and public function threshold
        function [B] = threshold(A, mu)
            B = double(A > mu);
        end

    end

    methods (Static, Access=private)

        % Static private function that calculate the gradients 
        % of an image
        function [B] = eanderung(A) 
            B(:,:,1) = A(2:end, 1:end-1) - A(1:end-1, 2:end);
            B(:,:,2) = A(2:end, 2:end) - A(1:end-1, 1:end-1);
        end

    end

end


