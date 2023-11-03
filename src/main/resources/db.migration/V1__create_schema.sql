create sequence addon_category_id_seq;

alter sequence addon_category_id_seq owner to ycore;

create sequence address_component_id_seq;

alter sequence address_component_id_seq owner to ycore;

create sequence address_id_seq;

alter sequence address_id_seq owner to ycore;

create sequence address_lookup_id_seq;

alter sequence address_lookup_id_seq owner to ycore;

create sequence article_category_id_seq;

alter sequence article_category_id_seq owner to ycore;

create sequence article_id_seq;

alter sequence article_id_seq owner to ycore;

create sequence branch_service_id_seq;

alter sequence branch_service_id_seq owner to ycore;

create sequence business_hour_id_seq;

alter sequence business_hour_id_seq owner to ycore;

create sequence business_preference_id_seq;

alter sequence business_preference_id_seq owner to ycore;

create sequence business_preference_value_id_seq;

alter sequence business_preference_value_id_seq owner to ycore;

create sequence business_role_id_seq;

alter sequence business_role_id_seq owner to ycore;

create sequence business_type_id_seq;

alter sequence business_type_id_seq owner to ycore;

create sequence contact_id_seq;

alter sequence contact_id_seq owner to ycore;

create sequence country_id_seq;

alter sequence country_id_seq owner to ycore;

create sequence cuisine_id_seq;

alter sequence cuisine_id_seq owner to ycore;

create sequence district_id_seq;

alter sequence district_id_seq owner to ycore;

create sequence feedback_id_seq;

alter sequence feedback_id_seq owner to ycore;

create sequence files_id_seq;

alter sequence files_id_seq owner to ycore;

create sequence flag_id_seq;

alter sequence flag_id_seq owner to ycore;

create sequence food_addon_id_seq;

alter sequence food_addon_id_seq owner to ycore;

create sequence food_category_id_seq;

alter sequence food_category_id_seq owner to ycore;

create sequence food_id_seq;

alter sequence food_id_seq owner to ycore;

create sequence food_size_id_seq;

alter sequence food_size_id_seq owner to ycore;

create sequence global_sub_value_id_seq;

alter sequence global_sub_value_id_seq owner to ycore;

create sequence global_value_id_seq;

alter sequence global_value_id_seq owner to ycore;

create sequence language_id_seq;

alter sequence language_id_seq owner to ycore;

create sequence meal_type_id_seq;

alter sequence meal_type_id_seq owner to ycore;

create sequence media_library_id_seq;

alter sequence media_library_id_seq owner to ycore;

create sequence modules_id_seq;

alter sequence modules_id_seq owner to ycore;

create sequence organization_branch_id_seq;

alter sequence organization_branch_id_seq owner to ycore;

create sequence organization_branch_public_profile_id_seq;

alter sequence organization_branch_public_profile_id_seq owner to ycore;

create sequence organization_id_seq;

alter sequence organization_id_seq owner to ycore;

create sequence payment_method_id_seq;

alter sequence payment_method_id_seq owner to ycore;

create sequence permissions_id_seq;

alter sequence permissions_id_seq owner to ycore;

create sequence province_id_seq;

alter sequence province_id_seq owner to ycore;

create sequence public_profile_id_seq;

alter sequence public_profile_id_seq owner to ycore;

create sequence role_id_seq;

alter sequence role_id_seq owner to ycore;

create sequence room_category_id_seq;

alter sequence room_category_id_seq owner to ycore;

create sequence room_facility_id_seq;

alter sequence room_facility_id_seq owner to ycore;

create sequence room_schema_id_seq;

alter sequence room_schema_id_seq owner to ycore;

create sequence setting_id_seq;

alter sequence setting_id_seq owner to ycore;

create sequence sub_setting_id_seq;

alter sequence sub_setting_id_seq owner to ycore;

create sequence table_category_id_seq;

alter sequence table_category_id_seq owner to ycore;

create sequence table_facility_id_seq;

alter sequence table_facility_id_seq owner to ycore;

create sequence table_schema_id_seq;

alter sequence table_schema_id_seq owner to ycore;

create sequence users_id_seq;

alter sequence users_id_seq owner to ycore;

create table addon_category
(
    id          bigint                not null
        primary key,
    created_by  varchar(255),
    created_on  timestamp,
    is_deleted  boolean default false not null,
    modified_by varchar(255),
    modified_on timestamp,
    sort_order  integer default 0     not null,
    slug        varchar(80)           not null
        constraint tb_addon_category_uk_slug
            unique,
    title       varchar(80)
);

alter table addon_category
    owner to ycore;

create table address_lookup
(
    id       bigint      not null
        primary key,
    city     varchar(50),
    country  varchar(50),
    district varchar(50),
    slug     varchar(80) not null
        constraint tb_address_lookup_uk_slug
            unique,
    state    varchar(50),
    zone     varchar(50)
);

alter table address_lookup
    owner to ycore;

create table article_category
(
    id          bigint                not null
        primary key,
    created_by  varchar(255),
    created_on  timestamp,
    is_deleted  boolean default false not null,
    modified_by varchar(255),
    modified_on timestamp,
    sort_order  integer default 0     not null,
    title       varchar(120)          not null
        constraint tb_article_category_uk_title
            unique
);

alter table article_category
    owner to ycore;

create table business_preference
(
    id            bigint                not null
        primary key,
    created_by    varchar(255),
    created_on    timestamp,
    is_deleted    boolean default false not null,
    modified_by   varchar(255),
    modified_on   timestamp,
    sort_order    integer default 0     not null,
    data_type     varchar(255),
    default_value varchar(255),
    description   text,
    message       varchar(255),
    slug          varchar(80)           not null,
    title         varchar(80)
);

alter table business_preference
    owner to ycore;

