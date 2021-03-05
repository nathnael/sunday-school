class EmergencyContact < ApplicationRecord
    has_one :address

    def relation_am
        case relation
        when "Father"
          "አባት [X]   እናት [ ]   አሳዳጊ [ ]   እህት [ ]   ወንድም [ ]" 
        when "Mother"
          "አባት [ ]   እናት [X]   አሳዳጊ [ ]   እህት [ ]   ወንድም [ ]"
        when "Sister"
          "አባት [ ]   እናት [ ]   አሳዳጊ [ ]   እህት [X]   ወንድም [ ]" 
        when "Brother"
          "አባት [ ]   እናት [ ]   አሳዳጊ [ ]   እህት [ ]   ወንድም [X]"
        when "Caretaker"
          "አባት [ ]   እናት [ ]   አሳዳጊ [X]   እህት [ ]   ወንድም [ ]" 
        else
          "አባት [ ]   እናት [ ]   አሳዳጊ [X]   እህት [ ]   ወንድም [ ]"
        end
    end
end
