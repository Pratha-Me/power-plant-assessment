package com.proshore.assessment.controller;

import com.proshore.assessment.dto.BatteryDto;
import com.proshore.assessment.service.BatteryService;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Size;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * The type Battery controller.
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
     * Save batteries response entity.
     *
     * @param batteryDtos the battery dtos
     * @return the response entity
     */
    @PostMapping(value = "/all")
    public ResponseEntity<List<BatteryDto>> saveBatteries(@RequestBody @Valid @Size(min = 1) List<BatteryDto> batteryDtos) {
        return new ResponseEntity<>(
                batteryService.saveBatteries(batteryDtos),
                HttpStatus.CREATED
        );
    }

}