create table business_preference_value
(
    id                     bigint                not null
        primary key,
    created_by             varchar(255),
    created_on             timestamp,
    is_deleted             boolean default false not null,
    modified_by            varchar(255),
    modified_on            timestamp,
    sort_order             integer default 0     not null,
    value                  varchar(255),
    business_preference_id bigint
        constraint fk_business_preference_id
            references business_preference
);

alter table business_preference_value
    owner to ycore;

create table files
(
    id          bigint                not null
        primary key,
    created_by  varchar(255),
    created_on  timestamp,
    is_deleted  boolean default false not null,
    modified_by varchar(255),
    modified_on timestamp,
    sort_order  integer default 0     not null,
    caption     varchar(1000),
    description varchar(255),
    ext         varchar(255),
    name        varchar(255),
    path        varchar(400)          not null,
    slug        varchar(150)          not null
        constraint tb_files_uk_slug
            unique,
    type        varchar(50)
);

alter table files
    owner to ycore;

create table branch_service
(
    id          bigint                not null
        primary key,
    created_by  varchar(255),
    created_on  timestamp,
    is_deleted  boolean default false not null,
    modified_by varchar(255),
    modified_on timestamp,
    sort_order  integer default 0     not null,
    description text,
    slug        varchar(80)           not null
        constraint tb_branch_service_uk_slug
            unique,
    title       varchar(80),
    icon_img_id bigint
        constraint fk_icon_img_id
            references files
);

alter table branch_service
    owner to ycore;

create table business_type
(
    id          bigint                not null
        primary key,
    created_by  varchar(255),
    created_on  timestamp,
    is_deleted  boolean default false not null,
    modified_by varchar(255),
    modified_on timestamp,
    sort_order  integer default 0     not null,
    description text,
    slug        varchar(80)
        constraint tb_business_type_uk_slug
            unique,
    title       varchar(80),
    icon_img_id bigint
        constraint fk_icon_img_id
            references files
);

alter table business_type
    owner to ycore;

create table contact
(
    id               bigint                not null
        primary key,
    created_by       varchar(255),
    created_on       timestamp,
    is_deleted       boolean default false not null,
    modified_by      varchar(255),
    modified_on      timestamp,
    sort_order       integer default 0     not null,
    detail           varchar(1800),
    email            varchar(85),
    name             varchar(85),
    phone            varchar(15),
    type             varchar(600),
    contact_image_id bigint
        constraint fk_contact_image_id
            references files
);

alter table contact
    owner to ycore;

create table country
(
    id              bigint                not null
        primary key,
    created_by      varchar(255),
    created_on      timestamp,
    is_deleted      boolean default false not null,
    modified_by     varchar(255),
    modified_on     timestamp,
    sort_order      integer default 0     not null,
    area            double precision,
    name            varchar(120)          not null
        constraint uk_country_name
            unique,
    name_local      varchar(120)          not null
        constraint uk_country_name_local
            unique,
    population      double precision,
    short_code      varchar(120)          not null
        constraint uk_country_short_code
            unique,
    flag_img_url_id bigint
        constraint fk_flag_img_url_id
            references files
);

alter table country
    owner to ycore;

create table feedback
(
    id                bigint                not null
        primary key,
    created_by        varchar(255),
    created_on        timestamp,
    is_deleted        boolean default false not null,
    modified_by       varchar(255),
    modified_on       timestamp,
    sort_order        integer default 0     not null,
    detail            varchar(1800),
    email             varchar(85),
    name              varchar(85),
    phone             varchar(15),
    rating            real,
    type              varchar(600),
    feedback_image_id bigint
        constraint fk_feedback_image_id
            references files
);

alter table feedback
    owner to ycore;

create table food_addon
(
    id                bigint                not null
        primary key,
    created_by        varchar(255),
    created_on        timestamp,
    is_deleted        boolean default false not null,
    modified_by       varchar(255),
    modified_on       timestamp,
    sort_order        integer default 0     not null,
    is_default        boolean default false not null,
    price             real,
    slug              varchar(120)          not null
        constraint tb_food_addon_uk_slug
            unique,
    title             varchar(120)          not null
        constraint tb_food_addon_uk_title
            unique,
    food_addon_img_id bigint
        constraint fk_food_addon_img_id
            references files
);

alter table food_addon
    owner to ycore;

create table food_size
(
    id               bigint                not null
        primary key,
    created_by       varchar(255),
    created_on       timestamp,
    is_deleted       boolean default false not null,
    modified_by      varchar(255),
    modified_on      timestamp,
    sort_order       integer default 0     not null,
    is_default       boolean default false not null,
    slug             varchar(120)          not null
        constraint tb_food_size_uk_slug
            unique,
    title            varchar(120)          not null
        constraint tb_food_size_uk_title
            unique,
    food_size_img_id bigint
        constraint fk_food_size_img_id
            references files
);

alter table food_size
    owner to ycore;

create table global_value
(
    id                   bigint                not null
        primary key,
    created_by           varchar(255),
    created_on           timestamp,
    is_deleted           boolean default false not null,
    modified_by          varchar(255),
    modified_on          timestamp,
    sort_order           integer default 0     not null,
    name                 varchar(90)           not null,
    slug                 varchar(90)           not null
        constraint tb_global_value_uk_slug
            unique,
    global_value_logo_id bigint
        constraint fk_global_value_logo_id
            references files
);

alter table global_value
    owner to ycore;

create table global_sub_value
(
    id              bigint                not null
        primary key,
    created_by      varchar(255),
    created_on      timestamp,
    is_deleted      boolean default false not null,
    modified_by     varchar(255),
    modified_on     timestamp,
    sort_order      integer default 0     not null,
    description     text,
    link            varchar(255),
    slug            varchar(120)          not null
        constraint tb_global_sub_value_uk_slug
            unique,
    title           varchar(120)          not null,
    global_value_id bigint
        constraint fk_global_value_id
            references global_value
);

