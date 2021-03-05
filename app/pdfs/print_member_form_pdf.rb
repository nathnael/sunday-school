require 'prawn/table'
class PrintMemberFormPdf < PdfReport
    def initialize(member, home_address, work_address, emergency_contact, emergency_contact_address)
        super(top_margin: 50)
        @member = member
        @home_address = home_address
        @work_address = work_address
        @emergency_contact = emergency_contact
        @emergency_contact_address = emergency_contact_address
        font Rails.root.join("app/assets/fonts/gfzemenu.ttf")
        header  
        body
        footer
    end
    
    def body
        grid([2, 0], [2, 2]).bounding_box do
            move_down 5
            text "\"እርሱ እግዚአብሔር ነው ድስ ያሰኘውን ያድርግ\"", :size => 8, :align => :center
        end
        grid([2, 1], [2, 1]).bounding_box do
            move_down 15
            text "1ኛ ሳሙ. 3 ፣ 18", :size => 8, :align => :right
        end
        grid([2, 4], [2, 4]).bounding_box do
            move_down 5
            text "ቁጥር", :size => 8, :align => :right
            text "Ref. No", :size => 8, :align => :right
            text "ቀን", :size => 8, :align => :right
            text "Date", :size => 8, :align => :right
        end
        grid([2, 5], [2, 5]).bounding_box do
            move_down 8
            text "________________", :size => 8, :align => :left
            move_down 8
            text "________________", :size => 8, :align => :left
        end        
        grid([3, 5], [5, 6]).bounding_box do
            image "#{Rails.root}/public/uploads/#{@member.profile_picture_url}", height: 120, position: 15, vposition: 0
        end
        grid([4, 3], [4, 3]).bounding_box do
            text "የአባልነት ቅጽ", :size => 14, :align => :left, valign: :bottom
        end
        grid([5, 0], [5, 1]).bounding_box do
            move_down 20
            text "የሰንበት ትምህርት ቤቱ ዓላማ", :size => 12, :align => :left
        end
        grid([5, 0], [6, 6]).bounding_box do
            move_down 40
            text "ሀ. የኢትዮጵያ ኦርቶዶክስ ተዋህዶ ቤተ ክርስቲያን አምነትና ሥርዓትን ወጣቶች ጠብቀው በአባቶችና በእናቶች እግር ተተክተው ቤተ ክርስቲያንን እንዲረከቡ ማድረግ /መዝ 44፣16/", :size => 10, :align => :left
        end
        grid([6, 0], [7, 6]).bounding_box do
            move_down 30
            text "ለ. በሥርዓተ አበውና በቅዱሳት መጻሕፍት እንደታዘዘው ልጆች ለእናቶች ለአባቶች እንዲሁም በጠቅላላ ለሰው ልጆች ሁሉ ተገቢውን አክብሮት እንዲያሳዩ ለማድረግና በተጨማሪ የፊደላት ቅርጽና መልክ ያልለዩ ሕጻናትም ሆኑ ጎልማሶች፣ አባቶችና እናቶች ማንበብና መጻፍ እንዲችሉ አመቺ ጊዜና መንገድ እየፈለገ በትምህርት መርዳት", :size => 10, :align => :left
        end
        grid([7, 0], [8, 6]).bounding_box do
            move_down 35
            text "የአባሉ/ሏ/ ሙሉ ስም <u>#{@member.full_name_am}</u>  ጾታ <u>#{@member.gender_am}</u>  የትውልድ ዘመን <u>#{@member.dob}</u>  የትምህርት ደረጃ  <u>#{@member.educational_level}</u>  ሥራ  <u>#{@member.work}</u>  ስመ ክርስትና  <u>#{@member.christian_name_am}</u>  ሰ/ት/ቤት አባል የሆነበት/ችበት/ ቀን  <u>#{@member.membership_date.to_date}</u>", inline_format: true, :size => 10, :align => :left
        end
        grid([9, 0], [9, 1]).bounding_box do
            text "የአባሉ/ሏ/ ሙሉ አድራሻ", :size => 12, :align => :left
        end
        grid([9, 0], [9, 6]).bounding_box do
            move_down 20
            text "ክፍለ ከተማ <u>#{@home_address.sub_city}</u>  ወረዳ <u>#{@home_address.woreda}</u>  የቤት ቁጥር <u>#{@home_address.house_no}</u>  የቤት ስልክ ቁጥር <u>#{@home_address.home_phone}</u> የመ.ሳ.ቁ <u>#{@home_address.postal_code}</u> የሞባይል ስልክ ቁጥር <u>#{@home_address.mobile_phone}</u>", inline_format: true, :size => 10, :align => :left
        end
        grid([10, 0], [10, 1]).bounding_box do
            text "የመስሪያ ቤቱ/ቷ/ አድራሻ", :size => 12, :align => :left, valign: :center
        end
        grid([11, 0], [11, 6]).bounding_box do
            move_down 0
            text "ክፍለ ከተማ <u>#{@work_address.mobile_phone}</u>  ወረዳ <u>#{@work_address.woreda}</u>  የቤት ቁጥር <u>#{@work_address.house_no}</u>  የቤት ስልክ ቁጥር <u>#{@work_address.home_phone}</u> የመ.ሳ.ቁ <u>#{@work_address.postal_code}</u> የሞባይል ስልክ ቁጥር <u>#{@work_address.mobile_phone}</u>", inline_format: true, :size => 10, :align => :left
        end
        grid([12, 0], [12, 1]).bounding_box do
            text "ልዩ ተሰጥዖ", :size => 12, :align => :left
        end
        grid([12, 0], [13, 6]).bounding_box do
            move_down 20
            text "<u>#{@member.talent}</u>__________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________", inline_format: true, :size => 10, :align => :left
        end

        start_new_page

        grid([2, 0], [2, 6]).bounding_box do
            move_down 20
            text "እኔ <u>#{@member.full_name_am}</u> \"በጉብዝናህ ወራት ፈጣሪህን አስብ\" መክ 12፣1 የሚለውን የእግዚአብሔርን ቃል መሠረት በማድረግ በዚህች በኦርቶዶክስ ተዋህዶ ቤተ ክርስቲያን ሥር ባለች ሰንበት ት/ቤት፣", inline_format: true, :size => 10, :align => :left
        end
        grid([3, 0], [3, 6]).bounding_box do
            move_down 20
            text "1. የእግዚአብሔርን ቃል ለመማር", :size => 10, :align => :left, indent_paragraphs: 15
            text "2. እግዚአብሔር በሰጠኝ ጸጋ ስጦታ መጠን ለማገልገል ወድጀ በፈቃደኛነት ተመዝግቤአለሁ", :size => 10, :align => :left, indent_paragraphs: 15
        end
        grid([4, 0], [4, 1]).bounding_box do
            text "አባሉ ተጠሪ", :size => 12, :align => :left, valign: :center
        end
        grid([4, 0], [5, 6]).bounding_box do
            move_down 35
            text "#{@emergency_contact.relation_am}", inline_format: true, :size => 10, :align => :left, indent_paragraphs: 15
        end
        grid([5, 0], [5, 1]).bounding_box do
            text "የተጠሪው አድራሻ", :size => 12, :align => :left, valign: :center
        end
        grid([5, 0], [6, 6]).bounding_box do
            move_down 35
            text "ሙሉ ስም <u>#{@emergency_contact.full_name}</u>  ክፍለ ከተማ <u>#{@emergency_contact_address.sub_city}</u>  ወረዳ <u>#{@emergency_contact_address.woreda}</u>  የቤት ቁጥር <u>#{@emergency_contact_address.house_no}</u>  የቤት ስልክ ቁጥር <u>#{@emergency_contact_address.home_phone}</u>", inline_format: true, :size => 10, :align => :left, indent_paragraphs: 15
            text "የሞባይል ስልክ ቁጥር <u>#{@emergency_contact_address.mobile_phone}</u>  የመ.ሳ.ቁ <u>#{@emergency_contact_address.postal_code}</u>  ኢ-ሜል <u>#{@emergency_contact_address.email}</u>", inline_format: true, :size => 10, :align => :left, indent_paragraphs: 15
        end
        grid([7, 0], [7, 1]).bounding_box do
            text "የቅርብ ተጠሪ", :size => 12, :align => :left, valign: :top
        end
        grid([7, 0], [8, 6]).bounding_box do
            move_down 25
            text "እኔ <u>#{@emergency_contact.full_name}</u> \"አባቶች ሆይ ልጆቻችን በጌታ ምክርና በተግሣጽ አሳድጉዋቸው እንጂ አታስቆጧቸው\" ኤፌ 6፣4  በሚለው", inline_format: true, indent_paragraphs: 15 
            text "የእግዚአብሔር ቃል መሠረት ልጀ <u>#{@member.full_name_am}</u> በቤተክርስቲያን እምነትና ሥርዓት ታንጾ/ጻ እንዲያድግ/እንድታድግ/ ", inline_format: true, indent_paragraphs: 15 
            text "በዚሁ ሰንበት ት/ቤት በአባልነት እንዲመዘገብ/እንድትመዘገብ/ ፈቅጃለሁ፡፡", :size => 10, :align => :left, indent_paragraphs: 15
        end
        grid([8, 3], [8, 6]).bounding_box do
            move_down 15
            text "የተጠሪ ፊርማ ____________________________", :size => 10, :align => :right, valign: :center
        end
        grid([9, 0], [9, 1]).bounding_box do
            text "የሰንበት ት/ቤቱ መርሃ-ግብር", :size => 12, :align => :left, valign: :top
        end
        grid([9, 0], [10, 6]).bounding_box do
            move_down 15
            text "ዓርብ ከ __________________ እስከ __________________ ሰዓት", :size => 10, :align => :left, indent_paragraphs: 15
            text "ቅዳሜ ከ __________________ እስከ __________________ ሰዓት", :size => 10, :align => :left, indent_paragraphs: 15
            text "እሁድ ከ __________________ እስከ __________________ ሰዓት", :size => 10, :align => :left, indent_paragraphs: 15
        end
        grid([10, 0], [10, 1]).bounding_box do
            move_down 20
            text "የሰንበት ት/ቤቱ መርሃ-ግብር", :size => 12, :align => :left, valign: :top
        end
        grid([10, 0], [11, 6]).bounding_box do
            move_down 40
            text "#{@member.departments_am}", :size => 10, :align => :left, indent_paragraphs: 15
        end        
        grid([12, 0], [12, 6]).bounding_box do
            text "ልዩ መግለጫ፡- ይህ ከላይ የተገለጸው የሰ/ት/ቤቱ መርሃ-ግብር እንደጊዜው ሁኔታ ሊረዝም ሊያጥር ሌሎች ቀኖችን ሊጨምር ይችላል /ቅጹን የሚያስሞላቸው ክፍል ተጨማሪ ማብራሪያ ይሰጣል፡፡/", :size => 10, :align => :left, valign: :top
        end
        grid([13, 0], [14, 6]).bounding_box do
            text "ቅጹን ያስሞላቸው ተወካይ ሙሉ ስም ___________________________________  ፊርማ ___________________", :size => 10, :align => :left, valign: :top
            text "የሰ/ት/ቤቱ ሊቀመንበር ሙሉ ስም _____________________________________  ፊርማ ___________________", :size => 10, :align => :left, valign: :top
            text "የደብሩ አስተዳዳሪ ሙሉ ስም _________________________________________  ፊርማ ___________________", :size => 10, :align => :left, valign: :top
        end
        grid([14, 4], [14, 6]).bounding_box do
            text "ቅጹ የተሞላበት ቀን ________________________", :size => 10, :align => :left, valign: :top
        end

    end
end
