package com.proshore.assessment.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

/**
 * @author Pramosh Shrestha
 * @created 01/11/2023: 20:31
 */
@Getter
@Setter
@Accessors(chain = true)
public class PostCodeRangeDto {

    @NotNull
    @NotBlank
    private String minPostCode;

    @NotNull
    @NotBlank
    private String maxPostCode;
}
