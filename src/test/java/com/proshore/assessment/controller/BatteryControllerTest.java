package com.proshore.assessment.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.proshore.assessment.dto.BatteryDto;
import com.proshore.assessment.dto.BatteryStatisticDto;
import com.proshore.assessment.dto.PostCodeRangeDto;
import com.proshore.assessment.entity.Battery;
import com.proshore.assessment.mapstruct.BatteryObjectMapper;
import com.proshore.assessment.service.BatteryService;
import org.hamcrest.Matchers;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.data.jpa.JpaRepositoriesAutoConfiguration;
import org.springframework.boot.autoconfigure.data.mongo.MongoDataAutoConfiguration;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.autoconfigure.jdbc.DataSourceTransactionManagerAutoConfiguration;
import org.springframework.boot.autoconfigure.jdbc.JdbcTemplateAutoConfiguration;
import org.springframework.boot.autoconfigure.mongo.MongoAutoConfiguration;
import org.springframework.boot.autoconfigure.orm.jpa.HibernateJpaAutoConfiguration;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.boot.autoconfigure.security.servlet.SecurityFilterAutoConfiguration;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.BDDMockito.given;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@WebMvcTest(
        controllers = {BatteryController.class},
        excludeAutoConfiguration = {MongoAutoConfiguration.class, SecurityAutoConfiguration.class, SecurityFilterAutoConfiguration.class, DataSourceAutoConfiguration.class, JpaRepositoriesAutoConfiguration.class, HibernateJpaAutoConfiguration.class, MongoDataAutoConfiguration.class, JdbcTemplateAutoConfiguration.class, DataSourceTransactionManagerAutoConfiguration.class}
)
class BatteryControllerTest {

    public static final long ID = 1L;
    public static final long ID1 = 2L;
    public static final String GREAT_HIGH = "Great High";
    public static final String TESLA_BATTERY = "Tesla Battery";
    public static final int CAPACITY = 100;
    public static final int CAPACITY1 = 115;
    public static final BatteryStatisticDto fetchedBatteryStatisticDto = new BatteryStatisticDto()
            .setName(List.of(TESLA_BATTERY, GREAT_HIGH))
            .setTotalWattage(CAPACITY + CAPACITY1)
            .setAverageWattCapacity((CAPACITY + CAPACITY1) / 2);
    public static final String POSTCODE = "71192";
    public static final String POSTCODE1 = "10038";
    public static final MultiValueMap<String, String> PARAMS = new LinkedMultiValueMap<>(2);
    private static final List<BatteryDto> batteryDtos = List.of(
            new BatteryDto()
                    .setCapacity(CAPACITY)
                    .setName(TESLA_BATTERY)
                    .setPostcode(POSTCODE),
            new BatteryDto()
                    .setCapacity(CAPACITY1)
                    .setName(GREAT_HIGH)
                    .setPostcode(POSTCODE1)
    );
    private static final List<Battery> persistableBatteries = List.of(
            new Battery()
                    .setCapacity(CAPACITY)
                    .setName(TESLA_BATTERY)
                    .setPostcode(POSTCODE),
            new Battery()
                    .setCapacity(CAPACITY1)
                    .setName(GREAT_HIGH)
                    .setPostcode(POSTCODE1)
    );
    private static final List<Battery> savedBatteries = List.of(
            new Battery()
                    .setId(ID)
                    .setCapacity(CAPACITY)
                    .setName(TESLA_BATTERY)
                    .setPostcode(POSTCODE),
            new Battery()
                    .setId(ID1)
                    .setCapacity(CAPACITY1)
                    .setName(GREAT_HIGH)
                    .setPostcode(POSTCODE1)
    );
    private static final List<BatteryDto> savedBatteryDtos = List.of(
            new BatteryDto()
                    .setId(ID)
                    .setCapacity(CAPACITY)
                    .setName(TESLA_BATTERY)
                    .setPostcode(POSTCODE),
            new BatteryDto()
                    .setId(ID1)
                    .setCapacity(CAPACITY1)
                    .setName(GREAT_HIGH)
                    .setPostcode(POSTCODE1)
    );
    @Autowired
    private MockMvc mockMvc;
    @Autowired
    private ObjectMapper objectMapper;
    @MockBean
    private BatteryService batteryService;
    @MockBean
    private BatteryObjectMapper batteryObjectMapper;

