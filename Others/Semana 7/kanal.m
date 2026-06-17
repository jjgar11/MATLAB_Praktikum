classdef kanal<handle
    properties(Access = private) 
        pDelta
        pEmpfaenger
    end
    
    methods
        function obj = kanal(delta,empfaengerObject)
            obj.pDelta = delta;
            obj.pEmpfaenger=empfaengerObject;
        end
        
        function sendeAnEmpfaenger(obj,bitvector)
            noise=rand(size(bitvector))<obj.pDelta;
            obj.pEmpfaenger.empfangeDaten(mod(bitvector+noise,2));
        end
    end
end