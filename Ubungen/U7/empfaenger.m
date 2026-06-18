classdef empfaenger < handle
    properties (GetAccess = private)
        pBuffer
    end
    properties
        pRepetition
    end

    methods
        function obj = empfaenger(repetition)
            obj.pBuffer = [];
            obj.pRepetition = repetition;
        end

        function empfangeDaten(obj, bitvector)
            obj.pBuffer = [obj.pBuffer, bitvector];
        end

        function vector = ausBufferNehmen(obj)
            raw_data = obj.pBuffer;

            % Repetition code: Groups into sets of pRepetition(3) bits and
            % returns the most frequently received bit
            raw_data = reshape(raw_data, obj.pRepetition, []);
            vector = logical(round(mean(raw_data, 1)));
            obj.pBuffer = [];
        end
    end
end