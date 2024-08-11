package com.employeemanagement.repository;

import com.employeemanagement.model.Department;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;
/*1.	Defining Query Methods:
o	Use keywords in method names to create custom query methods.
o	Implement custom query methods using the @Query annotation.
@Repository
public interface DepartmentRepository extends JpaRepository<Department, Long> {

    // Custom JPQL query to find department by name
    @Query("SELECT d FROM Department d WHERE d.name = :name")
    Department findDepartmentByName(@Param("name") String name);
}*/

/*2.	Named Queries:
o	Define and execute named queries with @NamedQuery and @NamedQueries*/
@Repository
public interface DepartmentRepository extends JpaRepository<Department, Long> {

    // Use named query to find by name
    @Query(name = "Department.findByName")
    Department findDepartmentByName(@Param("name") String name);

    // Use named query to find all departments
    @Query(name = "Department.findAll")
    List<Department> findAllDepartments();
}