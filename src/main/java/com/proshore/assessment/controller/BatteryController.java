package com.proshore.assessment.controller;

import com.proshore.assessment.dto.BatteryDto;
import com.proshore.assessment.dto.BatteryStatisticDto;
import com.proshore.assessment.dto.PostCodeRangeDto;
import com.proshore.assessment.entity.Battery;
import com.proshore.assessment.mapstruct.BatteryObjectMapper;
import com.proshore.assessment.service.BatteryService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.enums.ParameterIn;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Size;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

/**
 * <b>The type Battery controller</b>
 *
 * @author Pramosh Shrestha
 * @created 01 /11/2023: 19:33
 */
@Validated
@RestController
@RequiredArgsConstructor
@RequestMapping(value = "/battery")
@Tag(name = "Battery APIs", description = "Encapsulates the business model for battery model. This API serves you with two endpoints")
public class BatteryController {

    private final BatteryService batteryService;
    private final BatteryObjectMapper batteryObjectMapper;

    /**
     * <b>Save batteries response entity</b>
     *
     * @param batteryDtos {@link BatteryDto} the battery dtos
     * @return the response entity: {@link ResponseEntity}
     */
    @PostMapping(value = "/all")
    @Operation(
            summary = "Saves a list of batteries",
            description = "Save the provided batteries information in bulk",
            operationId = "saveBatteries"
    )
    public ResponseEntity<List<BatteryDto>> saveBatteries(@RequestBody @Valid @Size(min = 1) List<BatteryDto> batteryDtos) {
        List<Battery> savedBatteries = batteryService.saveBatteries(batteryObjectMapper.toEntities(batteryDtos));

        return new ResponseEntity<>(
                batteryObjectMapper.toDtos(savedBatteries),
                HttpStatus.CREATED
        );
    }

    /**
     * <b>Gets batteries by criteria</b>
     *
     * @param optionalPostCodeRangeDto {@link Optional} the optional post code range dto
     * @return the batteries by criteria: {@link ResponseEntity}
     */
    @GetMapping(value = "/criteria")
    @Operation(
            summary = "Gets a list of batteries with statistics",
            description = "Fetches list of batteries which satisfies the condition provided via the request parameter(s). Plus, the response body has the names of the batteries sorted alphabetically.",
            operationId = "getBatteriesByCriteria",
            parameters = {
                    @Parameter(
                            name = "optionalPostCodeRangeDto",
                            description = "Query parameters. The minimum and the maximum values of the postcode. The boundary values (the minimum and the maximum) are inclusive",
                            required = true,
                            in = ParameterIn.QUERY,
                            schema = @Schema(
                                    name = "optionalPostCodeRangeDto",
                                    implementation = PostCodeRangeDto.class
                            )
                    )
            }
    )
    public ResponseEntity<BatteryStatisticDto> getBatteriesByCriteria(@Valid Optional<PostCodeRangeDto> optionalPostCodeRangeDto) {
        return optionalPostCodeRangeDto.map(postCodeRangeDto -> new ResponseEntity<>(
                batteryService.getBatteriesByCriteria(optionalPostCodeRangeDto.get()),
                HttpStatus.OK
        )).orElse(
                new ResponseEntity<>(
                        new BatteryStatisticDto(),
                        HttpStatus.OK
                )
        );
    }

}
