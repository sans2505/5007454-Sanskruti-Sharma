package com.employeemanagement.repository;
import com.employeemanagement.projection.EmployeeProjection;
import com.employeemanagement.model.Employee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import java.util.List;
import com.employeemanagement.projection.EmployeeDTO;
@Repository
public interface EmployeeRepository extends JpaRepository<Employee, Long> {
	/*Exercise 6: Employee Management System - Implementing Pagination and Sorting
	Business Scenario: 
	Add pagination and sorting capabilities to your employee search functionality.
	Instructions:
	1.	Pagination:
	o	Implement pagination for the employee list using Page and Pageable.
	2.	Sorting:
	o	Add sorting functionality to your queries.
	o	Combine pagination and sorting in your search endpoint.
	*/
    Page<Employee> findByName(String name, Pageable pageable);
    Page<Employee> findByDepartmentId(Long departmentId, Pageable pageable);
    Page<Employee> findAll(Pageable pageable);
    @Query("SELECT e.name AS name, e.email AS email, e.department.name AS departmentName FROM Employee e")
    List<EmployeeProjection> findEmployeeProjections();
    @Query("SELECT new com.employeemanagement.projection.EmployeeDTO(e.name, e.email, e.department.name) FROM Employee e")
    List<EmployeeDTO> findEmployeeDTOs();
	
    /*Exercise 5: Employee Management System - Defining Query Methods
     * 1.	Defining Query Methods:
    o	Use keywords in method names to create custom query methods.
    o	Implement custom query methods using the @Query annotation.
        // Custom JPQL query to find employees by name
        @Query("SELECT e FROM Employee e WHERE e.name = :name")
        List<Employee> findEmployeesByName(@Param("name") String name);

        // Custom JPQL query to find employees by email
        @Query("SELECT e FROM Employee e WHERE e.email = :email")
        Employee findEmployeeByEmail(@Param("email") String email);

        // Custom JPQL query to find employees by department ID
        @Query("SELECT e FROM Employee e WHERE e.department.id = :departmentId")
        List<Employee> findEmployeesByDepartmentId(@Param("departmentId") Long departmentId);
    */

    /*2.	Named Queries:
    o	Define and execute named queries with @NamedQuery and @NamedQueries
        // Use named query
        @Query(name = "Employee.findByName")
        List<Employee> findEmployeesByName(@Param("name") String name);
    }*/
}



