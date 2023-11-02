package com.proshore.assessment.service.impl;

import com.proshore.assessment.dto.BatteryDto;
import com.proshore.assessment.dto.BatteryStatisticDto;
import com.proshore.assessment.dto.PostCodeRangeDto;
import com.proshore.assessment.entity.Battery;
import com.proshore.assessment.mapstruct.BatteryObjectMapper;
import com.proshore.assessment.repository.BatteryRepository;
import com.proshore.assessment.service.BatteryService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

/**
 * The type Battery service.
 *
 * @author Pramosh Shrestha
 * @created 01 /11/2023: 19:33
 */
@Service
@RequiredArgsConstructor
public class BatteryServiceImpl implements BatteryService {

    private final BatteryRepository batteryRepository;
    private final BatteryObjectMapper batteryObjectMapper;

    @Override
    public List<BatteryDto> saveBatteries(List<BatteryDto> batteryDtos) {
        List<Battery> savedBatteries = batteryRepository.saveAll(
                batteryDtos.stream()
                        .map(batteryObjectMapper::toEntity)
                        .toList()
        );

        return savedBatteries.stream()
                .map(batteryObjectMapper::toDto)
                .toList();
    }

    @Override
    public BatteryStatisticDto getBatteriesByCriterias(PostCodeRangeDto postCodeRangeDto) {
        List<Battery> fetchedBatteries = batteryRepository.findBatteriesByPostcodeBetweenOrderByName(postCodeRangeDto.getMinPostCode(), postCodeRangeDto.getMaxPostCode());

        if (fetchedBatteries.isEmpty()) {
            return new BatteryStatisticDto()
                    .setName(Collections.emptyList())
                    .setTotalWattage(0)
                    .setAverageWattCapacity(0);
        }

        int totalWattCapacity = fetchedBatteries.stream()
                .mapToInt(Battery::getCapacity)
                .sum();

        int averageWattCapacity = totalWattCapacity / fetchedBatteries.size();

        return new BatteryStatisticDto()
                .setName(
                        fetchedBatteries.stream()
                                .map(Battery::getName)
                                .toList()
                )
                .setTotalWattage(totalWattCapacity)
                .setAverageWattCapacity(averageWattCapacity);
    }
}
