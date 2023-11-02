package com.proshore.assessment.dto;

import com.proshore.assessment.entity.Battery;
import io.swagger.v3.oas.annotations.media.Schema;
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
    @Schema(hidden = true)
    private Long id;

    /**
     * The Name.
     */
    @NotNull
    @NotBlank
    @Schema(name = "name", example = "Bentley", requiredMode = Schema.RequiredMode.REQUIRED, minLength = 1)
    private String name;

    /**
     * The Postcode.
     */
    @NotNull
    @NotBlank
    @Schema(name = "postcode", example = "79225", requiredMode = Schema.RequiredMode.REQUIRED, minLength = 1)
    private String postcode;

    /**
     * The Wattage.
     */
    @NotNull
    @Positive
    @Schema(name = "capacity", example = "4920", requiredMode = Schema.RequiredMode.REQUIRED, minimum = "0")
    private Integer capacity;
}