package com.proshore.assessment.repository;

import com.proshore.assessment.entity.Battery;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * The interface Battery repository.
 *
 * @author Pramosh Shrestha
 * @created 01 /11/2023: 19:30
 */
@Repository
public interface BatteryRepository extends JpaRepository<Battery, Long> {

    /**
     * Find batteries by postcode between order by name list.
     *
     * @param minPostCode the min post code
     * @param maxPostCode the max post code
     * @return the list
     */
    List<Battery> findBatteriesByPostcodeBetweenOrderByName(String minPostCode, String maxPostCode);
}
