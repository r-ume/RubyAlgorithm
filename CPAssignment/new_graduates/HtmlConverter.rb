require 'yaml'
require 'nokogiri'

class Structure
  attr_accessor :text

  def initialize(yml)
    @structure = YAML.load_file(yml)
  end

  def create_text
    structure_text = Nokogiri::HTML::DocumentFragment.parse('')
    Nokogiri::HTML::Builder.with(structure_text){ |doc|
      doc.h1 '目次'
      doc.ul{
        create_indexes.each do |key, value|
          doc.li{ doc.a value, href: "##{key}" }
        end
      }
    }
    structure_text
  end

  private
  def create_indexes
    indexes = {}
    @structure.each_key do |key|
      if @structure[key].include?('title')
        indexes[key] = @structure[key]['title']
      end
    end
    filter = %w[what_you_want_to_achieve_in_cookpad enthusiasm_for_engineering other_appeal_points]
    indexes.merge(@structure.select{ |key| filter.include? key })
  end
end

class Portfolio
  attr_accessor :text

  def initialize(structure, portfolio)
    @structure = YAML.load_file(structure)
    @portfolio = YAML.load_file(portfolio)
    @whole_yml = []
    @whole_yml << @structure
    @whole_yml << @portfolio
  end

  def create_text
    portfolio_text = Nokogiri::HTML::DocumentFragment.parse("")
    Nokogiri::HTML::Builder.with(portfolio_text){|doc|
      doc.title @portfolio['name']
      doc.h1 @portfolio['name'], id: 'name'

      resume = recursive_find(doc, @whole_yml, 'resume')
      parse_hash(doc, resume, 'title', 'resume')
      find_and_parse(doc, resume, 'backgrounds')

      find_and_parse(doc, @whole_yml, 'title', 'social_accounts')

      engineering = recursive_find(doc, @whole_yml, 'engineering')
      parse_hash(doc, engineering, 'title', 'engineering')
      find_and_parse(doc, engineering, 'why_start_programming')
      find_and_parse(doc, engineering, 'interesting_points')
      find_and_parse(doc, engineering, 'elements')
      find_and_parse(doc, engineering, 'favorite_language')
      find_and_parse(doc, engineering, 'pr')

      find_and_parse(doc, @whole_yml, 'title', 'parttime_experiences')
      find_and_parse(doc, @whole_yml, 'title', 'internship_experiences')

      find_and_parse(doc, @whole_yml, 'what_you_want_to_achieve_in_cookpad')
      find_and_parse(doc, @whole_yml, 'enthusiasm_for_engineering')
      find_and_parse(doc, @whole_yml, 'other_appeal_points')
    }

    portfolio_text
  end

  private
  def find_and_parse(doc, obj, special=nil, key)
    arr = recursive_find(doc, obj, key)
    parse_hash(doc, arr, special, key) if special == "title"
    parse_hash(doc, arr, key)
  end

  def recursive_find(doc, element, key)
    target_elements = []
    case element
      when Hash
        target_elements << element[key] if element.key?(key)
        target_elements += element.values.map{ |e| recursive_find(doc, e, key) }
      when Array
        target_elements += element.map{ |e| recursive_find(doc, e, key) }
    end
    target_elements.flatten
  end

  def parse_hash(doc, obj, key, id=nil)
    h1_filters = %w[title what_you_want_to_achieve_in_cookpad enthusiasm_for_engineering other_appeal_points]
    # h1タグで囲む要素を先に処理
    if h1_filters.include?(key)
      first_obj = obj.first
      last_obj = obj.last
      if first_obj[key] == nil
        doc.h1 first_obj, id: key
        doc.ul { doc.li last_obj }
      else
        doc.h1 first_obj[key], id: id
      end
    # 引数のオブジェクトが配列だったら
    elsif obj.kind_of?(Array)
      # 配列の中身が多重配列じゃないとき(配列の最初の要素が文字列だった場合)
      if obj.first.class.name == "String"
        doc.p obj.first
        doc.ul { doc.li "#{obj.last}" }
      else
        keys = obj.first.keys
        # obj[0]は、structureに書かれてあるvalue
        obj[1..-1].each do |arr|
          arr.each do |k, v|
            if keys.include?(k)
              # key同士を合わせるため
              if k == arr.keys.first
                doc.p "#{obj[0][k]}: #{v}"
              else
                doc.ul { doc.li "#{obj[0][k]}: #{v}" }
              end
            end
          end
        end
      end
    end
  end
end

class HtmlConverter
  def initialize(structure, portfolio)
    @structure = structure
    @portfolio = portfolio
  end

  def convert
    file_name = 'portfolio.html'

    File.open(file_name, 'w', :encoding => 'SJIS') do |file|
      file.puts @structure.text
      file.puts @portfolio.text
    end
  end
end

st = Structure.new('structure.yml')
st.text = st.create_text
pr = Portfolio.new('structure.yml', 'portfolio.yml')
pr.text = pr.create_text
converter = HtmlConverter.new(st, pr)
converter.convert