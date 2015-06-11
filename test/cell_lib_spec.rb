require 'rspec'
require 'st_html_table'


describe 'Проверка методов StHtmlTable::Cell.*' do

  it 'Test 1' do
    cell = ::StHtmlTable::Cell.new(nil, nil)
    cell.text = 'Content'
    expect(cell.to_s).to eq 'Content'
    expect(cell.to_html).to include 'Content'
    expect(cell.to_html).to include '<td'
    expect(cell.to_html).to include '/td>'
    expect(cell.to_html).to_not include 'cols'
    puts cell.to_html
  end

  it 'Test 2' do
    cell = ::StHtmlTable::Cell.new(nil, nil)
    cell.text = 'Content'
    cell.cols = 2
    expect(cell.to_s).to eq 'Content'
    expect(cell.to_html).to include 'Content'
    expect(cell.to_html).to include '<td'
    expect(cell.to_html).to include 'cols'
    expect(cell.to_html).to include '/td>'
    puts cell.to_html
  end

  it 'Test 3' do
    cell = ::StHtmlTable::Cell.new(nil, nil)
    cell.text = 'Content'
    cell.cols = 2
    cell.td_style = 'class="cell_class_name"'
    expect(cell.to_s).to eq 'Content'
    expect(cell.to_html).to include 'Content'
    expect(cell.to_html).to include '<td'
    expect(cell.to_html).to include 'cols'
    expect(cell.to_html).to include 'class'
    expect(cell.to_html).to include '/td>'
    puts cell.to_html
  end

  it 'Test 4' do
    cell = ::StHtmlTable::Cell.new(nil, nil)
    cell.text = 'Content <b>bold</b>'
    cell.cols = 2
    cell.td_style = 'class="cell_class_name"'
    expect(cell.to_s).to eq 'Content bold'
    expect(cell.to_html).to include 'Content <b>bold</b>'
    expect(cell.to_html).to include '<td'
    expect(cell.to_html).to include 'cols'
    expect(cell.to_html).to include 'class'
    expect(cell.to_html).to include '/td>'
    puts cell.to_html
  end

end
