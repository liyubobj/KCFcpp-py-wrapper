from cvt cimport *
from libcpp cimport bool, float

cdef extern from "../src/kcftracker.hpp":
    cdef cppclass KCFTracker:
        KCFTracker(bool, bool, bool, bool, float)
        void init(Mat, Rect)
        bool update(Mat, Rect)
        
cdef class kcftracker:
    cdef KCFTracker *classptr
    
    def __cinit__(self, hog, fixed_window, multiscale, lab, threshold):
        self.classptr = new KCFTracker(hog, fixed_window, multiscale, lab, threshold)
        
    def __dealloc(self):
        del self.classptr
        
    def init(self, ary, rectlist):
        self.classptr.init(nparray2cvmat(ary), pylist2cvrect(rectlist))
        
    def update(self, ary):
        cvrect = pylist2cvrect((0, 0, 0, 0))
        ok = self.classptr.update(nparray2cvmat(ary), cvrect)
        return ok, cvrect2pylist(cvrect)
