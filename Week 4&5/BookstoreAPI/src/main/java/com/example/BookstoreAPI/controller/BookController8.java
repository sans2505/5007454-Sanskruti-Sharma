package com.example.BookstoreAPI.controller;

import com.example.BookstoreAPI.entity.Book;
import com.example.BookstoreAPI.exception.ResourceNotFoundException;
import com.example.BookstoreAPI.mapper.BookMapper;
import com.example.BookstoreAPI.repository.BookRepository;
import org.springframework.hateoas.EntityModel;
import org.springframework.hateoas.CollectionModel;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import jakarta.validation.Valid;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.*;

@RestController
@RequestMapping("/books")
public class BookController8 {

    private final BookRepository bookRepository;
    @SuppressWarnings("unused")
	private final BookMapper bookMapper = BookMapper.INSTANCE;

    public BookController8(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    @PostMapping
    public ResponseEntity<EntityModel<Book>> createBook(@Valid @RequestBody Book book) {
        Book savedBook = bookRepository.save(book);
        EntityModel<Book> resource = EntityModel.of(savedBook);
        resource.add(linkTo(methodOn(BookController8.class).getBookById(savedBook.getId())).withSelfRel());
        resource.add(linkTo(methodOn(BookController8.class).getAllBooks()).withRel("all-books"));
        return new ResponseEntity<>(resource, HttpStatus.CREATED);
    }

    @GetMapping("/{id}")
    public ResponseEntity<EntityModel<Book>> getBookById(@PathVariable Long id) {
        Optional<Book> book = bookRepository.findById(id);
        return book.map(b -> {
            EntityModel<Book> resource = EntityModel.of(b);
            resource.add(linkTo(methodOn(BookController8.class).getBookById(b.getId())).withSelfRel());
            resource.add(linkTo(methodOn(BookController8.class).getAllBooks()).withRel("all-books"));
            return ResponseEntity.ok(resource);
        }).orElseThrow(() -> new ResourceNotFoundException("Book not found with ID: " + id));
    }

    @GetMapping
    public ResponseEntity<CollectionModel<EntityModel<Book>>> getAllBooks() {
        List<EntityModel<Book>> books = bookRepository.findAll().stream()
                .map(book -> EntityModel.of(book,
                        linkTo(methodOn(BookController8.class).getBookById(book.getId())).withSelfRel()))
                .collect(Collectors.toList());
        return ResponseEntity.ok(CollectionModel.of(books,
                linkTo(methodOn(BookController8.class).getAllBooks()).withSelfRel()));
    }

    @PutMapping("/{id}")
    public ResponseEntity<EntityModel<Book>> updateBook(@PathVariable Long id, @Valid @RequestBody Book bookDetails) {
        return bookRepository.findById(id).map(book -> {
            book.setTitle(bookDetails.getTitle());
            book.setAuthor(bookDetails.getAuthor());
            book.setPrice(bookDetails.getPrice());
            book.setIsbn(bookDetails.getIsbn());
            Book updatedBook = bookRepository.save(book);
            EntityModel<Book> resource = EntityModel.of(updatedBook);
            resource.add(linkTo(methodOn(BookController8.class).getBookById(updatedBook.getId())).withSelfRel());
            resource.add(linkTo(methodOn(BookController8.class).getAllBooks()).withRel("all-books"));
            return new ResponseEntity<>(resource, HttpStatus.OK);
        }).orElseThrow(() -> new ResourceNotFoundException("Book not found with ID: " + id));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Object> deleteBook(@PathVariable Long id) {
        return bookRepository.findById(id).map(book -> {
            bookRepository.delete(book);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }).orElseThrow(() -> new ResourceNotFoundException("Book not found with ID: " + id));
    }

    @GetMapping("/search")
    public ResponseEntity<CollectionModel<EntityModel<Book>>> filterBooks(
            @RequestParam(required = false) String title,
            @RequestParam(required = false) String author) {

        List<EntityModel<Book>> filteredBooks = bookRepository.findAll().stream()
                .filter(book -> (title == null || book.getTitle().equalsIgnoreCase(title)) &&
                        (author == null || book.getAuthor().equalsIgnoreCase(author)))
                .map(book -> EntityModel.of(book,
                        linkTo(methodOn(BookController8.class).getBookById(book.getId())).withSelfRel()))
                .collect(Collectors.toList());

        return ResponseEntity.ok(CollectionModel.of(filteredBooks,
                linkTo(methodOn(BookController8.class).getAllBooks()).withSelfRel()));
    }
}
