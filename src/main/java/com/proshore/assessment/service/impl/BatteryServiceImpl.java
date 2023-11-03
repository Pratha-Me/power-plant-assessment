package com.proshore.assessment.service.impl;

import com.proshore.assessment.dto.BatteryStatisticDto;
import com.proshore.assessment.dto.PostCodeRangeDto;
import com.proshore.assessment.entity.Battery;
import com.proshore.assessment.repository.BatteryRepository;
import com.proshore.assessment.service.BatteryService;
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

    @Override
    public List<Battery> saveBatteries(List<Battery> batteries) {
        return batteryRepository.saveAll(batteries);
    }

    @Override
    public BatteryStatisticDto getBatteriesByCriteria(PostCodeRangeDto postCodeRangeDto) {
        List<Battery> fetchedBatteriesByCriteria = batteryRepository.findBatteriesByPostcodeBetweenOrderByName(postCodeRangeDto.getMinPostCode(), postCodeRangeDto.getMaxPostCode());

//        Guard clause for the case in which the Battery repository returns an empty list
        if (fetchedBatteriesByCriteria.isEmpty()) {
            return new BatteryStatisticDto()
                    .setName(Collections.emptyList())
                    .setTotalWattage(0)
                    .setAverageWattCapacity(0);
        }

//        Calculation for the statistics (like the sum and the average of the capacity in watts)
        int totalWattCapacity = fetchedBatteriesByCriteria.stream()
                .mapToInt(Battery::getCapacity)
                .sum();

        int averageWattCapacity = totalWattCapacity / fetchedBatteriesByCriteria.size();

        return new BatteryStatisticDto()
                .setName(
                        fetchedBatteriesByCriteria.stream()
                                .map(Battery::getName)
                                .toList()
                )
                .setTotalWattage(totalWattCapacity)
                .setAverageWattCapacity(averageWattCapacity);
    }
}
