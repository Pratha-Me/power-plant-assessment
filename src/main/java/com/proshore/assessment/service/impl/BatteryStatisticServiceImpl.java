package com.proshore.assessment.service.impl;

import com.proshore.assessment.entity.Battery;
import com.proshore.assessment.service.BatteryStatisticService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Pramosh Shrestha
 * @created 03/11/2023: 23:33
 */
@Service
public class BatteryStatisticServiceImpl implements BatteryStatisticService {

    @Override
    public int calculateAverageWattCapacity(List<Battery> batteries) {
        int totalWattCapacity = calculateTotalWattCapacity(batteries);
        return totalWattCapacity / batteries.size();
    }

    @Override
    public int calculateTotalWattCapacity(List<Battery> batteries) {
        return batteries.stream()
                .mapToInt(Battery::getCapacity)
                .sum();
    }
}
