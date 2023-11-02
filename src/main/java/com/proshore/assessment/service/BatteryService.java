package com.proshore.assessment.service;

import com.proshore.assessment.dto.BatteryDto;
import com.proshore.assessment.dto.BatteryStatisticDto;
import com.proshore.assessment.dto.PostCodeRangeDto;

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

    /**
     * Gets batteries by criterias.
     *
     * @param postCodeRangeDto the post code range dto
     * @return the batteries by criterias
     */
    BatteryStatisticDto getBatteriesByCriterias(PostCodeRangeDto postCodeRangeDto);
}
