package com.example.BookstoreAPI.controller;
//Use Custom Exceptions
import com.example.BookstoreAPI.entity.Book;
import com.example.BookstoreAPI.exception.ResourceNotFoundException;
import com.example.BookstoreAPI.exception.InvalidRequestException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/books")
public class BookController5 {

    private List<Book> books = new ArrayList<>();

    
    @GetMapping("/{id}")
    public ResponseEntity<Book> getBookById(@PathVariable Long id) {
        return books.stream()
                .filter(book -> book.getId().equals(id))
                .findFirst()
                .map(book -> {
                    HttpHeaders headers = new HttpHeaders();
                    headers.add("X-Book-Found", "true");
                    return new ResponseEntity<>(book, headers, HttpStatus.OK);
                })
                .orElseThrow(() -> new ResourceNotFoundException("Book not found with ID: " + id));
    }

   
    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public ResponseEntity<Book> createBook(@RequestBody Book book) {
        if (book.getTitle() == null || book.getAuthor() == null) {
            throw new InvalidRequestException("Book title and author cannot be null.");
        }
        book.setId((long) (books.size() + 1)); // Simple ID generation logic
        books.add(book);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Location", "/books/" + book.getId());
        return new ResponseEntity<>(book, headers, HttpStatus.CREATED);
    }

    
}
