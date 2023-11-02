package com.proshore.assessment.dto;

import com.proshore.assessment.entity.Battery;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * DTO for {@link Battery}
 */
@Getter
@Setter
@Accessors(chain = true)
public class BatteryDto implements Serializable {

    /**
     * The Id.
     */
    private Long id;

    /**
     * The Name.
     */
    @NotNull
    @NotBlank
    private String name;

    /**
     * The Postcode.
     */
    @NotNull
    @NotBlank
    private String postcode;

    /**
     * The Wattage.
     */
    @NotNull
    @Positive
    private Integer capacity;
}