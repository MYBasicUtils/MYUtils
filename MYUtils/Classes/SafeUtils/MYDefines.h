//
//  MYDefines.h
//  MYBookkeeping
//
//  Created by APPLE on 2022/1/28.
//

#ifndef MYDefines_h
#define MYDefines_h

#ifndef my_weakify
    #define my_weakify(object)  __weak __typeof__(object) weak##_##object = object;
#endif

#ifndef my_strongify
    #define my_strongify(object)  __typeof__(object) object = weak##_##object;
#endif

#endif /* MYDefines_h */
