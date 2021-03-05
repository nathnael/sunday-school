class PdfReport < Prawn::Document  
    TABLE_ROW_COLORS = ["FFFFFF","DDDDDD"]
    TABLE_FONT_SIZE = 9
    TABLE_BORDER_STYLE = :grid
  
    def initialize(default_prawn_options={})
        super(default_prawn_options)        
        font_size 9
    end
  
    def header(title=nil, text_am=nil)
       repeat :all do
            define_grid(columns: 7, rows: 15)
            # grid.show_all
            y_position = cursor
            grid([0, 0], [0, 6]).bounding_box do
                text "በስመ አብ ወወልድ ወመንፈስ ቅዱስ አሐዱ አምላክ አሜን", size: 20, align: :center, valign: :top
                text "IN THE NAME OF THE FATHER, OF THE SON, OF THE HOLY SPIRIT ONE GOD, AMEN", align: :center, valign: :center
            end
            grid([1, 0], [1, 2]).bounding_box do
                text "በኢትዮጵያ ኦርቶዶክስ ተዋህዶ ቤተክርስቲያን", align: :center
                text "የቦሌ ደብረ ምህረት ቅዱስ ሚካኤልና", align: :center
                text "የጻድቁ አቡነ ጎርጎርዮስ ቤተክርስቲያን", align: :center
                text "ተስፋ እየሩሳሌም ሰንበት ት/ቤት", align: :center
            end
            grid([1, 3], [1, 3]).bounding_box do
                image "#{Rails.root}/public/assets/sabbath.png", height: 45, align: :center
            end
            grid([1, 4], [1, 6]).bounding_box do
                text "ETHIOPIAN ORTHODOX TEWAHDO CHURCH", align: :center
                text "BOLE DEBRE MIHRET ST. MICHAEL AND", align: :center
                text "THE ST. ABUNE GORGORIOS CHURCH", align: :center
                text "TESFA JERUSALEM SUNDAY SCHOOL.", align: :center
            end

            stroke_horizontal_rule 
            if title
            move_down 10
                # text title, :inline_format => true, size: 14, style: :bold_italic, align: :center
            end
            move_down 10
        end
    end
    
    def footer(title=nil)
        repeat :all do
            grid([14, 0], [14, 6]).bounding_box do
                move_down 20
                stroke_horizontal_rule
            end
            grid([14, 0], [14, 0]).bounding_box do
                move_down 25
                text "ስልክ", :size => 8, :align => :right
                text "Tel.", :size => 8, :align => :right
            end
            grid([14, 1], [14, 1]).bounding_box do
                move_down 30
                text "011-6-26 23 91", :size => 8, :align => :left, indent_paragraphs: 5
            end
            grid([14, 2], [14, 2]).bounding_box do
                move_down 25
                text "የፖ.ሣ.ቁ.", :size => 8, :align => :right
                text "P.O.Box", :size => 8, :align => :right
            end
            grid([14, 3], [14, 3]).bounding_box do
                move_down 30
                text "918/1110", :size => 8, :align => :left, indent_paragraphs: 5
            end
            grid([14, 5], [14, 6]).bounding_box do
                move_down 23
                text "አዲስ አበባ ኢትዮጵያ", :size => 10, :align => :left
                text "Addis Ababa Ethiopia", :size => 8, :align => :left
            end
        end
        
    end
  end
