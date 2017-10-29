class Taxman
  def update(changed_employee)
    puts "#{changed_employee.name}の給料が#{changed_employee.salary}ドルに上がりました!"
    puts "税務署員は#{changed_employee.name}に新しい税金請求書を送ります！"
  end
end
