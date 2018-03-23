cimport numpy as np
from cvtype cimport *

cdef Mat nparray2cvmat(np.ndarray ary)
cdef np.ndarray cvmat2nparray(Mat &inmat)

cdef Rect pylist2cvrect(tuple rectlist)
cdef tuple cvrect2pylist(Rect &rect)
