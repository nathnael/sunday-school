module SubcityTranslated
    def subcityToAmharic(subcity)
      SubcityTranslated.subcityToAmharic(subcity)
    end

    def self.subcityToAmharic(subcity)
      case subcity
      when "Addis Ketema"
        "አዲስ ከተማ" 
      when "Akaki Kality"
        "አቃቂ ቃሊቲ"
      when "Arada"
        "አራዳ" 
      when "Bole"
        "ቦሌ"
      when "Gulele"
        "ጉለሌ" 
      when "Kirkos"
        "ቂርቆስ"
      when "Kolfe-Keraniyo"
        "ኮልፌ ቀራኒዮ" 
      when "Lideta"
        "ልደታ"
      when "Nifas Selk"
        "ንፋስ ስልክ" 
      when "Yeka"
        "የካ"
      else
        "ቦሌ"
      end
    end
end