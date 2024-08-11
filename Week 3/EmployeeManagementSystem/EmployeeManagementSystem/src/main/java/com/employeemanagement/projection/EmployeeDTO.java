package com.employeemanagement.projection;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class EmployeeDTO {

    private String name;
    private String email;
    private String departmentName;
}
