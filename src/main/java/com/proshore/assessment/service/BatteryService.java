package com.proshore.assessment.service;

import com.proshore.assessment.dto.BatteryDto;
import com.proshore.assessment.dto.BatteryStatisticDto;
import com.proshore.assessment.dto.PostCodeRangeDto;

import java.util.List;

/**
 * <b>The interface Battery service</b>
 *
 * <p>This service provides create and get business logic.</p>
 * @author Pramosh Shrestha
 * @created 01 /11/2023: 19:31
 */
public interface BatteryService {

    /**
     * <b>Saves the batteries list.</b>
     *
     * @param batteryDtos {@link BatteryDto}: the persistable battery dtos
     * @return List of {@link BatteryDto}
     */
    List<BatteryDto> saveBatteries(List<BatteryDto> batteryDtos);

    /**
     * <b>Gets batteries by criterias.</b>
     *
     * @param postCodeRangeDto {@link PostCodeRangeDto}: the post code range dto
     * @return List of batteries {@link BatteryStatisticDto} by criterias
     */
    BatteryStatisticDto getBatteriesByCriterias(PostCodeRangeDto postCodeRangeDto);
}
