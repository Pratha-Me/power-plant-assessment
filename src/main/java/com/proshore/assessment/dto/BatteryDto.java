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

    Long id;

    @NotNull
    @NotBlank
    String name;

    @NotNull
    @NotBlank
    String postcode;

    @NotNull
    @Positive
    Double wattage;
}