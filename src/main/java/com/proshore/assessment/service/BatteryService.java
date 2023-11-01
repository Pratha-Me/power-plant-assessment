package com.proshore.assessment.service;

import com.proshore.assessment.dto.BatteryDto;

import java.util.List;

/**
 * The interface Battery service.
 *
 * @author Pramosh Shrestha
 * @created 01 /11/2023: 19:31
 */
public interface BatteryService {

    /**
     * Save batteries list.
     *
     * @param batteryDtos the battery dtos
     * @return the list
     */
    List<BatteryDto> saveBatteries(List<BatteryDto> batteryDtos);
}
