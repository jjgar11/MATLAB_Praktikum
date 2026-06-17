classdef sender
    properties(Access = private) 
        pKanal
        pRepetition
    end
    
    methods
        function obj = sender(kanalObject, repetition)
            obj.pKanal = kanalObject;
            obj.pRepetition = repetition;
        end

        function sendeBitvektor(obj, bitvector)
            % Repeats every bit pRepetition(3) times
            encoded_data = repelem(bitvector, obj.pRepetition);
            obj.pKanal.sendeAnEmpfaenger(encoded_data);
        end
    end
end