alter table global_sub_value
    owner to ycore;

create table language
(
    id          bigint                not null
        primary key,
    created_by  varchar(255),
    created_on  timestamp,
    is_deleted  boolean default false not null,
    modified_by varchar(255),
    modified_on timestamp,
    sort_order  integer default 0     not null,
    title       varchar(120)          not null
        constraint uk_language_title
            unique,
    title_local varchar(140)          not null
        constraint uk_language_title_local
            unique
);

alter table language
    owner to ycore;

create table country_language
(
    country_id  bigint not null
        constraint fk_country_id
            references country
            on delete cascade,
    language_id bigint not null
        constraint fk_language_id
            references language
            on delete cascade,
    primary key (country_id, language_id)
);

alter table country_language
    owner to ycore;

create table meal_type
(
    id          bigint                not null
        primary key,
    created_by  varchar(255),
    created_on  timestamp,
    is_deleted  boolean default false not null,
    modified_by varchar(255),
    modified_on timestamp,
    sort_order  integer default 0     not null,
    description text,
    slug        varchar(85)           not null
        constraint tb_meal_type_uk_slug
            unique,
    title       varchar(85)
);

alter table meal_type
    owner to ycore;

create table modules
(
    id          bigint                not null
        primary key,
    created_by  varchar(255),
    created_on  timestamp,
    is_deleted  boolean default false not null,
    modified_by varchar(255),
    modified_on timestamp,
    sort_order  integer default 0     not null,
    slug        varchar(85)           not null
        constraint tb_modules_uk_slug
            unique,
    title       varchar(85)           not null
);

alter table modules
    owner to ycore;

create table business_role
(
    id                         bigint                not null
        primary key,
    created_by                 varchar(255),
    created_on                 timestamp,
    is_deleted                 boolean default false not null,
    modified_by                varchar(255),
    modified_on                timestamp,
    sort_order                 integer default 0     not null,
    default_branch_service_ids varchar(255),
    default_module_id          varchar(255),
    description                text,
    slug                       varchar(80)
        constraint tb_business_role_uk_slug
            unique,
    title                      varchar(80),
    module_id                  bigint
        constraint fk_module_id
            references modules
);

alter table business_role
    owner to ycore;

create table business_role_branch_service
(
    business_role_id  bigint not null
        constraint fk_business_role_id
            references business_role
            on delete cascade,
    branch_service_id bigint not null
        constraint fk_branch_service_id
            references branch_service
            on delete cascade,
    primary key (business_role_id, branch_service_id)
);

alter table business_role_branch_service
    owner to ycore;

create table business_type_business_role
(
    business_type_id bigint not null
        constraint fk_business_type_id
            references business_type
            on delete cascade,
    business_role_id bigint not null
        constraint fk_business_role_id
            references business_role
            on delete cascade,
    primary key (business_type_id, business_role_id)
);

alter table business_type_business_role
    owner to ycore;

create table payment_method
(
    id                  bigint                not null
        primary key,
    created_by          varchar(255),
    created_on          timestamp,
    is_deleted          boolean default false not null,
    modified_by         varchar(255),
    modified_on         timestamp,
    sort_order          integer default 0     not null,
    description         text,
    slug                varchar(80)           not null
        constraint tb_payment_method_uk_slug
            unique,
    title               varchar(80)           not null,
    payment_icon_img_id bigint
        constraint fk_payment_icon_img_id
            references files
);

alter table payment_method
    owner to ycore;

create table permissions
(
    id          bigint                not null
        primary key,
    created_by  varchar(255),
    created_on  timestamp,
    is_deleted  boolean default false not null,
    modified_by varchar(255),
    modified_on timestamp,
    sort_order  integer default 0     not null,
    slug        varchar(90)           not null
        constraint tb_permissions_uk_slug
            unique,
    title       varchar(90)
);

alter table permissions
    owner to ycore;

create table province
(
    id          bigint                not null
        primary key,
    created_by  varchar(255),
    created_on  timestamp,
    is_deleted  boolean default false not null,
    modified_by varchar(255),
    modified_on timestamp,
    sort_order  integer default 0     not null,
    area        double precision,
    name        varchar(120)          not null
        constraint uk_province_name
            unique,
    name_local  varchar(120)          not null
        constraint uk_province_name_local
            unique,
    population  double precision,
    country_id  bigint
        constraint fk_country_id
            references country
            on delete cascade
);

alter table province
    owner to ycore;

create table district
(
    id          bigint                not null
        primary key,
    created_by  varchar(255),
    created_on  timestamp,
    is_deleted  boolean default false not null,
    modified_by varchar(255),
    modified_on timestamp,
    sort_order  integer default 0     not null,
    area        double precision,
    name        varchar(120)          not null
        constraint uk_district_name
            unique,
    name_local  varchar(120)          not null
        constraint uk_district_name_local
            unique,
    population  double precision,
    province_id bigint
        constraint fk_province_id
            references province
            on delete cascade
);

alter table district
    owner to ycore;

create table address
(
    id                bigint                not null
        primary key,
    created_by        varchar(255),
    created_on        timestamp,
    is_deleted        boolean default false not null,
    modified_by       varchar(255),
    modified_on       timestamp,
    sort_order        integer default 0     not null,
    formatted_address varchar(80),
    latitude          real,
    line_1            varchar(80),
    line_2            varchar(80),
    longitude         real,
    place_id          varchar(75),
    plus_code         varchar(30),
    postal_code       varchar(50),
    zip_code          varchar(30),
    address_lookup_id bigint
        constraint fk_address_lookup_id
            references address_lookup,
    country_id        bigint
        constraint fk_country_id
            references country,
    district_id       bigint
        constraint fk_district_id
            references district,
    province_id       bigint
        constraint fk_province_id
            references province
);

