==========================
Radiant Voices (:mod:`rv`)
==========================

**Github**
    https://github.com/metrasynth/radiant-voices


Create, modify, read, and write SunVox files
============================================

..  uml::

    @startuml
    rectangle "Python Interpreter" as python {
        rectangle "<your_app>" as app {
            rectangle "rv object\nmodel" as obj
        }
        rectangle "rv" as rv
        rectangle "chunk" as chunk
    }
    rectangle "SunVox file\nor buffer" as file
    file -> chunk
    chunk -> rv
    rv <-left-> obj
    rv -> file
    @enduml


Data structures
===============

:mod:`rv` aims to provide:

- A set of data structures covering 100% of the SunVox file format.

- Functional and object-oriented ways of creating and manipulating
  those structures.


Read SunVox files
=================

The ``.sunvox`` and ``.sunsynth`` file formats follow the
`IFF`_ container format.

..  _IFF:
    https://en.wikipedia.org/wiki/Interchange_File_Format

:mod:`rv` leverages Python's :py:mod:`chunk` to read that format
and translate it to in-memory data structures.


Write SunVox files
==================

Once structures are ready to play, :mod:`rv` will allow writing
to a file or buffer using the ``.sunvox`` or ``.sunsynth`` format. [#]_


Document the SunVox file format
===============================

There is currently no official documentation regarding the SunVox
file format [#]_.

Until such time there is, :mod:`rv` intends to
serve as a *de facto* source of documentation about the format.

The interpretation of SunVox file formats is based on "clean room"
style inspection of what SunVox writes to disk when a file is edited
a specific way.


Footnotes
=========

..  [#] Work on the file writer has not yet begun.

..  [#] See the `"File format .sunvox" thread`_.

..  _"File format .sunvox" thread:
    http://www.warmplace.ru/forum/viewtopic.php?t=1943#p5562
