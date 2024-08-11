package com.employeemanagement;

import com.employeemanagement.model.Employee;
import com.employeemanagement.model.Department;
import com.employeemanagement.repository.EmployeeRepository;
import com.employeemanagement.repository.DepartmentRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.data.domain.PageRequest;

import static org.assertj.core.api.Assertions.assertThat;

import java.time.LocalDateTime;

@DataJpaTest
public class EmployeeRepositoryTests {

    @Autowired
    private EmployeeRepository employeeRepository;

    @Autowired
    private DepartmentRepository departmentRepository;

    @Test
    public void testAuditing() {
        Department department = new Department();
        department.setName("HR");
        departmentRepository.save(department);

        Employee employee = new Employee();
        employee.setName("Sanskruti Sharma");
        employee.setEmail("sans.sharma@gmail.com");
        employee.setDepartment(department);
        employeeRepository.save(employee);

        assertThat(employee.getCreatedDate()).isNotNull();
        assertThat(employee.getLastModifiedDate()).isNotNull();

        LocalDateTime createdDate = employee.getCreatedDate();
        LocalDateTime lastModifiedDate = employee.getLastModifiedDate();

        
        employee.setName("Sanskruti Sharma Updated");
        employeeRepository.save(employee);

        assertThat(employee.getLastModifiedDate()).isAfter(lastModifiedDate);
    }
}