alter table address
    owner to ycore;

create table address_component
(
    id          bigint                not null
        primary key,
    created_by  varchar(255),
    created_on  timestamp,
    is_deleted  boolean default false not null,
    modified_by varchar(255),
    modified_on timestamp,
    sort_order  integer default 0     not null,
    long_name   varchar(45),
    short_name  varchar(45),
    types       varchar(255),
    address_id  bigint
        constraint fk_address_id
            references address
);

alter table address_component
    owner to ycore;

create table organization
(
    id                               bigint                not null
        primary key,
    created_by                       varchar(255),
    created_on                       timestamp,
    is_deleted                       boolean default false not null,
    modified_by                      varchar(255),
    modified_on                      timestamp,
    sort_order                       integer default 0     not null,
    contact_primary                  varchar(255),
    contact_secondary                varchar(255),
    count                            integer,
    description                      text,
    email                            varchar(120),
    fb_url                           varchar(255),
    insta_url                        varchar(255),
    status                           varchar(255),
    registration_date                date,
    slogan                           varchar(255),
    slug                             varchar(120)          not null
        constraint tb_organization_uk_slug
            unique,
    title                            varchar(120)          not null,
    twt_url                          varchar(255),
    url                              varchar(255),
    yt_url                           varchar(255),
    address_id                       bigint
        constraint fk_address_id
            references address
            on delete restrict,
    business_type_id                 bigint
        constraint fk_business_type_id
            references business_type
            on delete restrict,
    company_registration_document_id bigint
        constraint fk_company_registration_document_id
            references files,
    contact_person_id                bigint,
    logo_thumbnail_img_url_id1       bigint
        constraint fk_logo_thumbnail_img_url_id1
            references files,
    organization_logo_id             bigint
        constraint fk_organization_logo_id
            references files
);

alter table organization
    owner to ycore;

create table business_preference_value_organization
(
    business_preference_value_id bigint not null
        constraint fk_business_preference_value_id
            references business_preference_value
            on delete cascade,
    organization_id              bigint not null
        constraint fk_organization_id
            references organization
            on delete cascade,
    constraint uk_business_preference_value_id_organization_id
        unique (business_preference_value_id, organization_id)
);

alter table business_preference_value_organization
    owner to ycore;

create table organization_branch
(
    id                        bigint                not null
        primary key,
    created_by                varchar(255),
    created_on                timestamp,
    is_deleted                boolean default false not null,
    modified_by               varchar(255),
    modified_on               timestamp,
    sort_order                integer default 0     not null,
    contact_primary           varchar(15),
    contact_secondary         varchar(15),
    description               text,
    email                     varchar(50),
    fb_url                    varchar(255),
    insta_url                 varchar(255),
    status                    varchar(20),
    registration_date         date,
    slug                      varchar(120)          not null
        constraint tb_organization_branch_uk_slug
            unique,
    tiktok_url                varchar(255),
    title                     varchar(120)          not null,
    twt_url                   varchar(255),
    url                       varchar(255),
    yt_url                    varchar(255),
    address_id                bigint
        constraint fk_address_id
            references address
            on delete restrict,
    contact_person_id         bigint,
    cover_img_url_id          bigint
        constraint fk_cover_img_url_id
            references files,
    logo_img_url_id           bigint
        constraint fk_logo_img_url_id
            references files,
    organization_id           bigint
        constraint fk_organization_id
            references organization
            on delete cascade,
    qr_img_url_id             bigint
        constraint fk_qr_img_url_id
            references files,
    thumbnail_img_url_id1     bigint
        constraint fk_thumbnail_img_url_id1
            references files,
    thumbnail_img_url_id2     bigint
        constraint fk_thumbnail_img_url_id2
            references files,
    thumbnail_logo_img_url_id bigint
        constraint fk_thumbnail_logo_img_url_id
            references files
);

alter table organization_branch
    owner to ycore;

create table business_hour
(
    id                     bigint                not null
        primary key,
    created_by             varchar(255),
    created_on             timestamp,
    is_deleted             boolean default false not null,
    modified_by            varchar(255),
    modified_on            timestamp,
    sort_order             integer default 0     not null,
    close_time             time,
    day                    integer               not null,
    open_time              time,
    branch_service_id      bigint
        constraint fk_branch_service_id
            references branch_service
            on delete cascade,
    organization_branch_id bigint
        constraint fk_organization_branch_id
            references organization_branch
            on delete cascade
);

alter table business_hour
    owner to ycore;

create table cuisine
(
    id                        bigint                not null
        primary key,
    created_by                varchar(255),
    created_on                timestamp,
    is_deleted                boolean default false not null,
    modified_by               varchar(255),
    modified_on               timestamp,
    sort_order                integer default 0     not null,
    description               text,
    slug                      varchar(80)           not null
        constraint tb_cuisine_uk_slug
            unique,
    title                     varchar(80)           not null,
    cuisine_img_id            bigint
        constraint fk_cuisine_img_id
            references files,
    cuisine_thumbnail_img_id1 bigint
        constraint fk_cuisine_thumbnail_img_id1
            references files,
    cuisine_thumbnail_img_id2 bigint
        constraint fk_cuisine_thumbnail_img_id2
            references files,
    organization_id           bigint
        constraint fk_organization_id
            references organization
            on delete cascade,
    organization_branch_id    bigint
        constraint fk_organization_branch_id
            references organization_branch
            on delete cascade
);

alter table cuisine
    owner to ycore;

