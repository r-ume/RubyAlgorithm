# Observer Design Pattern
# ニュースの発信者と受信者の間の依存関係を排除する。

# Subject
# あるニュースを配信するクラス
# Observer
# あるニュースを得ることに関心があるクラス

# 変わるもの（オブザーバー）と変わらないもの（サブジェクト）を分離して、変化に強い構造へ

require 'rubygems'
require 'pry'
require './employee.rb'
require './payroll.rb'
require './taxman.rb'
require './subject.rb'

john = Employee.new('john', 'worker', 100)
john.add_observer(Payroll.new)
john.add_observer(Taxman.new)
john.salary = 200
