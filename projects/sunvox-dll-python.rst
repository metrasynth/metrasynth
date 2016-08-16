=================================
sunvox-dll-python (:mod:`sunvox`)
=================================

**Github**
    https://github.com/metrasynth/sunvox-dll-python

Python interface to SunVox DLL
==============================

The :mod:`sunvox` module from *sunvox-dll-python* makes use of Python's
:py:mod:`ctypes` module
to provide access to all of the SunVox functions described
in the :file:`sunvox.h` header file.

..  uml::

    @startuml
    rectangle "Python Interpreter" as python {
        rectangle "<your_app>" as app
        rectangle "sunvox\nmodule" as sunvox
        rectangle "ctypes\nmodule" as ctypes
    }
    rectangle "SunVox DLL" as dll
    rectangle "SunVox file" as file1
    rectangle "SunVox file" as file2
    rectangle "Audio out\n(hardware)" as audio
    rectangle "Audio out\n(byte stream)" as stream
    file2 -> app : "files can be loaded\nusing byte strings"
    app <-left-> sunvox
    sunvox <-left-> ctypes
    ctypes <-> dll
    file1 -up-> dll : "files can be\nloaded directly"
    dll -> audio : "SunVox can output\naudio directly"
    app -> audio : "Audio can also be\nread from a buffer"
    app -> stream
    @enduml
