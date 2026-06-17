classdef sender < handle
    properties (Access = private)
        Kanal_obj
    end
    
    methods
        function obj = sender(kanal_in)
            obj.Kanal_obj = kanal_in;
        end
        
        function sendeBitvektor(obj, bitvector)
            % Implementación del código de repetición (Tarea 5)
            % Repetir cada bit tres veces usando notación matricial/vectorial
            encodedData = repelem(bitvector, 3);
            
            % Enviar el vector modificado al canal
            obj.Kanal_obj.sendeAnEmpfaenger(encodedData);
        end
    end
end