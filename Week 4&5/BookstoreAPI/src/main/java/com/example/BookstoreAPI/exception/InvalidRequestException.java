package com.example.BookstoreAPI.exception;

@SuppressWarnings("serial")
public class InvalidRequestException extends RuntimeException {

    public InvalidRequestException(String message) {
        super(message);
    }
}
