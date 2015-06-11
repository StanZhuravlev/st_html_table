module StHtmlTable
  class Cell
    attr_accessor :text
    attr_reader :row
    attr_reader :table
    attr_accessor :is_header
    attr_accessor :cols
    attr_accessor :col_id
    attr_accessor :row_id
    attr_accessor :bold
    attr_accessor :italic
    attr_accessor :align
    attr_accessor :valign
    attr_accessor :type

    def initialize(table, row)
      @text = '&nbsp;'
      @row = row
      @table = table
      @is_header = false
      @cols = 1
      @col_id = 0
      @row_id = 0
      @type = :neutral
      @valign = :top

      @bold = false
      @italic = false
      @align = :left

      @ident = 6
    end

    def prefix=(value)
      @prefix = value
    end

    def suffix=(value)
      @suffix = value
    end

    def to_s
      @text.gsub(%r{</?[^>]+?>}, '')
    end

    def to_html
      type = @is_header ? 'th' : 'td'

      out = Array.new
      out << (' ' * @ident) + build_cell_arguments(type)
      out << (' ' * (@ident + 2)) + @text.to_s
      out << (' ' * @ident) + "</#{type}>"
      out.join("\n")
    end

    private


    def build_cell_arguments(type)
      out = Array.new
      style = Array.new

      style << "font-weight:bold;" if @bold
      style << "font-style:italic;" if @italic
      style << "border: 1px solid #eaeaea;"

      out << "align=#{@align.to_s.inspect}"
      out << "valign=#{@valign.to_s.inspect}" if @valign != :top
      out << "style='#{style.join}'" unless style.empty?
      out << "cols=\"#{@cols}\"" if @cols != 1
      "<#{type} " + out.join(' ') + ">"
    end


  end
end