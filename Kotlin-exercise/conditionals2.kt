fun main() {
    val hoursWorked = 45
    val hourlyRate = 20
    val overtimeRate = 1.5

    val regularHours = if (hoursWorked > 40) 40 else hoursWorked
    val overtimeHours = if (hoursWorked > 40) hoursWorked - 40 else 0
    val totalSalary = (regularHours * hourlyRate) + (overtimeHours * hourlyRate * overtimeRate)

    println("Total Salary: $$totalSalary")
}