create table flag
(
    id                     bigint                not null
        primary key,
    created_by             varchar(255),
    created_on             timestamp,
    is_deleted             boolean default false not null,
    modified_by            varchar(255),
    modified_on            timestamp,
    sort_order             integer default 0     not null,
    detail                 text,
    email                  varchar(85),
    name                   varchar(85),
    phone                  varchar(15),
    type                   varchar(600),
    flag_image_id          bigint
        constraint fk_flag_image_id
            references files,
    organization_branch_id bigint
        constraint fk_organization_branch_id
            references organization_branch
);

alter table flag
    owner to ycore;

create table food
(
    id                     bigint                not null
        primary key,
    created_by             varchar(255),
    created_on             timestamp,
    is_deleted             boolean default false not null,
    modified_by            varchar(255),
    modified_on            timestamp,
    sort_order             integer default 0     not null,
    description            text,
    price                  real,
    slug                   varchar(120)          not null
        constraint tb_food_uk_slug
            unique,
    title                  varchar(120)          not null
        constraint tb_food_uk_title
            unique,
    food_img_id            bigint
        constraint fk_food_img_id
            references files,
    food_thumbnail_img_id1 bigint
        constraint fk_food_thumbnail_img_id1
            references files,
    food_thumbnail_img_id2 bigint
        constraint fk_food_thumbnail_img_id2
            references files,
    organization_id        bigint
        constraint fk_organization_id
            references organization
            on delete cascade,
    organization_branch_id bigint
        constraint fk_organization_branch_id
            references organization_branch
            on delete cascade
);

alter table food
    owner to ycore;

create table food_category
(
    id                     bigint                not null
        primary key,
    created_by             varchar(255),
    created_on             timestamp,
    is_deleted             boolean default false not null,
    modified_by            varchar(255),
    modified_on            timestamp,
    sort_order             integer default 0     not null,
    description            text,
    slug                   varchar(120)          not null
        constraint tb_food_category_uk_slug
            unique,
    title                  varchar(120)          not null
        constraint tb_food_category_uk_title
            unique,
    organization_id        bigint
        constraint fk_organization_id
            references organization
            on delete cascade,
    organization_branch_id bigint
        constraint fk_organization_branch_id
            references organization_branch
            on delete cascade
);

alter table food_category
    owner to ycore;

create table food_category_cuisine
(
    food_category_id bigint not null
        constraint fk_food_category_id
            references food_category
            on delete cascade,
    cuisine_id       bigint not null
        constraint fk_cuisine_id
            references cuisine
            on delete cascade,
    primary key (food_category_id, cuisine_id)
);

alter table food_category_cuisine
    owner to ycore;

create table food_cuisine
(
    food_id    bigint not null
        constraint fk_food_id
            references food
            on delete cascade,
    cuisine_id bigint not null
        constraint fk_cuisine_id
            references cuisine
            on delete cascade,
    primary key (food_id, cuisine_id)
);

alter table food_cuisine
    owner to ycore;

create table food_food_addon
(
    food_addon_id bigint not null
        constraint fk_food_addon_id
            references food_addon
            on delete cascade,
    food_id       bigint not null
        constraint fk_food_id
            references food
            on delete cascade,
    primary key (food_addon_id, food_id)
);

alter table food_food_addon
    owner to ycore;

create table food_food_category
(
    food_id          bigint not null
        constraint fk_food_id
            references food
            on delete cascade,
    food_category_id bigint not null
        constraint fk_food_category_id
            references food_category
            on delete cascade,
    primary key (food_id, food_category_id)
);

alter table food_food_category
    owner to ycore;

create table food_food_size
(
    food_size_id bigint not null
        constraint fk_food_size_id
            references food_size
            on delete cascade,
    food_id      bigint not null
        constraint fk_food_id
            references food
            on delete cascade,
    primary key (food_size_id, food_id)
);

alter table food_food_size
    owner to ycore;

create table media_library
(
    id                       bigint                not null
        primary key,
    created_by               varchar(255),
    created_on               timestamp,
    is_deleted               boolean default false not null,
    modified_by              varchar(255),
    modified_on              timestamp,
    sort_order               integer default 0     not null,
    media_img_id             bigint
        constraint fk_media_img_id
            references files,
    organization_id          bigint
        constraint fk_organization_id
            references organization
            on delete cascade,
    organization_branch_id   bigint
        constraint fk_organization_branch_id
            references organization_branch
            on delete cascade,
    thumbnail_media_img_1_id bigint
        constraint fk_thumbnail_media_img_1_id
            references files,
    thumbnail_media_img_2_id bigint
        constraint fk_thumbnail_media_img_2_id
            references files
);

alter table media_library
    owner to ycore;

create table article
(
    id                  bigint                not null
        primary key,
    created_by          varchar(255),
    created_on          timestamp,
    is_deleted          boolean default false not null,
    modified_by         varchar(255),
    modified_on         timestamp,
    sort_order          integer default 0     not null,
    detail              text,
    summary             varchar(1000),
    tags                varchar(255),
    title               varchar(255)
        constraint tb_article_uk_title
            unique,
    article_category_id bigint
        constraint fk_article_category_id
            references article_category
            on delete cascade,
    article_img_id      bigint
        constraint fk_article_img_id
            references media_library
);

alter table article
    owner to ycore;

create table article_additional_image
(
    article_id          bigint not null
        constraint fk_article_id
            references article
            on delete cascade,
    additional_image_id bigint not null
        constraint uk_jtw2jo4uaenk4snhw0c912tnj
            unique
        constraint fk_additional_image_id
            references media_library
            on delete cascade
);

alter table article_additional_image
    owner to ycore;

create table organization_branch_branch_service
(
    organization_branch_id bigint not null
        constraint fk_organization_branch_id
            references organization_branch
            on delete cascade,
    branch_service_id      bigint not null
        constraint fk_branch_service_id
            references branch_service
            on delete cascade,
    primary key (organization_branch_id, branch_service_id)
);

