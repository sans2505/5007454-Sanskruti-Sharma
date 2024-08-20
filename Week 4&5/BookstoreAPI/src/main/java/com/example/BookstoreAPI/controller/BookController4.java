package com.example.BookstoreAPI.controller;

import com.example.BookstoreAPI.entity.Book;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/books")
public class BookController4 {

    private List<Book> books = new ArrayList<>();

    
    @GetMapping
    public ResponseEntity<List<Book>> getAllBooks() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("X-Custom-Header", "CustomHeaderValue");
        return new ResponseEntity<>(books, headers, HttpStatus.OK);
    }

    
    @GetMapping("/{id}")
    @ResponseStatus(HttpStatus.OK)
    public ResponseEntity<Book> getBookById(@PathVariable Long id) {
        return books.stream()
                .filter(book -> book.getId().equals(id))
                .findFirst()
                .map(book -> {
                    HttpHeaders headers = new HttpHeaders();
                    headers.add("X-Book-Found", "true");
                    return new ResponseEntity<>(book, headers, HttpStatus.OK);
                })
                .orElseGet(() -> {
                    HttpHeaders headers = new HttpHeaders();
                    headers.add("X-Book-Found", "false");
                    return new ResponseEntity<>(HttpStatus.NOT_FOUND);
                });
    }

    
    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public ResponseEntity<Book> createBook(@RequestBody Book book) {
        book.setId((long) (books.size() + 1)); 
        books.add(book);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Location", "/books/" + book.getId());
        return new ResponseEntity<>(book, headers, HttpStatus.CREATED);
    }

  
    @PutMapping("/{id}")
    public ResponseEntity<Book> updateBook(@PathVariable Long id, @RequestBody Book updatedBook) {
        return books.stream()
                .filter(book -> book.getId().equals(id))
                .findFirst()
                .map(book -> {
                    book.setTitle(updatedBook.getTitle());
                    book.setAuthor(updatedBook.getAuthor());
                    book.setPrice(updatedBook.getPrice());
                    book.setIsbn(updatedBook.getIsbn());
                    HttpHeaders headers = new HttpHeaders();
                    headers.add("X-Book-Updated", "true");
                    return new ResponseEntity<>(book, headers, HttpStatus.OK);
                })
                .orElseGet(() -> {
                    HttpHeaders headers = new HttpHeaders();
                    headers.add("X-Book-Updated", "false");
                    return new ResponseEntity<>(HttpStatus.NOT_FOUND);
                });
    }

    
    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public ResponseEntity<Void> deleteBook(@PathVariable Long id) {
        boolean removed = books.removeIf(book -> book.getId().equals(id));
        HttpHeaders headers = new HttpHeaders();
        headers.add("X-Book-Deleted", removed ? "true" : "false");
        return removed ? new ResponseEntity<>(headers, HttpStatus.NO_CONTENT) :
                new ResponseEntity<>(headers, HttpStatus.NOT_FOUND);
    }

   
    @GetMapping("/search")
    public ResponseEntity<List<Book>> filterBooks(
            @RequestParam(required = false) String title,
            @RequestParam(required = false) String author) {

        List<Book> filteredBooks = books.stream()
                .filter(book -> (title == null || book.getTitle().equalsIgnoreCase(title)) &&
                        (author == null || book.getAuthor().equalsIgnoreCase(author)))
                .collect(Collectors.toList());

        HttpHeaders headers = new HttpHeaders();
        headers.add("X-Books-Filtered", "true");
        return new ResponseEntity<>(filteredBooks, headers, HttpStatus.OK);
    }
}
