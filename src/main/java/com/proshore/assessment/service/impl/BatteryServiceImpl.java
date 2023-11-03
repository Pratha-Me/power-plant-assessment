package com.proshore.assessment.service.impl;

import com.proshore.assessment.dto.BatteryStatisticDto;
import com.proshore.assessment.dto.PostCodeRangeDto;
import com.proshore.assessment.entity.Battery;
import com.proshore.assessment.repository.BatteryRepository;
import com.proshore.assessment.service.BatteryService;
import com.proshore.assessment.service.BatteryStatisticService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

/**
 * <b>The type Battery service</b>
 *
 * @author Pramosh Shrestha
 * @created 01 /11/2023: 19:33
 */
@Service
@RequiredArgsConstructor
public class BatteryServiceImpl implements BatteryService {

    private final BatteryRepository batteryRepository;
    private final BatteryStatisticService batteryStatisticService;

    @Override
    public List<Battery> saveBatteries(List<Battery> batteries) {
        return batteryRepository.saveAll(batteries);
    }

    @Override
    public BatteryStatisticDto getBatteriesWithDataBetweenRange(PostCodeRangeDto postCodeRangeDto) {
        List<Battery> fetchedBatteriesByCriteria = batteryRepository.findBatteriesByPostcodeBetweenOrderByName(postCodeRangeDto.getMinPostCode(), postCodeRangeDto.getMaxPostCode());

//        GUARD CLAUSE: For an empty list
        if (fetchedBatteriesByCriteria.isEmpty()) {
            return new BatteryStatisticDto()
                    .setName(Collections.emptyList())
                    .setTotalWattage(0)
                    .setAverageWattCapacity(0);
        }

        return new BatteryStatisticDto()
                .setName(
                        fetchedBatteriesByCriteria.stream()
                                .map(Battery::getName)
                                .toList()
                )
                .setTotalWattage(batteryStatisticService.calculateTotalWattCapacity(fetchedBatteriesByCriteria))
                .setAverageWattCapacity(batteryStatisticService.calculateAverageWattCapacity(fetchedBatteriesByCriteria));
    }
}