alter table organization_branch_branch_service
    owner to ycore;

create table organization_branch_cuisine
(
    organization_branch_id bigint not null
        constraint fk_organization_branch_id
            references organization_branch
            on delete cascade,
    cuisine_id             bigint not null
        constraint fk_cuisine_id
            references cuisine
            on delete cascade,
    primary key (organization_branch_id, cuisine_id)
);

alter table organization_branch_cuisine
    owner to ycore;

create table organization_branch_food
(
    organization_branch_id bigint not null
        constraint fk_organization_branch_id
            references organization_branch
            on delete cascade,
    food_id                bigint not null
        constraint fk_food_id
            references food
            on delete cascade,
    primary key (organization_branch_id, food_id)
);

alter table organization_branch_food
    owner to ycore;

create table organization_branch_food_category
(
    organization_branch_id bigint not null
        constraint fk_organization_branch_id
            references organization_branch
            on delete cascade,
    food_category_id       bigint not null
        constraint fk_food_category_id
            references food_category
            on delete cascade,
    primary key (organization_branch_id, food_category_id)
);

alter table organization_branch_food_category
    owner to ycore;

create table organization_branch_food_menu
(
    organization_branch_id bigint not null
        constraint fk_organization_branch_id
            references organization_branch
            on delete cascade,
    food_menu_id           bigint not null
        constraint tb_organization_branch_food_menu_uk_food_menu_id
            unique
        constraint fk_food_menu_id
            references files
            on delete cascade
);

alter table organization_branch_food_menu
    owner to ycore;

create table organization_branch_gallery
(
    organization_branch_id bigint not null
        constraint fk_organization_branch_id
            references organization_branch
            on delete cascade,
    gallery_id             bigint not null
        constraint uk_gallery_id
            unique
        constraint fk_gallery_id
            references files
            on delete cascade
);

alter table organization_branch_gallery
    owner to ycore;

create table organization_branch_meal_type
(
    organization_branch_id bigint not null
        constraint fk_organization_branch_id
            references organization_branch
            on delete cascade,
    meal_type_id           bigint not null
        constraint fk_meal_type_id
            references meal_type
            on delete cascade,
    primary key (organization_branch_id, meal_type_id)
);

alter table organization_branch_meal_type
    owner to ycore;

create table organization_branch_payment_method
(
    organization_branch_id bigint not null
        constraint fk_organization_branch_id
            references organization_branch
            on delete cascade,
    payment_method_id      bigint not null
        constraint fk_payment_method_id
            references payment_method
            on delete cascade,
    primary key (organization_branch_id, payment_method_id)
);

alter table organization_branch_payment_method
    owner to ycore;

create table organization_branch_thumbnail_food_menu_one
(
    organization_branch_id     bigint not null
        constraint fk_organization_branch_id
            references organization_branch
            on delete cascade,
    thumbnail_food_menu_id_one bigint not null
        constraint uk_thumbnail_food_menu_id_one
            unique
        constraint fk_thumbnail_food_menu_id_one
            references files
            on delete cascade
);

alter table organization_branch_thumbnail_food_menu_one
    owner to ycore;

create table organization_branch_thumbnail_food_menu_two
(
    organization_branch_id     bigint not null
        constraint fk_organization_branch_id
            references organization_branch
            on delete cascade,
    thumbnail_food_menu_id_two bigint not null
        constraint uk_thumbnail_food_menu_id_two
            unique
        constraint fk_thumbnail_food_menu_id_two
            references files
            on delete cascade
);

alter table organization_branch_thumbnail_food_menu_two
    owner to ycore;

create table organization_branch_thumbnail_gallery_one
(
    organization_branch_id   bigint not null
        constraint fk_organization_branch_id
            references organization_branch
            on delete cascade,
    thumbnail_gallery_one_id bigint not null
        constraint uk_thumbnail_gallery_one_id
            unique
        constraint fk_thumbnail_gallery_one_id
            references files
            on delete cascade
);

alter table organization_branch_thumbnail_gallery_one
    owner to ycore;

create table organization_branch_thumbnail_gallery_two
(
    organization_branch_id   bigint not null
        constraint fk_organization_branch_id
            references organization_branch
            on delete cascade,
    thumbnail_gallery_two_id bigint not null
        constraint uk_thumbnail_gallery_two_id
            unique
        constraint fk_thumbnail_gallery_two_id
            references files
            on delete cascade
);

alter table organization_branch_thumbnail_gallery_two
    owner to ycore;

create table organization_cuisine
(
    organization_id bigint not null
        constraint fk_organization_id
            references organization
            on delete cascade,
    cuisine_id      bigint not null
        constraint fk_cuisine_id
            references cuisine
            on delete cascade,
    primary key (organization_id, cuisine_id)
);

alter table organization_cuisine
    owner to ycore;

create table organization_food
(
    organization_id bigint not null
        constraint fk_organization_id
            references organization
            on delete cascade,
    food_id         bigint not null
        constraint fk_food_id
            references food
            on delete cascade,
    primary key (organization_id, food_id)
);

alter table organization_food
    owner to ycore;

create table organization_food_category
(
    organization_id  bigint not null
        constraint fk_organization_id
            references organization
            on delete cascade,
    food_category_id bigint not null
        constraint fk_food_category_id
            references food_category
            on delete cascade,
    primary key (organization_id, food_category_id)
);

alter table organization_food_category
    owner to ycore;

create table organization_media_library
(
    organization_id bigint not null
        constraint fk_organization_id
            references organization
            on delete cascade,
    media_id        bigint not null
        constraint uk_nk8b56q0v5qwrj6t9b6ble4bt
            unique
        constraint fk_media_id
            references files
            on delete cascade
);

alter table organization_media_library
    owner to ycore;

