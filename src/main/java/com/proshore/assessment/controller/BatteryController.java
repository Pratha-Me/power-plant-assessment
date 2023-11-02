package com.proshore.assessment.controller;

import com.proshore.assessment.dto.BatteryDto;
import com.proshore.assessment.dto.BatteryStatisticDto;
import com.proshore.assessment.dto.PostCodeRangeDto;
import com.proshore.assessment.entity.Battery;
import com.proshore.assessment.service.BatteryService;
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
public class BatteryController {

    private final BatteryService batteryService;

    /**
     * <b>Save batteries response entity</b>
     *
     * @param batteryDtos {@link BatteryDto} the battery dtos
     * @return the response entity: {@link ResponseEntity}
     */
    @PostMapping(value = "/all")
    public ResponseEntity<List<BatteryDto>> saveBatteries(@RequestBody @Valid @Size(min = 1) List<BatteryDto> batteryDtos) {
        return new ResponseEntity<>(
                batteryService.saveBatteries(batteryDtos),
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
    public ResponseEntity<BatteryStatisticDto> getBatteriesByCriteria(@Valid Optional<PostCodeRangeDto> optionalPostCodeRangeDto) {
        return optionalPostCodeRangeDto.map(postCodeRangeDto -> new ResponseEntity<>(
                batteryService.getBatteriesByCriterias(optionalPostCodeRangeDto.get()),
                HttpStatus.OK
        )).orElse(
                new ResponseEntity<>(
                        new BatteryStatisticDto(),
                        HttpStatus.OK
                )
        );
    }

}
