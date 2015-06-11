require 'rspec'
require 'st_html_table'


describe 'Проверка методов StHtmlTable::Cell.*' do

  it 'Test 1' do
    table = ::StHtmlTable::Table.new
    table.create({id: 'id', url: 'URL', views: 'Views' }, padding: 3)

    row = table.get_row(0)
    row.type = :success
    row.add(:id, 0, align: :right)
    row.add(:url, "http://st-html-table.ru", align: :left, italic: true)
    row.add(:views, 456, align: :center)

    row = table.get_row(100)
    row.type = :fail
    row.add(:id, 100, align: :right)
    row.add(:url, "http://big-url-of-st-html-table.ru", align: :left, italic: true)
    row.add(:views, 6374637, align: :center)

    row = table.get_row(200)
    row.type = :neutral
    row.add(:id, 200, align: :right)
    row.add(:url, "http://big-st-html-table-200.ru", align: :left, italic: true)
    row.add(:views, 63645, align: :center)

    row = table.get_row(300)
    row.type = :warn
    row.add(:id, 300, align: :right)
    row.add(:url, "http://big-st-html-table-300.ru", align: :left, italic: true)
    row.add(:views, 343, align: :center)


    puts table.to_html
  end

end
