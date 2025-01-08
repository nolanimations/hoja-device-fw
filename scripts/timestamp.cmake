file(WRITE ${OUTPUTDIR}/timestamp.h
"#ifndef BUILD_TIMESTAMP_H
#define BUILD_TIMESTAMP_H

#include <stdint.h>
#define BUILD_TIMESTAMP ((uint32_t)@UNIX_TIMESTAMP@)

#endif /* BUILD_TIMESTAMP_H */
")

string(TIMESTAMP UNIX_TIMESTAMP "%s" UTC)

configure_file(
    ${OUTPUTDIR}/timestamp.h
    ${OUTPUTDIR}/timestamp.h
    @ONLY
)