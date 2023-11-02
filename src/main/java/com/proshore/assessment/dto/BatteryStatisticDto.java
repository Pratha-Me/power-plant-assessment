package com.proshore.assessment.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.List;

/**
 * The type Battery statistic dto.
 *
 * @author Pramosh Shrestha
 * @created 01 /11/2023: 20:25
 */
@Getter
@Setter
@Accessors(chain = true)
public class BatteryStatisticDto implements Serializable {

    private List<String> name;

    private int totalWattage;

    private int averageWattCapacity;
}