    @BeforeAll
    static void setupForTest() {
        PARAMS.add("minPostCode", POSTCODE1);
        PARAMS.add("maxPostCode", POSTCODE);
    }

    @Test
    void whenValidInput_thenHttpStatus201() {
        // GIVEN
        given(batteryObjectMapper.toEntities(Mockito.anyList()))
                .willReturn(persistableBatteries);
        given(batteryObjectMapper.toDtos(Mockito.anyList()))
                .willReturn(savedBatteryDtos);
        given(batteryService.saveBatteries(Mockito.anyList()))
                .willReturn(savedBatteries);

        try {
            // WHEN
            mockMvc.perform(
                            post("/battery/all")
                                    .content(objectMapper.writeValueAsString(batteryDtos))
                                    .contentType(MediaType.APPLICATION_JSON_VALUE)
                    )
                    // THEN
                    .andExpect(status().isCreated())
                    .andDo(MockMvcResultHandlers.print());

            // VERIFY: Invocations of the dependencies (Beans)
            verify(batteryObjectMapper, times(1)).toEntities(Mockito.anyList());
            verify(batteryObjectMapper, times(1)).toDtos(Mockito.anyList());
            verify(batteryService, times(1)).saveBatteries(Mockito.anyList());

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    void whenExpectedResponse_thenReturnsListOfSavedBatteryDtoObject() {
        // GIVEN
        given(batteryObjectMapper.toEntities(Mockito.anyList()))
                .willReturn(persistableBatteries);
        given(batteryObjectMapper.toDtos(Mockito.anyList()))
                .willReturn(savedBatteryDtos);
        given(batteryService.saveBatteries(Mockito.anyList()))
                .willReturn(savedBatteries);

        try {
            // WHEN
            String contentAsString = mockMvc.perform(
                            post("/battery/all")
                                    .content(objectMapper.writeValueAsString(batteryDtos))
                                    .contentType(MediaType.APPLICATION_JSON_VALUE)
                    )
                    .andExpect(jsonPath("$", Matchers.instanceOf(List.class), List.class))
                    .andDo(MockMvcResultHandlers.print())
                    .andReturn()
                    .getResponse()
                    .getContentAsString();


            // THEN
            assertThat(contentAsString).isEqualTo(objectMapper.writeValueAsString(savedBatteryDtos));

            // VERIFY: Invocations of the dependencies (Beans)
            verify(batteryObjectMapper, times(1)).toEntities(Mockito.anyList());
            verify(batteryObjectMapper, times(1)).toDtos(Mockito.anyList());
            verify(batteryService, times(1)).saveBatteries(Mockito.anyList());

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    void whenValidParameter_thenHttpStatus200() {
        // GIVEN
        given(batteryService.getBatteriesWithDataBetweenRange(Mockito.any(PostCodeRangeDto.class)))
                .willReturn(fetchedBatteryStatisticDto);

        try {
            // WHEN
            mockMvc.perform(
                            get("/battery/postcode/range")
                                    .queryParams(PARAMS)
                    )
                    // THEN
                    .andExpect(status().isOk())
                    .andDo(MockMvcResultHandlers.print());

            // VERIFY: Invocations of the dependencies (Beans)
            verify(batteryService, times(1)).getBatteriesWithDataBetweenRange(Mockito.any(PostCodeRangeDto.class));

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    void whenValidParameter_andReturnsBatteryStatisticObject() {
        // GIVEN
        given(batteryService.getBatteriesWithDataBetweenRange(Mockito.any(PostCodeRangeDto.class)))
                .willReturn(fetchedBatteryStatisticDto);

        try {
            // WHEN
            mockMvc.perform(
                            get("/battery/postcode/range")
                                    .queryParams(PARAMS)
                    )
                    // THEN
                    .andExpect(jsonPath("$", Matchers.instanceOf(BatteryStatisticDto.class), BatteryStatisticDto.class))
                    .andDo(MockMvcResultHandlers.print());

            // VERIFY: Invocations of the dependencies (Beans)
            verify(batteryService, times(1)).getBatteriesWithDataBetweenRange(Mockito.any(PostCodeRangeDto.class));

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
