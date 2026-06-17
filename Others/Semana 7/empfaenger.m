classdef empfaenger < handle
    properties (Access = private)
        Buffer
    end
    
    methods
        function obj = empfaenger()
            obj.Buffer = [];
        end
        
        function empfangeDaten(obj, bitvector)
            obj.Buffer = [obj.Buffer, bitvector];
        end
        
        function decodedData = ausBufferNehmen(obj)
            % Extraer los datos y limpiar el buffer
            rawData = obj.Buffer;
            obj.Buffer = [];
            
            % Implementación del código de repetición (Tarea 5)
            % Agrupar en columnas de 3 para realizar la suma de comprobación
            reshapedData = reshape(rawData, 3, []);
            
            % Si la suma de la columna es >= 2, el bit más frecuente es 1. De lo contrario, es 0.
            decodedData = sum(reshapedData, 1) >= 2;
        end
    end
end