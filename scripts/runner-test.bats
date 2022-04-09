#!/usr/bin/env bats

load 'libs/bats-support/load'
load 'libs/bats-assert/load'

setup() {
    INDEX=$((${BATS_TEST_NUMBER} - 1))
    echo "##### setup ${BATS_TEST_NAME}\n"
    echo "# BATS_TEST_NAME:        ${BATS_TEST_NAME}"
    echo "BATS_TEST_FILENAME:    ${BATS_TEST_FILENAME}"
    echo "BATS_TEST_DIRNAME:     ${BATS_TEST_DIRNAME}"
    echo "BATS_TEST_NAMES:       ${BATS_TEST_NAMES[$INDEX]}"
    echo "BATS_TEST_DESCRIPTION: ${BATS_TEST_DESCRIPTION}"
    echo "BATS_TEST_NUMBER:      ${BATS_TEST_NUMBER}"
    echo "BATS_TMPDIR:           ${BATS_TMPDIR}"
}


teardown() {
    echo -e "##### teardown ${BATS_TEST_NAME}\n"
}


@test "Should return the correct version" {
    run bash ./scripts/example.sh
    assert_equal ${status} 0
    assert_equal ${output} "0.1.0"
}
