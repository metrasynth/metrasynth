==========================
Radiant Voices (:mod:`rv`)
==========================

**Github**
    https://github.com/metrasynth/rv

Python interface to SunVox DLL
==============================

:mod:`rv` makes use of Python's :py:mod:`ctypes` module
to provide access to all of the SunVox functions described
in the :file:`sunvox.h` header file.

..  uml::

    @startuml
    rectangle "Python Interpreter" as python {
        rectangle "<your_app>" as app
        rectangle "rv" as rv
        rectangle "ctypes" as ctypes
    }
    rectangle "SunVox DLL" as dll
    rectangle "SunVox file" as file1
    rectangle "SunVox file" as file2
    rectangle "Audio out\n(hardware)" as audio
    rectangle "Audio out\n(byte stream)" as stream
    file2 -> app : "files can be loaded\nusing byte strings"
    app <-left-> rv
    rv <-left-> ctypes
    ctypes <-> dll
    file1 -up-> dll : "files can be\nloaded directly"
    dll -> audio : "SunVox can output\naudio directly"
    app -> audio : "Audio can also be\nread from a buffer"
    app -> stream
    @enduml

Python interface to SunVox file format
======================================

The ``.sunvox`` and ``.sunsynth`` file formats follow the
`IFF`_ container format. Python's :py:mod:`chunk` module
handles reading and writing that format, and :mod:`rv`
provides a *SunVox file reader*, a *SunVox file writer* [#]_,
and a *SunVox object model*.

..  _IFF:
    https://en.wikipedia.org/wiki/Interchange_File_Format

..  note::

    The interpretation of SunVox file formats is based on "clean room"
    style inspection of what SunVox writes to disk when a file is edited
    a certain way.

    There is currently no official documentation regarding the SunVox
    file format [#]_, but until such time there is, :mod:`rv` intends to
    act as a *de facto* source of documentation about the format.

..  _"File format .sunvox" thread:
    http://www.warmplace.ru/forum/viewtopic.php?t=1943#p5562

..  uml::

    @startuml
    rectangle "Python Interpreter" as python {
        rectangle "<your_app>" as app {
            rectangle "file object\nmodel" as obj
        }
        rectangle "rv" as rv
        rectangle "chunk" as chunk
    }
    rectangle "SunVox file" as file
    file <-> chunk
    chunk <-> rv
    rv <-left-> obj
    @enduml


Footnotes
=========

..  [#] Work on the file writer has not yet begun.

..  [#] See the `"File format .sunvox" thread`_.
