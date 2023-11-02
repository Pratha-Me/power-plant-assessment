package com.proshore.assessment.service;

import com.proshore.assessment.entity.Battery;
import com.proshore.assessment.repository.BatteryRepository;
import com.proshore.assessment.service.impl.BatteryServiceImpl;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.ArrayList;
import java.util.List;

import static org.assertj.core.api.BDDAssertions.then;
import static org.junit.jupiter.api.Assertions.assertAll;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.BDDMockito.given;
import static org.mockito.Mockito.atMostOnce;
import static org.mockito.Mockito.verify;

@ExtendWith(MockitoExtension.class)
class BatteryServiceImplTest {

    static final long ID1 = 1L;
    static final long ID2 = 2L;
    static final long ID3 = 3L;
    static final List<Battery> persistableBatteryEntities = new ArrayList<>(3);
    static final List<Battery> savedBatteryEntities = new ArrayList<>(3);
    @Mock
    private BatteryRepository batteryRepository;
    @InjectMocks
    private BatteryServiceImpl batteryServiceImpl;

    @BeforeAll
    static void setUpForTheBatterServiceTest() {
        // Create a list of Battery entities that batteryObjectMapper.toEntity would return
        Battery battery = new Battery()
                .setName("test 1")
                .setPostcode("11")
                .setCapacity(11);
        Battery battery1 = new Battery()
                .setName("test 2")
                .setPostcode("22")
                .setCapacity(22);
        Battery battery2 = new Battery()
                .setName("test 3")
                .setPostcode("33")
                .setCapacity(33);

        // Add battery entities to the list
        persistableBatteryEntities.addAll(List.of(battery, battery1, battery2));

        // Set battery entities with the primary key. This emulates the characteristics of Spring JPA which saves the entity with an auto primary key and returns the saved object
        battery.setId(ID1);
        battery1.setId(ID2);
        battery2.setId(ID3);

        // Add battery entities to a new list. This is list of saved batteries which are returned by the battery repository
        savedBatteryEntities.addAll(List.of(battery, battery1, battery2));
    }

    @Test
    void saveBatteries_should_return_list_of_battery_object_with_primary_keys() {
        // GIVEN
        // Mock the JPA repository
        given(batteryRepository.saveAll(persistableBatteryEntities))
                .willReturn(savedBatteryEntities);

        // THEN
        // Assert the business logic for the expected response body and persisting the batteries in (SQL) Database performed via Spring JPA.
        then(batteryServiceImpl.saveBatteries(persistableBatteryEntities))
                .isInstanceOf(List.class)
                .hasOnlyElementsOfType(Battery.class)
                .satisfies(batteries -> assertAll(
                        "The returned entities must contain the auto generated primary keys",
                        () -> assertEquals(ID1, savedBatteryEntities.get(0).getId()),
                        () -> assertEquals(ID2, savedBatteryEntities.get(1).getId()),
                        () -> assertEquals(ID3, savedBatteryEntities.get(2).getId())
                ));

        verify(batteryRepository, atMostOnce()).saveAll(persistableBatteryEntities);
    }
}