create table organization_media_library_thumbnail_img_1
(
    organization_id          bigint not null
        constraint fk_organization_id
            references organization
            on delete cascade,
    media_thumbnail_img_1_id bigint not null
        constraint uk_rdi83phax5e50ldrlajri9e3e
            unique
        constraint fk_media_thumbnail_img_1_id
            references files
            on delete cascade
);

alter table organization_media_library_thumbnail_img_1
    owner to ycore;

create table organization_media_library_thumbnail_img_2
(
    organization_id          bigint not null
        constraint fk_organization_id
            references organization
            on delete cascade,
    media_thumbnail_img_2_id bigint not null
        constraint uk_msa7ebnyv8graw509pb1e6y3b
            unique
        constraint fk_media_thumbnail_img_2_id
            references files
            on delete cascade
);

alter table organization_media_library_thumbnail_img_2
    owner to ycore;

create table public_profile
(
    id                    bigint                not null
        primary key,
    created_by            varchar(255),
    created_on            timestamp,
    is_deleted            boolean default false not null,
    modified_by           varchar(255),
    modified_on           timestamp,
    sort_order            integer default 0     not null,
    title                 varchar(255)
        constraint tb_public_profile_uk_title
            unique,
    public_profile_img_id bigint
        constraint fk_public_profile_img_id
            references files
);

alter table public_profile
    owner to ycore;

create table organization_branch_public_profile
(
    id                     bigint                not null
        primary key,
    created_by             varchar(255),
    created_on             timestamp,
    is_deleted             boolean default false not null,
    modified_by            varchar(255),
    modified_on            timestamp,
    sort_order             integer default 0     not null,
    url                    varchar(2400),
    organization_branch_id bigint
        constraint fk_organization_branch_id
            references organization_branch
            on delete cascade,
    public_profile_id      bigint
        constraint fk_public_profile_id
            references public_profile
            on delete cascade
);

alter table organization_branch_public_profile
    owner to ycore;

create table role
(
    id          bigint                not null
        primary key,
    created_by  varchar(255),
    created_on  timestamp,
    is_deleted  boolean default false not null,
    modified_by varchar(255),
    modified_on timestamp,
    sort_order  integer default 0     not null,
    role_level  integer,
    slug        varchar(60)           not null
        constraint tb_role_uk_slug
            unique,
    title       varchar(60)
);

alter table role
    owner to ycore;

create table customer
(
    id                bigint                not null
        primary key,
    created_by        varchar(255),
    created_on        timestamp,
    is_deleted        boolean default false not null,
    modified_by       varchar(255),
    modified_on       timestamp,
    sort_order        integer default 0     not null,
    auth_provider     varchar(255),
    contact_primary   varchar(255),
    contact_secondary varchar(255),
    date_of_birth     date,
    email             varchar(255)
        constraint tb_customer_uk_email
            unique,
    gender            varchar(255),
    last_login        timestamp,
    name              varchar(120)          not null
        constraint tb_customer_uk_name
            unique,
    password          varchar(255)          not null,
    provider_id       varchar(255),
    status            varchar(255),
    address_id        bigint
        constraint fk_address_id
            references address
            on delete restrict,
    cover_img_id      bigint
        constraint fk_cover_img_id
            references files,
    national_img_id   bigint
        constraint fk_national_img_id
            references files,
    profile_img_id    bigint
        constraint fk_profile_img_id
            references files,
    role_id           bigint
        constraint fk_role_id
            references role
            on delete restrict
);

alter table customer
    owner to ycore;

create table customer_favorite_organization_branch
(
    customer_id            bigint not null
        constraint fk_customer_id
            references customer
            on delete cascade,
    organization_branch_id bigint not null
        constraint fk_organization_branch_id
            references organization_branch
            on delete cascade
);

alter table customer_favorite_organization_branch
    owner to ycore;

create table role_permission
(
    role_id       bigint not null
        constraint fk_role_id
            references role,
    permission_id bigint not null
        constraint fk_permission_id
            references permissions,
    primary key (role_id, permission_id)
);

alter table role_permission
    owner to ycore;

create table room_category
(
    id                     bigint                not null
        primary key,
    created_by             varchar(255),
    created_on             timestamp,
    is_deleted             boolean default false not null,
    modified_by            varchar(255),
    modified_on            timestamp,
    sort_order             integer default 0     not null,
    description            text,
    slug                   varchar(120)          not null
        constraint tb_room_category_uk_slug
            unique,
    title                  varchar(120)          not null,
    organization_branch_id bigint
        constraint fk_organization_branch_id
            references organization_branch
            on delete cascade,
    room_image_id          bigint
        constraint fk_room_image_id
            references files
);

alter table room_category
    owner to ycore;

create table room_facility
(
    id          bigint                not null
        primary key,
    created_by  varchar(255),
    created_on  timestamp,
    is_deleted  boolean default false not null,
    modified_by varchar(255),
    modified_on timestamp,
    sort_order  integer default 0     not null,
    description text,
    slug        varchar(80)           not null
        constraint tb_room_facility_uk_slug
            unique,
    title       varchar(80)           not null
);

alter table room_facility
    owner to ycore;

create table room_schema
(
    id                   bigint                         not null
        primary key,
    created_by           varchar(255),
    created_on           timestamp,
    is_deleted           boolean          default false not null,
    modified_by          varchar(255),
    modified_on          timestamp,
    sort_order           integer          default 0     not null,
    capacity             integer          default 0,
    cost                 double precision default 0,
    description          text,
    number               integer          default 0,
    slug                 varchar(120)                   not null
        constraint tb_room_schema_uk_slug
            unique,
    title                varchar(120)                   not null,
    room_category_id     bigint
        constraint fk_room_category_id
            references room_category
            on delete restrict,
    room_schema_image_id bigint
        constraint fk_room_schema_image_id
            references files,
    constraint tb_room_schema_uk_number_room_category_id
        unique (number, room_category_id)
);

