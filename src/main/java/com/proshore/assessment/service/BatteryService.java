package com.proshore.assessment.service;

import com.proshore.assessment.dto.BatteryDto;
import com.proshore.assessment.dto.BatteryStatisticDto;
import com.proshore.assessment.dto.PostCodeRangeDto;
import com.proshore.assessment.entity.Battery;

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
     * @param batteries {@link List} of {@link Battery}: the persistable battery dtos
     * @return {@link List} of {@link Battery}
     */
    List<Battery> saveBatteries(List<Battery> batteries);

    /**
     * <b>Gets batteries by criteria.</b>
     *
     * @param postCodeRangeDto {@link PostCodeRangeDto}: the post code range dto
     * @return {@link BatteryStatisticDto}
     */
    BatteryStatisticDto getBatteriesWithDataBetweenRange(PostCodeRangeDto postCodeRangeDto);
}
