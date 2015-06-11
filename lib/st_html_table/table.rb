module StHtmlTable
  class Table

    def initialize # :nodoc:
      init_table
    end

    # Метод создает таблицу с строкой-заголовком. Данный метод должен быть вызван первым, поскольку
    # именно он определяет число столбцов в будущей таблице
    #
    # @param [Hash] header хеш вида column id => title of column
    # @param [Integer] padding аналог cellpadding тега <table>
    # @param [Integer] width ширина таблицы в процентах
    # @return [None] нет
    def create(header, padding: 5, width: 0)
      init_table
      @padding = padding
      @width = width
      init_header(header)
    end

    # Метод возвращает все идентифкаторы столбцов таблицы
    #
    # @return [Array] массив идентификаторов столбцов таблицы
    def row_keys
      @header.row_keys
    end

    # Метод возвращает ряд таблицы по идентификатору ряда. Если ряд с таким id отсуствует - он будет создан
    #
    # @param [Object] id идентфикатор строки
    # @return [StHtmlTable::Row] класс со строкой (<tr>) таблицы
    def get_row(id)
      init_row(id) if @rows[id].nil?
      @rows[id]
    end

    # Метод переводит таблицы в форматированный HTML
    #
    # @return [String] таблица в формате HTML
    def to_html
      out = Array.new
      out << build_table_row
      out << build_header_row
      @rows.each do |row_id, row|
        out << row.to_html
      end
      out << "</table>"
      out.join("\n")
    end



    private



    def init_header(header) # :nodoc:
      @header = ::StHtmlTable::Row.new(self)
      @header.id = :html_table_header
      @header.add_header(header)
    end

    def build_header_row # :nodoc:
      @header.to_html
    end

    def build_table_row # :nodoc:
      out = Array.new
      out << "table"
      out << "cellpadding=\"#{@padding}px\""
      out << "cellspacing=\"0\""
      out << "style=\"border: 1px solid #eaeaea; border-collapse:collapse;\""
      out << "width=\"#{@width}%\"" unless @width == 0
      "<" + out.join(' ') + ">"
    end

    def init_row(row_id) # :nodoc:
      @rows[row_id] = ::StHtmlTable::Row.new(self)
      @rows[row_id].init_row
    end

    def init_table # :nodoc:
      @rows = Hash.new
      @header = Hash.new
    end

  end
end