alter table room_schema
    owner to ycore;

create table room_schema_room_facility
(
    room_schema_id   bigint not null
        constraint fk_room_schema_id
            references room_schema
            on delete cascade,
    room_facility_id bigint not null
        constraint fk_room_facility_id
            references room_facility
            on delete cascade,
    primary key (room_schema_id, room_facility_id)
);

alter table room_schema_room_facility
    owner to ycore;

create table setting
(
    id               bigint                not null
        primary key,
    created_by       varchar(255),
    created_on       timestamp,
    is_deleted       boolean default false not null,
    modified_by      varchar(255),
    modified_on      timestamp,
    sort_order       integer default 0     not null,
    data_type        varchar(80)           not null,
    description      text,
    mode             varchar(255),
    slug             varchar(80)           not null
        constraint tb_setting_uk_slug
            unique,
    title            varchar(80)           not null,
    value            text,
    setting_image_id bigint
        constraint fk_setting_image_id
            references files
);

alter table setting
    owner to ycore;

create table sub_setting
(
    id                   bigint                not null
        primary key,
    created_by           varchar(255),
    created_on           timestamp,
    is_deleted           boolean default false not null,
    modified_by          varchar(255),
    modified_on          timestamp,
    sort_order           integer default 0     not null,
    description          text,
    link                 varchar(255),
    slug                 varchar(80)           not null,
    title                varchar(80)           not null,
    setting_id           bigint
        constraint fk_setting_id
            references setting,
    sub_setting_image_id bigint
        constraint fk_sub_setting_image_id
            references files,
    constraint tb_sub_setting_uk_slug_setting_id
        unique (slug, setting_id)
);

alter table sub_setting
    owner to ycore;

create table table_category
(
    id                     bigint                not null
        primary key,
    created_by             varchar(255),
    created_on             timestamp,
    is_deleted             boolean default false not null,
    modified_by            varchar(255),
    modified_on            timestamp,
    sort_order             integer default 0     not null,
    description            text,
    slug                   varchar(120)          not null
        constraint tb_table_category_uk_slug
            unique,
    title                  varchar(120)          not null,
    organization_branch_id bigint
        constraint fk_organization_branch_id
            references organization_branch
            on delete cascade,
    table_image_id         bigint
        constraint fk_table_image_id
            references files
);

alter table table_category
    owner to ycore;

create table table_facility
(
    id          bigint                not null
        primary key,
    created_by  varchar(255),
    created_on  timestamp,
    is_deleted  boolean default false not null,
    modified_by varchar(255),
    modified_on timestamp,
    sort_order  integer default 0     not null,
    description text,
    slug        varchar(80)           not null
        constraint tb_table_facility_uk_slug
            unique,
    title       varchar(80)           not null
);

alter table table_facility
    owner to ycore;

create table table_schema
(
    id                    bigint                         not null
        primary key,
    created_by            varchar(255),
    created_on            timestamp,
    is_deleted            boolean          default false not null,
    modified_by           varchar(255),
    modified_on           timestamp,
    sort_order            integer          default 0     not null,
    capacity              integer          default 0,
    cost                  double precision default 0,
    description           text,
    number                integer          default 0,
    slug                  varchar(120)                   not null
        constraint tb_table_schema_uk_slug
            unique,
    title                 varchar(120)                   not null,
    table_category_id     bigint
        constraint fk_table_category_id
            references table_category
            on delete restrict,
    table_schema_image_id bigint
        constraint fk_table_schema_image_id
            references files,
    constraint tb_table_schema_uk_number_table_category_id
        unique (number, table_category_id)
);

alter table table_schema
    owner to ycore;

create table table_schema_table_facility
(
    table_schema_id   bigint not null
        constraint fk_table_schema_id
            references table_schema
            on delete cascade,
    table_facility_id bigint not null
        constraint fk_table_facility_id
            references table_facility
            on delete cascade,
    primary key (table_schema_id, table_facility_id)
);

alter table table_schema_table_facility
    owner to ycore;

create table users
(
    id                     bigint                not null
        primary key,
    created_by             varchar(255),
    created_on             timestamp,
    is_deleted             boolean default false not null,
    modified_by            varchar(255),
    modified_on            timestamp,
    sort_order             integer default 0     not null,
    auth_provider          varchar(255),
    contact_primary        varchar(255),
    contact_secondary      varchar(255),
    date_of_birth          date,
    email                  varchar(255)          not null
        constraint tb_users_uk_email
            unique,
    gender                 varchar(255),
    last_login             timestamp,
    name                   varchar(120)          not null,
    password               varchar(255)          not null,
    provider_id            varchar(255),
    status                 varchar(255),
    user_name              varchar(255)          not null
        constraint tb_users_uk_user_name
            unique,
    address_id             bigint
        constraint fk_address_id
            references address
            on delete restrict,
    cover_img_id           bigint
        constraint fk_cover_img_id
            references files,
    national_img_id        bigint
        constraint fk_national_img_id
            references files,
    organization_id        bigint
        constraint fk_organization_id
            references organization
            on delete cascade,
    organization_branch_id bigint
        constraint fk_organization_branch_id
            references organization_branch
            on delete cascade,
    profile_img_id         bigint
        constraint fk_profile_img_id
            references files,
    role_id                bigint
        constraint fk_role_id
            references role
            on delete restrict
);

alter table users
    owner to ycore;

alter table organization
    add constraint fk_contact_person_id
        foreign key (contact_person_id) references users
            on delete restrict;

alter table organization_branch
    add constraint fk_users_id
        foreign key (contact_person_id) references users
            on delete restrict;
