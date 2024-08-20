package com.example.BookstoreAPI.controller;

import com.example.BookstoreAPI.entity.Book;
import com.example.BookstoreAPI.repository.BookRepository;
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
@WebMvcTest(BookController8.class)
public class BookControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private BookRepository bookRepository;

    private Book book;

    @BeforeEach
    public void setUp() {
        MockitoAnnotations.openMocks(this);
        book = new Book(1L, "Book Title", "Author Name", 19.99, "1234567890");
    }

    @Test
    public void testCreateBook() throws Exception {
        when(bookRepository.save(book)).thenReturn(book);

        mockMvc.perform(post("/books")
                .contentType(MediaType.APPLICATION_JSON)
                .content("{\"title\":\"Book Title\",\"author\":\"Author Name\",\"price\":19.99,\"isbn\":\"1234567890\"}"))
                .andExpect(status().isCreated())
                .andExpect(jsonPath("$.title").value("Book Title"));
    }

    @Test
    public void testGetBookById() throws Exception {
        when(bookRepository.findById(1L)).thenReturn(java.util.Optional.of(book));

        mockMvc.perform(get("/books/1")
                .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.title").value("Book Title"));
    }

    @Test
    public void testUpdateBook() throws Exception {
        Book updatedBook = new Book(1L, "Updated Title", "Updated Author", 29.99, "0987654321");
        when(bookRepository.findById(1L)).thenReturn(java.util.Optional.of(book));
        when(bookRepository.save(updatedBook)).thenReturn(updatedBook);

        mockMvc.perform(MockMvcRequestBuilders.put("/books/1")
                .contentType(MediaType.APPLICATION_JSON)
                .content("{\"title\":\"Updated Title\",\"author\":\"Updated Author\",\"price\":29.99,\"isbn\":\"0987654321\"}"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.title").value("Updated Title"));
    }

    @Test
    public void testDeleteBook() throws Exception {
        when(bookRepository.findById(1L)).thenReturn(java.util.Optional.of(book));

        mockMvc.perform(MockMvcRequestBuilders.delete("/books/1"))
                .andExpect(status().isNoContent());
    }
}
