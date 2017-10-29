class Payroll

  def update(changed_employee)
    p "#{changed_employee.name}の給料が、#{changed_employee.salary}上がりました。"
    p "経理部門は#{changed_employee.name}に小切手を切ります！"
  end
end
