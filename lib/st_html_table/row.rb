module StHtmlTable
  class Row

    def initialize(table) # :nodoc:
      @table = table
      @cells = Hash.new
      @id = :none
      @type = :neutral

      @ident = 4
    end

    # Метод позволяет установить для строки таблицы один из следующих стилей: [:neutral, :fail, :success, :warn]
    #
    # @param [Sym] value тип строки. При изменении типа строки, все ячейи строки таблицы получат эти же значения
    # @return [None] нет
    def type=(value)
      types = [:neutral, :fail, :success, :warn]
      raise "Ошибка: тип строки должен быть одним из: #{types.inspect}" unless types.include?(value.to_sym)
      @type = value.to_sym
      @cells.each { |id, cell| cell.type = @type }
    end

    # Метод добавляет или изменяет ячейку таблицы, устанавливая ее соедержание, выравнивание, стиль оформления
    #
    # @param [Object] col_id идентифкатор столбца таблицы
    # @param [Object] text содержание ячейки
    # @param [Object] align выравнивание [:left, :center, :right]
    # @param [Object] bold жирное начертание
    # @param [Object] italic наклонное начертание
    # @return [StHtmlTable::Cell] измененная ячейка
    def add(col_id, text, align: :left, bold: false, italic: false)
      add_cell(col_id, text, align, bold, italic)
    end

    def get_cell(col_id)
      @cells[col_id]
    end

    def row_keys
      @cells.keys
    end

    def add_header(header)
      header.each do |id, name|
        cell = ::StHtmlTable::Cell.new(@table, self)
        cell.col_id = id.to_sym
        cell.row_id = self.id
        cell.is_header = true
        cell.text = name
        cell.align = :center
        cell.bold = true

        @cells[id.to_sym] = cell
      end
    end

    def to_html
      out = Array.new
      out << (' ' * @ident) + "<tr #{build_color_scheme}>"
      @cells.each do |id, cell|
        out << cell.to_html
      end
      out << (' ' * @ident) + "</tr>"
      out.join("\n")
    end

    def id=(id)
      @id = id
    end

    def id
      @id
    end

    def init_row # :nodoc:
      keys = @table.row_keys
      keys.each do |id|
        cell = ::StHtmlTable::Cell.new(@table, self)
        cell.col_id = id.to_sym
        cell.row_id = self.id
        cell.type = @type

        @cells[id.to_sym] = cell
      end
    end


    private



    def build_color_scheme # :nodoc:
      if @cells.values.first.is_header
        return "style=\"color:#ffffff;background:#389bb9;\" valign=\"center\""
      end

      case @type
        when :warn
          return "bgcolor=\"efe685\""
        when :success
          return "bgcolor=\"#c4d7be\""
        when :fail
          return "bgcolor=\"#efbcbe\""
        else
          return "bgcolor=\"#e6e6e6\""
      end
    end

    def add_cell(col_id, text, align, bold, italic) # :nodoc:
      cell = get_cell(col_id)
      raise "Ошибка: не найдена ячейка HTML-таблицы (#{col_id.inspect}, #{self.id.inspect})" if cell.nil?

      cell.text = text
      cell.align = align
      cell.bold = bold
      cell.italic = italic

      cell
    end


  end
end
