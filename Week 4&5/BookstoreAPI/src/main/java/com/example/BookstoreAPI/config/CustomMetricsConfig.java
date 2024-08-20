package com.example.BookstoreAPI.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import io.micrometer.core.instrument.MeterRegistry;
import io.micrometer.core.instrument.binder.MeterBinder;

@Configuration
public class CustomMetricsConfig {

    @Bean
    public MeterBinder customMetrics() {
        return (MeterRegistry meterRegistry) -> {
            meterRegistry.gauge("custom_metric_name", new CustomMetric(), CustomMetric::getValue);
        };
    }

    private static class CustomMetric {
        private double value = Math.random(); 

        public double getValue() {
            return value;
        }
    }
}
