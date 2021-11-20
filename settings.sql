INSERT INTO
    laptop(
        model_name,
        model_name,
        last_seen_date,
        seen_count
    )
VALUES
    ('0001', NULL, NOW(), 10);

SET
    FOREIGN_KEY_CHECKS = 0;

SET
    FOREIGN_KEY_CHECKS = 1;

INSERT INTO
    laptop (
        model_name,
        operating_system,
        color,
        screen_size_inch,
        processor_brand,
        core_count,
        hard_drive_size,
        ram_size
    )
VALUES
    (
        'NT350XCR-AD5WS',
        'Freedos',
        'White',
        15.6,
        'Intel',
        4,
        256,
        8
    );