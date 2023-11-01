package com.proshore.assessment.repository;

import com.proshore.assessment.entity.Battery;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * @author Pramosh Shrestha
 * @created 01/11/2023: 19:30
 */
@Repository
public interface BatteryRepository extends JpaRepository<Battery, Long> {
}
