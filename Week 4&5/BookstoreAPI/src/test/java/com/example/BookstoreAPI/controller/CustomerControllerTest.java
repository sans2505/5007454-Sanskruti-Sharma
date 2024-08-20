package com.example.BookstoreAPI.controller;

import com.example.BookstoreAPI.entity.Customer;
import com.example.BookstoreAPI.repository.CustomerRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.MockitoAnnotations;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;

@SuppressWarnings("removal")
@WebMvcTest(CustomerController.class)
public class CustomerControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private CustomerRepository customerRepository;

    private Customer customer;

    @BeforeEach
    public void setUp() {
        MockitoAnnotations.openMocks(this);
        customer = new Customer(1L, "Sanskruti Sharma", "sanskruti.sharma@example.com", "100.00");
    }

    @Test
    public void testCreateCustomer() throws Exception {
        when(customerRepository.save(customer)).thenReturn(customer);

        mockMvc.perform(post("/customers")
                .contentType(MediaType.APPLICATION_JSON)
                .content("{\"name\":\"John Doe\",\"email\":\"john.doe@example.com\",\"balance\":100.00}"))
                .andExpect(status().isCreated())
                .andExpect(jsonPath("$.name").value("John Doe"));
    }

    @Test
    public void testGetCustomerById() throws Exception {
        when(customerRepository.findById(1L)).thenReturn(java.util.Optional.of(customer));

        mockMvc.perform(get("/customers/1")
                .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.name").value("John Doe"));
    }

    @Test
    public void testUpdateCustomer() throws Exception {
        Customer updatedCustomer = new Customer(1L, "Sanskruti Sharma", "sanskrutisharma.sharma@example.com", "200");
        when(customerRepository.findById(1L)).thenReturn(java.util.Optional.of(customer));
        when(customerRepository.save(updatedCustomer)).thenReturn(updatedCustomer);

        mockMvc.perform(MockMvcRequestBuilders.put("/customers/1")
                .contentType(MediaType.APPLICATION_JSON)
                .content("{\"name\":\"Jane Doe\",\"email\":\"jane.doe@example.com\",\"balance\":200.00}"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.name").value("Jane Doe"));
    }

    @Test
    public void testDeleteCustomer() throws Exception {
        when(customerRepository.findById(1L)).thenReturn(java.util.Optional.of(customer));

        mockMvc.perform(MockMvcRequestBuilders.delete("/customers/1"))
                .andExpect(status().isNoContent());
    }
}
