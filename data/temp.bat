+++++++++++
Python News
+++++++++++

What's New in Python 3.6.5 final?
=================================

*Release date: 2018-03-28*

Tests
-----

- bpo-32872: Avoid regrtest compatibility issue with namespace packages.

Build
-----

- bpo-33163: Upgrade pip to 9.0.3 and setuptools to v39.0.1.


What's New in Python 3.6.5 release candidate 1?
===============================================

*Release date: 2018-03-13*

Security
--------

- bpo-33001: Minimal fix to prevent buffer overrun in os.symlink on Windows

- bpo-32981: Regexes in difflib and poplib were vulnerable to catastrophic
  backtracking. These regexes formed potential DOS vectors (REDOS). They
  have been refactored. This resolves CVE-2018-1060 and CVE-2018-1061. Patch
  by Jamie Davis.

Core and Builtins
-----------------

- bpo-33026: Fixed jumping out of "with" block by setting f_lineno.

- bpo-17288: Prevent jumps from 'return' and 'exception' trace events.

- bpo-32889: Update Valgrind suppression list to account for the rename of
  ``Py_ADDRESS_IN_RANG`` to ``address_in_range``.

- bpo-32650: Pdb and other debuggers dependent on bdb.py will correctly step
  over (next command) native coroutines. Patch by Pablo Galindo.

- bpo-32685: Improve suggestion when the Python 2 form of print statement is
  either present on the same line as the header of a compound statement or
  else terminated by a semi-colon instead of a newline. Patch by Nitish
  Chandra.

- bpo-32583: Fix possible crashing in builtin Unicode decoders caused by
  write out-of- bound errors when using customized decode error handlers.

- bpo-26163: Improved frozenset() hash to create more distinct hash values
  when faced with datasets containing many similar values.

- bpo-27169: The ``__debug__`` constant is now optimized out at compile
  time. This fixes also bpo-22091.

- bpo-32329: ``sys.flags.hash_randomization`` is now properly set to 0 when
  hash randomization is turned off by ``PYTHONHASHSEED=0``.

- bpo-30416: The optimizer is now protected from spending much time doing
  complex calculations and consuming much memory for creating large
  constants in constant folding.

- bpo-18533: ``repr()`` on a dict containing its own ``values()`` or
  ``items()`` no longer raises ``RecursionError``; OrderedDict similarly.
  Instead, use ``...``, as for other recursive structures.  Patch by Ben
  North.

- bpo-32028: Leading whitespace is now correctly ignored when generating
  suggestions for converting Py2 print statements to Py3 builtin print
  function calls. Patch by Sanyam Khurana.

- bpo-32137: The repr of deeply nested dict now raises a RecursionError
  instead of crashing due to a stack overflow.

Library
-------

- bpo-33064: lib2to3 now properly supports trailing commas after ``*args``
  and ``**kwargs`` in function signatures.

- bpo-31804: Avoid failing in multiprocessing.Process if the standard
  streams are closed or None at exit.

- bpo-33037: Skip sending/receiving data after SSL transport closing.

- bpo-30353: Fix ctypes pass-by-value for structs on 64-bit Cygwin/MinGW.

- bpo-33009: Fix inspect.signature() for single-parameter partialmethods.

- bpo-32969: Expose several missing constants in zlib and fix corresponding
  documentation.

- bpo-32713: Fixed tarfile.itn handling of out-of-bounds float values. Patch
  by Joffrey Fuhrer.

- bpo-30622: The ssl module now detects missing NPN support in LibreSSL.

- bpo-32922: dbm.open() now encodes filename with the filesystem encoding
  rather than default encoding.

- bpo-32859: In ``os.dup2``, don't check every call whether the ``dup3``
  syscall exists or not.

- bpo-21060: Rewrite confusing message from setup.py upload from "No dist
  file created in earlier command" to the more helpful "Must create and
  upload files in one command".

- bpo-32857: In :mod:`tkinter`, ``after_cancel(None)`` now raises a
  :exc:`ValueError` instead of canceling the first scheduled function.
  Patch by Cheryl Sabella.

- bpo-32852: Make sure sys.argv remains as a list when running trace.

- bpo-32841: Fixed `asyncio.Condition` issue which silently ignored
  cancellation after notifying and cancelling a conditional lock. Patch by
  Bar Harel.

- bpo-31787: Fixed refleaks of ``__init__()`` methods in various modules.
  (Contributed by Oren Milman)

- bpo-30157: Fixed guessing quote and delimiter in csv.Sniffer.sniff() when
  only the last field is quoted.  Patch by Jake Davis.

- bpo-32394: socket: Remove TCP_FASTOPEN, TCP_KEEPCNT flags on older version
  Windows during run-time.

- bpo-32777: Fix a rare but potential pre-exec child process deadlock in
  subprocess on POSIX systems when marking file descriptors inheritable on
  exec in the child process.  This bug appears to have been introduced in
  3.4.

- bpo-32647: The ctypes module used to depend on indirect linking for
  dlopen. The shared extension is now explicitly linked against libdl on
  platforms with dl.

- bpo-32734: Fixed ``asyncio.Lock()`` safety issue which allowed acquiring
  and locking the same lock multiple times, without it being free. Patch by
  Bar Harel.

- bpo-32727: Do not include name field in SMTP envelope from address. Patch
  by Stéphane Wirtel

- bpo-27931: Fix email address header parsing error when the username is an
  empty quoted string. Patch by Xiang Zhang.

- bpo-32304: distutils' upload command no longer corrupts tar files ending
  with a CR byte, and no longer tries to convert CR to CRLF in any of the
  upload text fields.

- bpo-32502: uuid.uuid1 no longer raises an exception if a 64-bit hardware
  address is encountered.

- bpo-31848: Fix the error handling in Aifc_read.initfp() when the SSND
  chunk is not found. Patch by Zackery Spytz.

- bpo-32555: On FreeBSD and Solaris, os.strerror() now always decode the
  byte string from the current locale encoding, rather than using
  ASCII/surrogateescape in some cases.

- bpo-32521: The nis module is now compatible with new libnsl and headers
  location.

- bpo-32473: Improve ABCMeta._dump_registry() output readability

- bpo-32521: glibc has removed Sun RPC. Use replacement libtirpc headers and
  library in nis module.

- bpo-32228: Ensure that ``truncate()`` preserves the file position (as
  reported by ``tell()``) after writes longer than the buffer size.

- bpo-26133: Don't unsubscribe signals in asyncio UNIX event loop on
  interpreter shutdown.

- bpo-32185: The SSL module no longer sends IP addresses in SNI TLS
  extension on platforms with OpenSSL 1.0.2+ or inet_pton.

- bpo-32323: :func:`urllib.parse.urlsplit()` does not convert zone-id
  (scope) to lower case for scoped IPv6 addresses in hostnames now.

- bpo-32302: Fix bdist_wininst of distutils for CRT v142: it binary
  compatible with CRT v140.

- bpo-32255: A single empty field is now always quoted when written into a
  CSV file. This allows to distinguish an empty row from a row consisting of
  a single empty field. Patch by Licht Takeuchi.

- bpo-32277: Raise ``NotImplementedError`` instead of ``SystemError`` on
  platforms where ``chmod(..., follow_symlinks=False)`` is not supported.
  Patch by Anthony Sottile.

- bpo-32199: The getnode() ip getter now uses 'ip link' instead of 'ip link
  list'.

- bpo-27456: Ensure TCP_NODELAY is set on Linux. Tests by Victor Stinner.

- bpo-31900: The :func:`locale.localeconv` function now sets temporarily the
  ``LC_CTYPE`` locale to the ``LC_NUMERIC`` locale to decode
  ``decimal_point`` and ``thousands_sep`` byte strings if they are non-ASCII
  or longer than 1 byte, and the ``LC_NUMERIC`` locale is different than the
  ``LC_CTYPE`` locale. This temporary change affects other threads.

  Same change for the :meth:`str.format` method when formatting a number
  (:class:`int`, :class:`float`, :class:`float` and subclasses) with the
  ``n`` type (ex: ``'{:n}'.format(1234)``).

- bpo-31802: Importing native path module (``posixpath``, ``ntpath``) now
  works even if the ``os`` module still is not imported.

Documentation
-------------

- bpo-17232: Clarify docs for -O and -OO.  Patch by Terry Reedy.

- bpo-32800: Update link to w3c doc for xml default namespaces.

- bpo-8722: Document :meth:`__getattr__` behavior when property :meth:`get`
  method raises :exc:`AttributeError`.

- bpo-32614: Modify RE examples in documentation to use raw strings to
  prevent :exc:`DeprecationWarning` and add text to REGEX HOWTO to highlight
  the deprecation.

- bpo-31972: Improve docstrings for `pathlib.PurePath` subclasses.

- bpo-17799: Explain real behaviour of sys.settrace and sys.setprofile and
  their C-API counterparts regarding which type of events are received in
  each function. Patch by Pablo Galindo Salgado.

Tests
-----

- bpo-32517: Fix failing ``test_asyncio`` on macOS 10.12.2+ due to transport
  of ``KqueueSelector`` loop was not being closed.

- bpo-32721: Fix test_hashlib to not fail if the _md5 module is not built.

- bpo-32252: Fix faulthandler_suppress_crash_report() used to prevent core
  dump files when testing crashes. getrlimit() returns zero on success.

- bpo-31518: Debian Unstable has disabled TLS 1.0 and 1.1 for
  SSLv23_METHOD(). Change TLS/SSL protocol of some tests to PROTOCOL_TLS or
  PROTOCOL_TLSv1_2 to make them pass on Debian.

Build
-----

- bpo-32635: Fix segfault of the crypt module when libxcrypt is provided
  instead of libcrypt at the system.

Windows
-------

- bpo-33016: Fix potential use of uninitialized memory in
  nt._getfinalpathname

- bpo-32903: Fix a memory leak in os.chdir() on Windows if the current
  directory is set to a UNC path.

- bpo-31966: Fixed WindowsConsoleIO.write() for writing empty data.

- bpo-32409: Ensures activate.bat can handle Unicode contents.

- bpo-32457: Improves handling of denormalized executable path when
  launching Python.

- bpo-32370: Use the correct encoding for ipconfig output in the uuid
  module. Patch by Segev Finer.

- bpo-29248: Fix :func:`os.readlink` on Windows, which was mistakenly
  treating the ``PrintNameOffset`` field of the reparse data buffer as a
  number of characters instead of bytes. Patch by Craig Holmquist and SSE4.

- bpo-32588: Create standalone _distutils_findvs module.

macOS
-----

- bpo-32726: Provide an additional, more modern macOS installer variant that
  supports macOS 10.9+ systems in 64-bit mode only. Upgrade the supplied
  third-party libraries to OpenSSL 1.0.2n, XZ 5.2.3, and SQLite 3.22.0. The
  10.9+ installer now links with and supplies its own copy of Tcl/Tk 8.6.8.

IDLE
----

- bpo-32984: Set ``__file__`` while running a startup file.  Like Python,
  IDLE optionally runs one startup file in the Shell window before
  presenting the first interactive input prompt.  For IDLE, ``-s`` runs a
  file named in environmental variable  :envvar:`IDLESTARTUP` or
  :envvar:`PYTHONSTARTUP`; ``-r file`` runs ``file``.  Python sets
  ``__file__`` to the startup file name before running the file and unsets
  it before the first prompt.  IDLE now does the same when run normally,
  without the ``-n`` option.

- bpo-32940: Simplify and rename StringTranslatePseudoMapping in pyparse.

- bpo-32916: Change ``str`` to ``code`` in pyparse.

- bpo-32905: Remove unused code in pyparse module.

- bpo-32874: Add tests for pyparse.

- bpo-32837: Using the system and place-dependent default encoding for
  open() is a bad idea for IDLE's system and location-independent files.

- bpo-32826: Add "encoding=utf-8" to open() in IDLE's test_help_about. GUI
  test test_file_buttons() only looks at initial ascii-only lines, but
  failed on systems where open() defaults to 'ascii' because readline()
  internally reads and decodes far enough ahead to encounter a non-ascii
  character in CREDITS.txt.

- bpo-32765: Update configdialog General tab docstring to add new widgets to
  the widget list.

Tools/Demos
-----------

- bpo-24960: 2to3 and lib2to3 can now read pickled grammar files using
  pkgutil.get_data() rather than probing the filesystem. This lets 2to3 and
  lib2to3 work when run from a zipfile.

- bpo-32222: Fix pygettext not extracting docstrings for functions with type
  annotated arguments. Patch by Toby Harradine.

C API
-----

- bpo-29084: Undocumented C API for OrderedDict has been excluded from the
  limited C API. It was added by mistake and actually never worked in the
  limited C API.


What's New in Python 3.6.4 final?
=================================

*Release date: 2017-12-18*

There were no new code changes in version 3.6.4 since v3.6.4rc1.



What's New in Python 3.6.4 release candidate 1?
===============================================

*Release date: 2017-12-05*

Core and Builtins
-----------------

- bpo-32176: co_flags.CO_NOFREE is now always set correctly by the code
  object constructor based on freevars and cellvars, rather than needing to
  be set correctly by the caller. This ensures it will be cleared
  automatically when additional cell references are injected into a modified
  code object and function.

- bpo-31949: Fixed several issues in printing tracebacks
  (PyTraceBack_Print()).

  * Setting sys.tracebacklimit to 0 or less now suppresses printing tracebacks.
  * Setting sys.tracebacklimit to None now causes using the default limit.
  * Setting sys.tracebacklimit to an integer larger than LONG_MAX now means using
    the limit LONG_MAX rather than the default limit.
  * Fixed integer overflows in the case of more than 2**31 traceback items on
    Windows.
  * Fixed output errors handling.

- bpo-30696: Fix the interactive interpreter looping endlessly when no
  memory.

- bpo-20047: Bytearray methods partition() and rpartition() now accept only
  bytes-like objects as separator, as documented.  In particular they now
  raise TypeError rather of returning a bogus result when an integer is
  passed as a separator.

- bpo-31852: Fix a segmentation fault caused by a combination of the async
  soft keyword and continuation lines.

- bpo-21720: BytesWarning no longer emitted when the *fromlist* argument of
  ``__import__()`` or the ``__all__`` attribute of the module contain bytes
  instances.

- bpo-31825: Fixed OverflowError in the 'unicode-escape' codec and in
  codecs.escape_decode() when decode an escaped non-ascii byte.

- bpo-28603: Print the full context/cause chain of exceptions on interpreter
  exit, even if an exception in the chain is unhashable or compares equal to
  later ones. Patch by Zane Bitter.

- bpo-31786: Fix timeout rounding in the select module to round correctly
  negative timeouts between -1.0 and 0.0. The functions now block waiting
  for events as expected. Previously, the call was incorrectly non-blocking.
  Patch by Pablo Galindo.

- bpo-31642: Restored blocking "from package import module" by setting
  sys.modules["package.module"] to None.

- bpo-31626: Fixed a bug in debug memory allocator.  There was a write to
  freed memory after shrinking a memory block.

- bpo-31619: Fixed a ValueError when convert a string with large number of
  underscores to integer with binary base.

- bpo-31592: Fixed an assertion failure in Python parser in case of a bad
  `unicodedata.normalize()`. Patch by Oren Milman.

- bpo-31588: Raise a `TypeError` with a helpful error message when class
  creation fails due to a metaclass with a bad ``__prepare__()`` method.
  Patch by Oren Milman.

- bpo-31566: Fix an assertion failure in `_warnings.warn()` in case of a bad
  ``__name__`` global. Patch by Oren Milman.

- bpo-31505: Fix an assertion failure in `json`, in case
  `_json.make_encoder()` received a bad `encoder()` argument. Patch by Oren
  Milman.

- bpo-31492: Fix assertion failures in case of failing to import from a
  module with a bad ``__name__`` attribute, and in case of failing to access
  an attribute of such a module. Patch by Oren Milman.

- bpo-31490: Fix an assertion failure in `ctypes` class definition, in case
  the class has an attribute whose name is specified in ``_anonymous_`` but
  not in ``_fields_``. Patch by Oren Milman.

- bpo-31478: Fix an assertion failure in `_random.Random.seed()` in case the
  argument has a bad ``__abs__()`` method. Patch by Oren Milman.

- bpo-31315: Fix an assertion failure in imp.create_dynamic(), when
  spec.name is not a string. Patch by Oren Milman.

- bpo-31311: Fix a crash in the ``__setstate__()`` method of
  `ctypes._CData`, in case of a bad ``__dict__``. Patch by Oren Milman.

- bpo-31293: Fix crashes in true division and multiplication of a timedelta
  object by a float with a bad as_integer_ratio() method. Patch by Oren
  Milman.

- bpo-31285: Fix an assertion failure in `warnings.warn_explicit`, when the
  return value of the received loader's get_source() has a bad splitlines()
  method. Patch by Oren Milman.

- bpo-30817: `PyErr_PrintEx()` clears now the ignored exception that may be
  raised by `_PySys_SetObjectId()`, for example when no memory.

Library
-------

- bpo-28556: Two minor fixes for ``typing`` module: allow shallow copying
  instances of generic classes, improve interaction of ``__init_subclass__``
  with generics. Original PRs by Ivan Levkivskyi.

- bpo-27240: The header folding algorithm for the new email policies has
  been rewritten, which also fixes bpo-30788, bpo-31831, and bpo-32182.  In
  particular, RFC2231 folding is now done correctly.

- bpo-32186: io.FileIO.readall() and io.FileIO.read() now release the GIL
  when getting the file size. Fixed hang of all threads with inaccessible
  NFS server. Patch by Nir Soffer.

- bpo-12239: Make :meth:`msilib.SummaryInformation.GetProperty` return
  ``None`` when the value of property is ``VT_EMPTY``.  Initial patch by
  Mark Mc Mahon.

- bpo-31325: Fix wrong usage of :func:`collections.namedtuple` in the
  :meth:`RobotFileParser.parse() <urllib.robotparser.RobotFileParser.parse>`
  method.

  Initial patch by Robin Wellner.

- bpo-12382: :func:`msilib.OpenDatabase` now raises a better exception
  message when it couldn't open or create an MSI file.  Initial patch by
  William Tisäter.

- bpo-32110: ``codecs.StreamReader.read(n)`` now returns not more than *n*
  characters/bytes for non-negative *n*. This makes it compatible with
  ``read()`` methods of other file-like objects.

- bpo-32072: Fixed issues with binary plists:

  * Fixed saving bytearrays.
  * Identical objects will be saved only once.
  * Equal references will be load as identical objects.
  * Added support for saving and loading recursive data structures.

- bpo-32034: Make asyncio.IncompleteReadError and LimitOverrunError
  pickleable.

- bpo-32015: Fixed the looping of asyncio in the case of reconnection the
  socket during waiting async read/write from/to the socket.

- bpo-32011: Restored support of loading marshal files with the TYPE_INT64
  code. These files can be produced in Python 2.7.

- bpo-31970: Reduce performance overhead of asyncio debug mode.

- bpo-9678: Fixed determining the MAC address in the uuid module:

  * Using ifconfig on NetBSD and OpenBSD.
  * Using arp on Linux, FreeBSD, NetBSD and OpenBSD.

  Based on patch by Takayuki Shimizukawa.

- bpo-30057: Fix potential missed signal in signal.signal().

- bpo-31933: Fix Blake2 params leaf_size and node_offset on big endian
  platforms. Patch by Jack O'Connor.

- bpo-31927: Fixed compilation of the socket module on NetBSD 8.  Fixed
  assertion failure or reading arbitrary data when parse a AF_BLUETOOTH
  address on NetBSD and DragonFly BSD.

- bpo-27666: Fixed stack corruption in curses.box() and curses.ungetmouse()
  when the size of types chtype or mmask_t is less than the size of C long.
  curses.box() now accepts characters as arguments.  Based on patch by Steve
  Fink.

- bpo-31897: plistlib now catches more errors when read binary plists and
  raises InvalidFileException instead of unexpected exceptions.

- bpo-25720: Fix the method for checking pad state of curses WINDOW. Patch
  by Masayuki Yamamoto.

- bpo-31893: Fixed the layout of the kqueue_event structure on OpenBSD and
  NetBSD. Fixed the comparison of the kqueue_event objects.

- bpo-31891: Fixed building the curses module on NetBSD.

- bpo-28416: Instances of pickle.Pickler subclass with the persistent_id()
  method and pickle.Unpickler subclass with the persistent_load() method no
  longer create reference cycles.

- bpo-28326: Fix multiprocessing.Process when stdout and/or stderr is closed
  or None.

- bpo-31457: If nested log adapters are used, the inner ``process()``
  methods are no longer omitted.

- bpo-31457: The ``manager`` property on LoggerAdapter objects is now
  properly settable.

- bpo-31806: Fix timeout rounding in time.sleep(), threading.Lock.acquire()
  and socket.socket.settimeout() to round correctly negative timeouts
  between -1.0 and 0.0. The functions now block waiting for events as
  expected. Previously, the call was incorrectly non-blocking. Patch by
  Pablo Galindo.

- bpo-28603: traceback: Fix a TypeError that occurred during printing of
  exception tracebacks when either the current exception or an exception in
  its context/cause chain is unhashable. Patch by Zane Bitter.

- bpo-30058: Fixed buffer overflow in select.kqueue.control().

- bpo-31770: Prevent a crash when calling the ``__init__()`` method of a
  ``sqlite3.Cursor`` object more than once. Patch by Oren Milman.

- bpo-31672: ``idpattern`` in ``string.Template`` matched some non-ASCII
  characters. Now it uses ``-i`` regular expression local flag to avoid non-
  ASCII characters.

- bpo-31764: Prevent a crash in ``sqlite3.Cursor.close()`` in case the
  ``Cursor`` object is uninitialized. Patch by Oren Milman.

- bpo-31752: Fix possible crash in timedelta constructor called with custom
  integers.

- bpo-31701: On Windows, faulthandler.enable() now ignores MSC and COM
  exceptions.

- bpo-31728: Prevent crashes in `_elementtree` due to unsafe cleanup of
  `Element.text` and `Element.tail`. Patch by Oren Milman.

- bpo-31620: an empty asyncio.Queue now doesn't leak memory when queue.get
  pollers timeout

- bpo-31632: Fix method set_protocol() of class _SSLProtocolTransport in
  asyncio module. This method was previously modifying a wrong reference to
  the protocol.

- bpo-31675: Fixed memory leaks in Tkinter's methods splitlist() and split()
  when pass a string larger than 2 GiB.

- bpo-31673: Fixed typo in the name of Tkinter's method adderrorinfo().

- bpo-30806: Fix the string representation of a netrc object.

- bpo-15037: Added a workaround for getkey() in curses for ncurses 5.7 and
  earlier.

- bpo-25351: Avoid venv activate failures with undefined variables

- bpo-25532: inspect.unwrap() will now only try to unwrap an object
  sys.getrecursionlimit() times, to protect against objects which create a
  new object on every attribute access.

- bpo-30347: Stop crashes when concurrently iterate over itertools.groupby()
  iterators.

- bpo-31516: ``threading.current_thread()`` should not return a dummy thread
  at shutdown.

- bpo-31351: python -m ensurepip now exits with non-zero exit code if pip
  bootstrapping has failed.

- bpo-31482: ``random.seed()`` now works with bytes in version=1

- bpo-31334: Fix ``poll.poll([timeout])`` in the ``select`` module for
  arbitrary negative timeouts on all OSes where it can only be a non-
  negative integer or -1. Patch by Riccardo Coccioli.

- bpo-31310: multiprocessing's semaphore tracker should be launched again if
  crashed.

- bpo-31308: Make multiprocessing's forkserver process immune to Ctrl-C and
  other user interruptions. If it crashes, restart it when necessary.

Documentation
-------------

- bpo-32105: Added asyncio.BaseEventLoop.connect_accepted_socket
  versionaddded marker.

- bpo-31537: Fix incorrect usage of ``get_history_length`` in readline
  documentation example code. Patch by Brad Smith.

- bpo-30085: The operator functions without double underscores are preferred
  for clarity. The one with underscores are only kept for back-
  compatibility.

Tests
-----

- bpo-31380: Skip test_httpservers test_undecodable_file on macOS: fails on
  APFS.

- bpo-31705: Skip test_socket.test_sha256() on Linux kernel older than 4.5.
  The test fails with ENOKEY on kernel 3.10 (on ppc64le). A fix was merged
  into the kernel 4.5.

- bpo-31174: Fix test_tools.test_unparse: DirectoryTestCase now stores the
  names sample to always test the same files. It prevents false alarms when
  hunting reference leaks.

- bpo-30695: Add the `set_nomemory(start, stop)` and `remove_mem_hooks()`
  functions to the _testcapi module.

Build
-----

- bpo-32059: ``detect_modules()`` in ``setup.py`` now also searches the
  sysroot paths when cross-compiling.

- bpo-31957: Fixes Windows SDK version detection when building for Windows.

- bpo-31609: Fixes quotes in PCbuild/clean.bat

- bpo-31934: Abort the build when building out of a not clean source tree.

- bpo-31926: Fixed Argument Clinic sometimes causing compilation errors when
  there was more than one function and/or method in a .c file with the same
  name.

- bpo-28791: Update Windows builds to use SQLite 3.21.0.

- bpo-28791: Update OS X installer to use SQLite 3.21.0.

- bpo-22140: Prevent double substitution of prefix in python-config.sh.

- bpo-31536: Avoid wholesale rebuild after `make regen-all` if nothing
  changed.

Windows
-------

- bpo-1102: Return ``None`` when ``View.Fetch()`` returns
  ``ERROR_NO_MORE_ITEMS`` instead of raising ``MSIError``.

  Initial patch by Anthony Tuininga.

- bpo-31944: Fixes Modify button in Apps and Features dialog.

macOS
-----

- bpo-31392: Update macOS installer to use OpenSSL 1.0.2m

IDLE
----

- bpo-32207: Improve tk event exception tracebacks in IDLE. When tk event
  handling is driven by IDLE's run loop, a confusing and distracting
  queue.EMPTY traceback context is no longer added to tk event exception
  tracebacks.  The traceback is now the same as when event handling is
  driven by user code.  Patch based on a suggestion by Serhiy Storchaka.

- bpo-32164: Delete unused file idlelib/tabbedpages.py. Use of TabbedPageSet
  in configdialog was replaced by ttk.Notebook.

- bpo-32100: IDLE: Fix old and new bugs in pathbrowser; improve tests. Patch
  mostly by Cheryl Sabella.

- bpo-31858: IDLE -- Restrict shell prompt manipulaton to the shell. Editor
  and output windows only see an empty last prompt line.  This simplifies
  the code and fixes a minor bug when newline is inserted. Sys.ps1, if
  present, is read on Shell start-up, but is not set or changed.

- bpo-31860: The font sample in the IDLE configuration dialog is now
  editable. Changes persist while IDLE remains open

- bpo-31836: Test_code_module now passes if run after test_idle, which sets
  ps1.

  The code module uses sys.ps1 if present or sets it to '>>> ' if not.
  Test_code_module now properly tests both behaviors.  Ditto for ps2.

- bpo-28603: Fix a TypeError that caused a shell restart when printing a
  traceback that includes an exception that is unhashable. Patch by Zane
  Bitter.

- bpo-13802: Use non-Latin characters in the IDLE's Font settings sample.
  Even if one selects a font that defines a limited subset of the unicode
  Basic Multilingual Plane, tcl/tk will use other fonts that define a
  character. The expanded example give users of non-Latin characters a
  better idea of what they might see in IDLE's shell and editors. To make
  room for the expanded sample, frames on the Font tab are re-arranged. The
  Font/Tabs help explains a bit about the additions.

- bpo-31460: Simplify the API of IDLE's Module Browser.

  Passing a widget instead of an flist with a root widget opens the option
  of creating a browser frame that is only part of a window.  Passing a full
  file name instead of pieces assumed to come from a .py file opens the
  possibility of browsing python files that do not end in .py.

- bpo-31649: IDLE - Make _htest, _utest parameters keyword only.

- bpo-31559: Remove test order dependence in idle_test.test_browser.

- bpo-31459: Rename IDLE's module browser from Class Browser to Module
  Browser. The original module-level class and method browser became a
  module browser, with the addition of module-level functions, years ago.
  Nested classes and functions were added yesterday.  For back-
  compatibility, the virtual event <<open-class-browser>>, which appears on
  the Keys tab of the Settings dialog, is not changed. Patch by Cheryl
  Sabella.

- bpo-31500: Default fonts now are scaled on HiDPI displays.

- bpo-1612262: IDLE module browser now shows nested classes and functions.
  Original patches for code and tests by Guilherme Polo and Cheryl Sabella,
  respectively.

Tools/Demos
-----------

- bpo-30722: Make redemo work with Python 3.6 and newer versions.

  In Python 3.6, flags like re.DOTALL became members of an enum.IntFlag so
  usages like ``getattr(re, 'DOTALL')`` are invalid.

  Also, remove the ``LOCALE`` option since it doesn't work with string
  patterns in Python 3.

  Patch by Christoph Sarnowski.

C API
-----

- bpo-20891: Fix PyGILState_Ensure(). When PyGILState_Ensure() is called in
  a non-Python thread before PyEval_InitThreads(), only call
  PyEval_InitThreads() after calling PyThreadState_New() to fix a crash.

- bpo-31532: Fix memory corruption due to allocator mix in getpath.c between
  Py_GetPath() and Py_SetPath()

- bpo-30697: The `PyExc_RecursionErrorInst` singleton is removed and
  `PyErr_NormalizeException()` does not use it anymore. This singleton is
  persistent and its members being never cleared may cause a segfault during
  finalization of the interpreter. See also issue #22898.


What's New in Python 3.6.3 final?
=================================

*Release date: 2017-10-03*

Library
-------

- bpo-31641: Re-allow arbitrary iterables in
  `concurrent.futures.as_completed()`. Fixes regression in 3.6.3rc1.

Build
-----

- bpo-31662: Fix typos in Windows ``uploadrelease.bat`` script. Fix Windows
  Doc build issues in ``Doc/make.bat``.

- bpo-31423: Fix building the PDF documentation with newer versions of
  Sphinx.


What's New in Python 3.6.3 release candidate 1?
===============================================

*Release date: 2017-09-18*

Security
--------

- bpo-29781: SSLObject.version() now correctly returns None when handshake
  over BIO has not been performed yet.

- bpo-30947: Upgrade libexpat embedded copy from version 2.2.1 to 2.2.3 to
  get security fixes.

Core and Builtins
-----------------

- bpo-31471: Fix an assertion failure in `subprocess.Popen()` on Windows, in
  case the env argument has a bad keys() method. Patch by Oren Milman.

- bpo-31418: Fix an assertion failure in `PyErr_WriteUnraisable()` in case
  of an exception with a bad ``__module__`` attribute. Patch by Oren Milman.

- bpo-31416: Fix assertion failures in case of a bad warnings.filters or
  warnings.defaultaction. Patch by Oren Milman.

- bpo-31411: Raise a TypeError instead of SystemError in case
  warnings.onceregistry is not a dictionary. Patch by Oren Milman.

- bpo-31373: Fix several possible instances of undefined behavior due to
  floating-point demotions.

- bpo-30465: Location information (``lineno`` and ``col_offset``) in
  f-strings is now (mostly) correct.  This fixes tools like flake8 from
  showing warnings on the wrong line (typically the first line of the file).

- bpo-31343: Include sys/sysmacros.h for major(), minor(), and makedev().
  GNU C libray plans to remove the functions from sys/types.h.

- bpo-31291: Fix an assertion failure in `zipimport.zipimporter.get_data` on
  Windows, when the return value of ``pathname.replace('/','\\')`` isn't a
  string. Patch by Oren Milman.

- bpo-31271: Fix an assertion failure in the write() method of
  `io.TextIOWrapper`, when the encoder doesn't return a bytes object. Patch
  by Oren Milman.

- bpo-31243: Fix a crash in some methods of `io.TextIOWrapper`, when the
  decoder's state is invalid. Patch by Oren Milman.

- bpo-30721: ``print`` now shows correct usage hint for using Python 2
  redirection syntax.  Patch by Sanyam Khurana.

- bpo-31070: Fix a race condition in importlib _get_module_lock().

- bpo-31095: Fix potential crash during GC caused by ``tp_dealloc`` which
  doesn't call ``PyObject_GC_UnTrack()``.

- bpo-31071: Avoid masking original TypeError in call with * unpacking when
  other arguments are passed.

- bpo-30978: str.format_map() now passes key lookup exceptions through.
  Previously any exception was replaced with a KeyError exception.

- bpo-30808: Use _Py_atomic API for concurrency-sensitive signal state.

- bpo-30876: Relative import from unloaded package now reimports the package
  instead of failing with SystemError.  Relative import from non-package now
  fails with ImportError rather than SystemError.

- bpo-30703: Improve signal delivery.

  Avoid using Py_AddPendingCall from signal handler, to avoid calling
  signal- unsafe functions. The tests I'm adding here fail without the rest
  of the patch, on Linux and OS X. This means our signal delivery logic had
  defects (some signals could be lost).

- bpo-30765: Avoid blocking in pthread_mutex_lock() when
  PyThread_acquire_lock() is asked not to block.

- bpo-31161: Make sure the 'Missing parentheses' syntax error message is
  only applied to SyntaxError, not to subclasses. Patch by Martijn Pieters.

- bpo-30814: Fixed a race condition when import a submodule from a package.

- bpo-30597: ``print`` now shows expected input in custom error message when
  used as a Python 2 statement. Patch by Sanyam Khurana.

Library
-------

- bpo-31499: xml.etree: Fix a crash when a parser is part of a reference
  cycle.

- bpo-28556: typing.get_type_hints now finds the right globalns for classes
  and modules by default (when no ``globalns`` was specified by the caller).

- bpo-28556: Speed improvements to the ``typing`` module.  Original PRs by
  Ivan Levkivskyi and Mitar.

- bpo-31544: The C accelerator module of ElementTree ignored exceptions
  raised when looking up TreeBuilder target methods in XMLParser().

- bpo-31234: socket.create_connection() now fixes manually a reference
  cycle: clear the variable storing the last exception on success.

- bpo-31457: LoggerAdapter objects can now be nested.

- bpo-31400: Improves SSL error handling to avoid losing error numbers.

- bpo-28958: ssl.SSLContext() now uses OpenSSL error information when a
  context cannot be instantiated.

- bpo-27340: SSLSocket.sendall() now uses memoryview to create slices of
  data. This fixes support for all bytes-like object. It is also more
  efficient and avoids costly copies.

- bpo-31178: Fix string concatenation bug in rare error path in the
  subprocess module

- bpo-31350: Micro-optimize :func:`asyncio._get_running_loop` to become up
  to 10% faster.

- bpo-31170: expat: Update libexpat from 2.2.3 to 2.2.4. Fix copying of
  partial characters for UTF-8 input (libexpat bug 115):
  https://github.com/libexpat/libexpat/issues/115

- bpo-29136: Add TLS 1.3 cipher suites and OP_NO_TLSv1_3.

- bpo-29212: Fix concurrent.futures.thread.ThreadPoolExecutor threads to
  have a non repr() based thread name by default when no thread_name_prefix
  is supplied. They will now identify themselves as "ThreadPoolExecutor-
  y_n".

- bpo-9146: Fix a segmentation fault in _hashopenssl when standard hash
  functions such as md5 are not available in the linked OpenSSL library.  As
  in some special FIPS-140 build environments.

- bpo-27144: The ``map()`` and ``as_completed()`` iterators in
  ``concurrent.futures`` now avoid keeping a reference to yielded objects.

- bpo-10746: Fix ctypes producing wrong PEP 3118 type codes for integer
  types.

- bpo-22536: The subprocess module now sets the filename when
  FileNotFoundError is raised on POSIX systems due to the executable or cwd
  not being found.

- bpo-31249: concurrent.futures: WorkItem.run() used by ThreadPoolExecutor
  now breaks a reference cycle between an exception object and the WorkItem
  object.

- bpo-31247: xmlrpc.server now explicitly breaks reference cycles when using
  sys.exc_info() in code handling exceptions.

- bpo-30102: The ssl and hashlib modules now call
  OPENSSL_add_all_algorithms_noconf() on OpenSSL < 1.1.0. The function
  detects CPU features and enables optimizations on some CPU architectures
  such as POWER8. Patch is based on research from Gustavo Serra Scalet.

- bpo-31185: Fixed miscellaneous errors in asyncio speedup module.

- bpo-31135: ttk: fix the destroy() method of LabeledScale and OptionMenu
  classes. Call the parent destroy() method even if the used attribute
  doesn't exist. The LabeledScale.destroy() method now also explicitly
  clears label and scale attributes to help the garbage collector to destroy
  all widgets.

- bpo-31107: Fix `copyreg._slotnames()` mangled attribute calculation for
  classes whose name begins with an underscore. Patch by Shane Harvey.

- bpo-31061: Fixed a crash when using asyncio and threads.

- bpo-30502: Fix handling of long oids in ssl.  Based on patch by Christian
  Heimes.

- bpo-30119: ftplib.FTP.putline() now throws ValueError on commands that
  contains CR or LF. Patch by Dong-hee Na.

- bpo-30595: multiprocessing.Queue.get() with a timeout now polls its reader
  in non- blocking mode if it succeeded to aquire the lock but the acquire
  took longer than the timeout.

- bpo-29403: Fix ``unittest.mock``'s autospec to not fail on method-bound
  builtin functions.  Patch by Aaron Gallagher.

- bpo-30961: Fix decrementing a borrowed reference in tracemalloc.

- bpo-25684: Change ``ttk.OptionMenu`` radiobuttons to be unique across
  instances of ``OptionMenu``.

- bpo-30886: Fix multiprocessing.Queue.join_thread(): it now waits until the
  thread completes, even if the thread was started by the same process which
  created the queue.

- bpo-29854: Fix segfault in readline when using readline's history-size
  option.  Patch by Nir Soffer.

- bpo-30319: socket.close() now ignores ECONNRESET error.

- bpo-30828: Fix out of bounds write in
  `asyncio.CFuture.remove_done_callback()`.

- bpo-30807: signal.setitimer() may disable the timer when passed a tiny
  value.

  Tiny values (such as 1e-6) are valid non-zero values for setitimer(),
  which is specified as taking microsecond-resolution intervals. However, on
  some platform, our conversion routine could convert 1e-6 into a zero
  interval, therefore disabling the timer instead of (re-)scheduling it.

- bpo-30441: Fix bug when modifying os.environ while iterating over it

- bpo-30532: Fix email header value parser dropping folding white space in
  certain cases.

- bpo-30879: os.listdir() and os.scandir() now emit bytes names when called
  with bytes- like argument.

- bpo-30746: Prohibited the '=' character in environment variable names in
  ``os.putenv()`` and ``os.spawn*()``.

- bpo-29755: Fixed the lgettext() family of functions in the gettext module.
  They now always return bytes.

Documentation
-------------

- bpo-31294: Fix incomplete code snippet in the ZeroMQSocketListener and
  ZeroMQSocketHandler examples and adapt them to Python 3.

- bpo-21649: Add RFC 7525 and Mozilla server side TLS links to SSL
  documentation.

- bpo-30803: Clarify doc on truth value testing. Original patch by Peter
  Thomassen.

Tests
-----

- bpo-31320: Silence traceback in test_ssl

- bpo-25674: Remove sha256.tbs-internet.com ssl test

- bpo-30715: Address ALPN callback changes for OpenSSL 1.1.0f. The latest
  version behaves like OpenSSL 1.0.2 and no longer aborts handshake.

- bpo-30822: regrtest: Exclude tzdata from regrtest --all. When running the
  test suite using --use=all / -u all, exclude tzdata since it makes
  test_datetime too slow (15-20 min on some buildbots) which then times out
  on some buildbots. Fix also regrtest command line parser to allow passing
  -u extralargefile to run test_zipfile64.

Build
-----

- bpo-30854: Fix compile error when compiling --without-threads. Patch by
  Masayuki Yamamoto.

Windows
-------

- bpo-30389: Adds detection of Visual Studio 2017 to distutils on Windows.

- bpo-31340: Change to building with MSVC v141 (included with Visual Studio
  2017)

- bpo-30581: os.cpu_count() now returns the correct number of processors on
  Windows when the number of logical processors is greater than 64.

- bpo-30731: Add a missing xmlns to python.manifest so that it matches the
  schema.

IDLE
----

- bpo-31493: IDLE code context -- fix code update and font update timers.

  Canceling timers prevents a warning message when test_idle completes.

- bpo-31488: IDLE - Update non-key options in former extension classes. When
  applying configdialog changes, call .reload for each feature class. Change
  ParenMatch so updated options affect existing instances attached to
  existing editor windows.

- bpo-31477: IDLE - Improve rstrip entry in doc. Strip trailing whitespace
  strips more than blank spaces.  Multiline string literals are not skipped.

- bpo-31480: IDLE - make tests pass with zzdummy extension disabled by
  default.

- bpo-31421: Document how IDLE runs tkinter programs. IDLE calls tcl/tk
  update in the background in order to make live

  interaction and experimentatin with tkinter applications much easier.

- bpo-31414: IDLE -- fix tk entry box tests by deleting first. Adding to an
  int entry is not the same as deleting and inserting because int('') will
  fail.

- bpo-31051: Rearrange IDLE condigdialog GenPage into Window, Editor, and
  Help sections.

- bpo-30617: IDLE - Add docstrings and tests for outwin subclass of editor.

  Move some data and functions from the class to module level. Patch by
  Cheryl Sabella.

- bpo-31287: IDLE - Do not modify tkinter.message in test_configdialog.

- bpo-27099: Convert IDLE's built-in 'extensions' to regular features.

  About 10 IDLE features were implemented as supposedly optional extensions.
  Their different behavior could be confusing or worse for users and not
  good for maintenance.  Hence the conversion.

  The main difference for users is that user configurable key bindings for
  builtin features are now handled uniformly.  Now, editing a binding in a
  keyset only affects its value in the keyset.  All bindings are defined
  together in the system-specific default keysets in config- extensions.def.
  All custom keysets are saved as a whole in config- extension.cfg.  All
  take effect as soon as one clicks Apply or Ok.

  The affected events are '<<force-open-completions>>', '<<expand-word>>',
  '<<force-open-calltip>>', '<<flash-paren>>', '<<format-paragraph>>',
  '<<run- module>>', '<<check-module>>', and '<<zoom-height>>'.  Any
  (global) customizations made before 3.6.3 will not affect their keyset-
  specific customization after 3.6.3. and vice versa.

  Inital patch by Charles Wohlganger.

- bpo-31206: IDLE: Factor HighPage(Frame) class from ConfigDialog. Patch by
  Cheryl Sabella.

- bpo-31001: Add tests for configdialog highlight tab.  Patch by Cheryl
  Sabella.

- bpo-31205: IDLE: Factor KeysPage(Frame) class from ConfigDialog.  The
  slightly modified tests continue to pass.  Patch by Cheryl Sabella.

- bpo-31130: IDLE -- stop leaks in test_configdialog. Initial patch by
  Victor Stinner.

- bpo-31002: Add tests for configdialog keys tab. Patch by Cheryl Sabella.

- bpo-19903: IDLE: Calltips use `inspect.signature` instead of
  `inspect.getfullargspec`. This improves calltips for builtins converted to
  use Argument Clinic. Patch by Louie Lu.

- bpo-31083: IDLE - Add an outline of a TabPage class in configdialog.
  Update existing classes to match outline. Initial patch by Cheryl Sabella.

- bpo-31050: Factor GenPage(Frame) class from ConfigDialog. The slightly
  modified tests continue to pass. Patch by Cheryl Sabella.

- bpo-31004: IDLE - Factor FontPage(Frame) class from ConfigDialog.

  Slightly modified tests continue to pass. Fix General tests. Patch mostly
  by Cheryl Sabella.

- bpo-30781: IDLE - Use ttk widgets in ConfigDialog. Patches by Terry Jan
  Reedy and Cheryl Sabella.

- bpo-31060: IDLE - Finish rearranging methods of ConfigDialog Grouping
  methods pertaining to each tab and the buttons will aid writing tests and
  improving the tabs and will enable splitting the groups into classes.

- bpo-30853: IDLE -- Factor a VarTrace class out of ConfigDialog.

  Instance tracers manages pairs consisting of a tk variable and a callback
  function.  When tracing is turned on, setting the variable calls the
  function.  Test coverage for the new class is 100%.

- bpo-31003: IDLE: Add more tests for General tab.

- bpo-30993: IDLE - Improve configdialog font page and tests.

  In configdialog: Document causal pathways in create_font_tab docstring.
  Simplify some attribute names. Move set_samples calls to var_changed_font
  (idea from Cheryl Sabella).  Move related functions to positions after the
  create widgets function.

  In test_configdialog: Fix test_font_set so not order dependent.  Fix
  renamed test_indent_scale so it tests the widget.  Adjust tests for
  movement of set_samples call.  Add tests for load functions.  Put all font
  tests in one class and tab indent tests in another.  Except for two lines,
  these tests completely cover the related functions.

- bpo-30981: IDLE -- Add more configdialog font page tests.

- bpo-28523: IDLE: replace 'colour' with 'color' in configdialog.

- bpo-30917: Add tests for idlelib.config.IdleConf. Increase coverage from
  46% to 96%. Patch by Louie Lu.

- bpo-30934: Document coverage details for idlelib tests.

  * Add section to idlelib/idle-test/README.txt.

  * Include check that branches are taken both ways.

  * Exclude IDLE-specific code that does not run during unit tests.

- bpo-30913: IDLE: Document ConfigDialog tk Vars, methods, and widgets in
  docstrings This will facilitate improving the dialog and splitting up the
  class. Original patch by Cheryl Sabella.

- bpo-30899: IDLE: Add tests for ConfigParser subclasses in config. Patch by
  Louie Lu.

- bpo-30881: IDLE: Add docstrings to browser.py. Patch by Cheryl Sabella.

- bpo-30851: IDLE: Remove unused variables in configdialog.  One is a
  duplicate, one is set but cannot be altered by users. Patch by Cheryl
  Sabella.

- bpo-30870: IDLE: In Settings dialog, select font with Up, Down keys as
  well as mouse. Initial patch by Louie Lu.

- bpo-8231: IDLE: call config.IdleConf.GetUserCfgDir only once.

- bpo-30779: IDLE: Factor ConfigChanges class from configdialog, put in
  config; test. * In config, put dump test code in a function; run it and
  unittest in   'if __name__ == '__main__'. * Add class config.ConfigChanges
  based on changes_class_v4.py on bpo issue. * Add class
  test_config.ChangesTest, partly using configdialog_tests_v1.py. * Revise
  configdialog to use ConfigChanges; see tracker msg297804. * Revise
  test_configdialog to match configdialog changes. * Remove configdialog
  functions unused or moved to ConfigChanges. Cheryl Sabella contributed
  parts of the patch.

- bpo-30777: IDLE: configdialog - Add docstrings and fix comments. Patch by
  Cheryl Sabella.

- bpo-30495: IDLE: Improve textview with docstrings, PEP8 names, and more
  tests. Patch by Cheryl Sabella.

- bpo-30723: IDLE: Make several improvements to parenmatch. Add 'parens'
  style to highlight both opener and closer. Make 'default' style, which is
  not default, a synonym for 'opener'. Make time-delay work the same with
  all styles. Add help for config dialog extensions tab, including help for
  parenmatch. Add new tests.  Original patch by Charles Wohlganger.

- bpo-30674: IDLE: add docstrings to grep module. Patch by Cheryl Sabella

- bpo-21519: IDLE's basic custom key entry dialog now detects duplicates
  properly. Original patch by Saimadhav Heblikar.

- bpo-29910: IDLE no longer deletes a character after commenting out a
  region by a key shortcut.  Add ``return 'break'`` for this and other
  potential conflicts between IDLE and default key bindings.

- bpo-30728: Review and change idlelib.configdialog names. Lowercase method
  and attribute names. Replace 'colour' with 'color', expand overly cryptic
  names, delete unneeded underscores. Replace ``import *`` with specific
  imports. Patches by Cheryl Sabella.

- bpo-6739: IDLE: Verify user-entered key sequences by trying to bind them
  with tk. Add tests for all 3 validation functions. Original patch by G
  Polo.  Tests added by Cheryl Sabella.

Tools/Demos
-----------

- bpo-30983: gdb integration commands (py-bt, etc.) work on optimized shared
  builds now, too.  PEP 523 introduced _PyEval_EvalFrameDefault which
  inlines PyEval_EvalFrameEx on non-debug shared builds.  This broke the
  ability to use py-bt, py-up, and a few other Python-specific gdb
  integrations. The problem is fixed by only looking for
  _PyEval_EvalFrameDefault frames in python-gdb.py.  Original patch by Bruno
  "Polaco" Penteado.


What's New in Python 3.6.2 final?
=================================

*Release date: 2017-07-17*

No changes since release candidate 2



What's New in Python 3.6.2 release candidate 2?
===============================================

*Release date: 2017-07-07*

Security
--------

- bpo-30730: Prevent environment variables injection in subprocess on
  Windows.  Prevent passing other environment variables and command
  arguments.

- bpo-30694: Upgrade expat copy from 2.2.0 to 2.2.1 to get fixes of multiple
  security vulnerabilities including: CVE-2017-9233 (External entity
  infinite loop DoS), CVE-2016-9063 (Integer overflow, re-fix),
  CVE-2016-0718 (Fix regression bugs from 2.2.0's fix to CVE-2016-0718) and
  CVE-2012-0876 (Counter hash flooding with SipHash). Note: the
  CVE-2016-5300 (Use os- specific entropy sources like getrandom) doesn't
  impact Python, since Python already gets entropy from the OS to set the
  expat secret using ``XML_SetHashSalt()``.

- bpo-30500: Fix urllib.parse.splithost() to correctly parse fragments. For
  example, ``splithost('//127.0.0.1#@evil.com/')`` now correctly returns the
  ``127.0.0.1`` host, instead of treating ``@evil.com`` as the host in an
  authentification (``login@host``).


What's New in Python 3.6.2 release candidate 1?
===============================================

*Release date: 2017-06-17*

Core and Builtins
-----------------

- bpo-30682: Removed a too-strict assertion that failed for certain
  f-strings, such as eval("f'\\\n'") and eval("f'\\\r'").

- bpo-30604: Move co_extra_freefuncs to not be per-thread to avoid crashes

- bpo-29104: Fixed parsing backslashes in f-strings.

- bpo-27945: Fixed various segfaults with dict when input collections are
  mutated during searching, inserting or comparing.  Based on patches by
  Duane Griffin and Tim Mitchell.

- bpo-25794: Fixed type.__setattr__() and type.__delattr__() for non-
  interned attribute names.  Based on patch by Eryk Sun.

- bpo-30039: If a KeyboardInterrupt happens when the interpreter is in the
  middle of resuming a chain of nested 'yield from' or 'await' calls, it's
  now correctly delivered to the innermost frame.

- bpo-12414: sys.getsizeof() on a code object now returns the sizes which
  includes the code struct and sizes of objects which it references. Patch
  by Dong-hee Na.

- bpo-29949: Fix memory usage regression of set and frozenset object.

- bpo-29935: Fixed error messages in the index() method of tuple, list and
  deque when pass indices of wrong type.

- bpo-29859: Show correct error messages when any of the pthread_* calls in
  thread_pthread.h fails.

- bpo-28876: ``bool(range)`` works even if ``len(range)`` raises
  :exc:`OverflowError`.

- bpo-29600: Fix wrapping coroutine return values in StopIteration.

- bpo-28856: Fix an oversight that %b format for bytes should support
  objects follow the buffer protocol.

- bpo-29714: Fix a regression that bytes format may fail when containing
  zero bytes inside.

- bpo-29478: If max_line_length=None is specified while using the Compat32
  policy, it is no longer ignored.  Patch by Mircea Cosbuc.

Library
-------

- bpo-30616: Functional API of enum allows to create empty enums. Patched by
  Dong-hee Na

- bpo-30038: Fix race condition between signal delivery and wakeup file
  descriptor. Patch by Nathaniel Smith.

- bpo-23894: lib2to3 now recognizes ``rb'...'`` and ``f'...'`` strings.

- bpo-23890: unittest.TestCase.assertRaises() now manually breaks a
  reference cycle to not keep objects alive longer than expected.

- bpo-30149: inspect.signature() now supports callables with variable-
  argument parameters wrapped with partialmethod. Patch by Dong-hee Na.

- bpo-30645: Fix path calculation in imp.load_package(), fixing it for cases
  when a package is only shipped with bytecodes. Patch by Alexandru
  Ardelean.

- bpo-29931: Fixed comparison check for ipaddress.ip_interface objects.
  Patch by Sanjay Sundaresan.

- bpo-30605: re.compile() no longer raises a BytesWarning when compiling a
  bytes instance with misplaced inline modifier.  Patch by Roy Williams.

Security
--------

- bpo-29591: Update expat copy from 2.1.1 to 2.2.0 to get fixes of
  CVE-2016-0718 and CVE-2016-4472. See
  https://sourceforge.net/p/expat/bugs/537/ for more information.

Library
-------

- bpo-24484: Avoid race condition in multiprocessing cleanup (#2159)

- bpo-28994: The traceback no longer displayed for SystemExit raised in a
  callback registered by atexit.

- bpo-30508: Don't log exceptions if Task/Future "cancel()" method was
  called.

- bpo-28556: Updates to typing module: Add generic AsyncContextManager, add
  support for ContextManager on all versions. Original PRs by Jelle Zijlstra
  and Ivan Levkivskyi

- bpo-29870: Fix ssl sockets leaks when connection is aborted in asyncio/ssl
  implementation. Patch by Michaël Sghaïer.

- bpo-29743: Closing transport during handshake process leaks open socket.
  Patch by Nikolay Kim

- bpo-27585: Fix waiter cancellation in asyncio.Lock. Patch by Mathieu
  Sornay.

- bpo-30418: On Windows, subprocess.Popen.communicate() now also ignore
  EINVAL on stdin.write() if the child process is still running but closed
  the pipe.

- bpo-29822: inspect.isabstract() now works during __init_subclass__.  Patch
  by Nate Soares.

- bpo-29581: ABCMeta.__new__ now accepts ``**kwargs``, allowing abstract
  base classes to use keyword parameters in __init_subclass__. Patch by Nate
  Soares.

- bpo-30557: faulthandler now correctly filters and displays exception codes
  on Windows

- bpo-30378: Fix the problem that logging.handlers.SysLogHandler cannot
  handle IPv6 addresses.

- bpo-29960: Preserve generator state when _random.Random.setstate() raises
  an exception. Patch by Bryan Olson.

- bpo-30414: multiprocessing.Queue._feed background running thread do not
  break from main loop on exception.

- bpo-30003: Fix handling escape characters in HZ codec.  Based on patch by
  Ma Lin.

- bpo-30301: Fix AttributeError when using SimpleQueue.empty() under *spawn*
  and *forkserver* start methods.

- bpo-30329: imaplib and poplib now catch the Windows socket WSAEINVAL error
  (code 10022) on shutdown(SHUT_RDWR): An invalid operation was attempted.
  This error occurs sometimes on SSL connections.

- bpo-30375: Warnings emitted when compile a regular expression now always
  point to the line in the user code.  Previously they could point into
  inners of the re module if emitted from inside of groups or conditionals.

- bpo-30048: Fixed ``Task.cancel()`` can be ignored when the task is running
  coroutine and the coroutine returned without any more ``await``.

- bpo-30266: contextlib.AbstractContextManager now supports anti-
  registration by setting __enter__ = None or __exit__ = None, following the
  pattern introduced in bpo-25958. Patch by Jelle Zijlstra.

- bpo-30298: Weaken the condition of deprecation warnings for inline
  modifiers. Now allowed several subsequential inline modifiers at the start
  of the pattern (e.g. ``'(?i)(?s)...'``).  In verbose mode whitespaces and
  comments now are allowed before and between inline modifiers (e.g. ``'(?x)
  (?i) (?s)...'``).

- bpo-29990: Fix range checking in GB18030 decoder.  Original patch by Ma
  Lin.

- bpo-26293: Change resulted because of zipfile breakage. (See also:
  bpo-29094)

- bpo-30243: Removed the __init__ methods of _json's scanner and encoder.
  Misusing them could cause memory leaks or crashes.  Now scanner and
  encoder objects are completely initialized in the __new__ methods.

- bpo-30185: Avoid KeyboardInterrupt tracebacks in forkserver helper process
  when Ctrl-C is received.

- bpo-28556: Various updates to typing module: add typing.NoReturn type, use
  WrapperDescriptorType, minor bug-fixes.  Original PRs by Jim Fasarakis-
  Hilliard and Ivan Levkivskyi.

- bpo-30205: Fix getsockname() for unbound AF_UNIX sockets on Linux.

- bpo-30070: Fixed leaks and crashes in errors handling in the parser
  module.

- bpo-30061: Fixed crashes in IOBase methods __next__() and readlines() when
  readline() or __next__() respectively return non-sizeable object. Fixed
  possible other errors caused by not checking results of PyObject_Size(),
  PySequence_Size(), or PyMapping_Size().

- bpo-30017: Allowed calling the close() method of the zip entry writer
  object multiple times.  Writing to a closed writer now always produces a
  ValueError.

- bpo-30068: _io._IOBase.readlines will check if it's closed first when hint
  is present.

- bpo-29694: Fixed race condition in pathlib mkdir with flags parents=True.
  Patch by Armin Rigo.

- bpo-29692: Fixed arbitrary unchaining of RuntimeError exceptions in
  contextlib.contextmanager.  Patch by Siddharth Velankar.

- bpo-29998: Pickling and copying ImportError now preserves name and path
  attributes.

- bpo-29953: Fixed memory leaks in the replace() method of datetime and time
  objects when pass out of bound fold argument.

- bpo-29942: Fix a crash in itertools.chain.from_iterable when encountering
  long runs of empty iterables.

- bpo-27863: Fixed multiple crashes in ElementTree caused by race conditions
  and wrong types.

- bpo-28699: Fixed a bug in pools in multiprocessing.pool that raising an
  exception at the very first of an iterable may swallow the exception or
  make the program hang. Patch by Davin Potts and Xiang Zhang.

- bpo-25803: Avoid incorrect errors raised by Path.mkdir(exist_ok=True) when
  the OS gives priority to errors such as EACCES over EEXIST.

- bpo-29861: Release references to tasks, their arguments and their results
  as soon as they are finished in multiprocessing.Pool.

- bpo-29884: faulthandler: Restore the old sigaltstack during teardown.
  Patch by Christophe Zeitouny.

- bpo-25455: Fixed crashes in repr of recursive buffered file-like objects.

- bpo-29800: Fix crashes in partial.__repr__ if the keys of partial.keywords
  are not strings.  Patch by Michael Seifert.

- bpo-29742: get_extra_info() raises exception if get called on closed ssl
  transport. Patch by Nikolay Kim.

- bpo-8256: Fixed possible failing or crashing input() if attributes
  "encoding" or "errors" of sys.stdin or sys.stdout are not set or are not
  strings.

- bpo-28298: Fix a bug that prevented array 'Q', 'L' and 'I' from accepting
  big intables (objects that have __int__) as elements.  Patch by Oren
  Milman.

- bpo-28231: The zipfile module now accepts path-like objects for external
  paths.

- bpo-26915: index() and count() methods of collections.abc.Sequence now
  check identity before checking equality when do comparisons.

- bpo-29615: SimpleXMLRPCDispatcher no longer chains KeyError (or any other
  exception) to exception(s) raised in the dispatched methods. Patch by Petr
  Motejlek.

- bpo-30177: path.resolve(strict=False) no longer cuts the path after the
  first element not present in the filesystem.  Patch by Antoine Pietri.

IDLE
----

- bpo-15786: Fix several problems with IDLE's autocompletion box. The
  following should now work: clicking on selection box items; using the
  scrollbar; selecting an item by hitting Return. Hangs on MacOSX should no
  longer happen. Patch by Louie Lu.

- bpo-25514: Add doc subsubsection about IDLE failure to start. Popup no-
  connection message directs users to this section.

- bpo-30642: Fix reference leaks in IDLE tests. Patches by Louie Lu and
  Terry Jan Reedy.

- bpo-30495: Add docstrings for textview.py and use PEP8 names. Patches by
  Cheryl Sabella and Terry Jan Reedy.

- bpo-30290: Help-about: use pep8 names and add tests. Increase coverage to
  100%. Patches by Louie Lu, Cheryl Sabella, and Terry Jan Reedy.

- bpo-30303: Add _utest option to textview; add new tests. Increase coverage
  to 100%. Patches by Louie Lu and Terry Jan Reedy.

C API
-----

- bpo-27867: Function PySlice_GetIndicesEx() no longer replaced with a macro
  if Py_LIMITED_API is not set.

Build
-----

- bpo-29941: Add ``--with-assertions`` configure flag to explicitly enable C
  ``assert()`` checks. Defaults to off. ``--with-pydebug`` implies ``--with-
  assertions``.

- bpo-28787: Fix out-of-tree builds of Python when configured with ``--with
  --dtrace``.

- bpo-29243: Prevent unnecessary rebuilding of Python during ``make test``,
  ``make install`` and some other make targets when configured with
  ``--enable- optimizations``.

- bpo-23404: Don't regenerate generated files based on file modification
  time anymore: the action is now explicit. Replace ``make touch`` with
  ``make regen-all``.

- bpo-29643: Fix ``--enable-optimization`` didn't work.

Documentation
-------------

- bpo-30176: Add missing attribute related constants in curses
  documentation.

- bpo-30052: the link targets for :func:`bytes` and :func:`bytearray` are
  now their respective type definitions, rather than the corresponding
  builtin function entries. Use :ref:`bytes <func-bytes>` and
  :ref:`bytearray <func-bytearray>` to reference the latter.

  In order to ensure this and future cross-reference updates are applied
  automatically, the daily documentation builds now disable the default
  output caching features in Sphinx.

- bpo-26985: Add missing info of code object in inspect documentation.

Tools/Demos
-----------

- bpo-29367: python-gdb.py now supports also ``method-wrapper``
  (``wrapperobject``) objects.

Tests
-----

- bpo-30357: test_thread: setUp() now uses support.threading_setup() and
  support.threading_cleanup() to wait until threads complete to avoid random
  side effects on following tests. Initial patch written by Grzegorz
  Grzywacz.

- bpo-30197: Enhanced functions swap_attr() and swap_item() in the
  test.support module. They now work when delete replaced attribute or item
  inside the with statement.  The old value of the attribute or item (or
  None if it doesn't exist) now will be assigned to the target of the "as"
  clause, if there is one.

Windows
-------

- bpo-30687: Locate msbuild.exe on Windows when building rather than
  vcvarsall.bat

- bpo-30450: The build process on Windows no longer depends on Subversion,
  instead pulling external code from GitHub via a Python script.  If Python
  3.6 is not found on the system (via ``py -3.6``), NuGet is used to
  download a copy of 32-bit Python.


What's New in Python 3.6.1 final?
=================================

*Release date: 2017-03-21*

Core and Builtins
-----------------

- bpo-29723: The ``sys.path[0]`` initialization change for bpo-29139 caused
  a regression by revealing an inconsistency in how sys.path is initialized
  when executing ``__main__`` from a zipfile, directory, or other import
  location. The interpreter now consistently avoids ever adding the import
  location's parent directory to ``sys.path``, and ensures no other
  ``sys.path`` entries are inadvertently modified when inserting the import
  location named on the command line.

Build
-----

- bpo-27593: fix format of git information used in sys.version

- Fix incompatible comment in python.h


What's New in Python 3.6.1 release candidate 1?
===============================================

*Release date: 2017-03-04*

Core and Builtins
-----------------

- bpo-28893: Set correct __cause__ for errors about invalid awaitables
  returned from __aiter__ and __anext__.

- bpo-29683: Fixes to memory allocation in _PyCode_SetExtra.  Patch by Brian
  Coleman.

- bpo-29684: Fix minor regression of PyEval_CallObjectWithKeywords. It
  should raise TypeError when kwargs is not a dict.  But it might cause segv
  when args=NULL and kwargs is not a dict.

- bpo-28598: Support __rmod__ for subclasses of str being called before
  str.__mod__. Patch by Martijn Pieters.

- bpo-29607: Fix stack_effect computation for CALL_FUNCTION_EX. Patch by
  Matthieu Dartiailh.

- bpo-29602: Fix incorrect handling of signed zeros in complex constructor
  for complex subclasses and for inputs having a __complex__ method. Patch
  by Serhiy Storchaka.

- bpo-29347: Fixed possibly dereferencing undefined pointers when creating
  weakref objects.

- bpo-29438: Fixed use-after-free problem in key sharing dict.

- bpo-29319: Prevent RunMainFromImporter overwriting sys.path[0].

- bpo-29337: Fixed possible BytesWarning when compare the code objects.
  Warnings could be emitted at compile time.

- bpo-29327: Fixed a crash when pass the iterable keyword argument to
  sorted().

- bpo-29034: Fix memory leak and use-after-free in os module
  (path_converter).

- bpo-29159: Fix regression in bytes(x) when x.__index__() raises Exception.

- bpo-28932: Do not include <sys/random.h> if it does not exist.

- bpo-25677: Correct the positioning of the syntax error caret for indented
  blocks. Based on patch by Michael Layzell.

- bpo-29000: Fixed bytes formatting of octals with zero padding in alternate
  form.

- bpo-26919: On Android, operating system data is now always encoded/decoded
  to/from UTF-8, instead of the locale encoding to avoid inconsistencies
  with os.fsencode() and os.fsdecode() which are already using UTF-8.

- bpo-28991: functools.lru_cache() was susceptible to an obscure reentrancy
  bug triggerable by a monkey-patched len() function.

- bpo-28739: f-string expressions are no longer accepted as docstrings and
  by ast.literal_eval() even if they do not include expressions.

- bpo-28512: Fixed setting the offset attribute of SyntaxError by
  PyErr_SyntaxLocationEx() and PyErr_SyntaxLocationObject().

- bpo-28918: Fix the cross compilation of xxlimited when Python has been
  built with Py_DEBUG defined.

- bpo-28731: Optimize _PyDict_NewPresized() to create correct size dict.
  Improve speed of dict literal with constant keys up to 30%.

Library
-------

- bpo-29169: Update zlib to 1.2.11.

- bpo-29623: Allow use of path-like object as a single argument in
  ConfigParser.read(). Patch by David Ellis.

- bpo-28963: Fix out of bound iteration in
  asyncio.Future.remove_done_callback implemented in C.

- bpo-29704: asyncio.subprocess.SubprocessStreamProtocol no longer closes
  before all pipes are closed.

- bpo-29271: Fix Task.current_task and Task.all_tasks implemented in C to
  accept None argument as their pure Python implementation.

- bpo-29703: Fix asyncio to support instantiation of new event loops in
  child processes.

- bpo-29376: Fix assertion error in threading._DummyThread.is_alive().

- bpo-28624: Add a test that checks that cwd parameter of Popen() accepts
  PathLike objects.  Patch by Sayan Chowdhury.

- bpo-28518: Start a transaction implicitly before a DML statement. Patch by
  Aviv Palivoda.

- bpo-29532: Altering a kwarg dictionary passed to functools.partial() no
  longer affects a partial object after creation.

- bpo-29110: Fix file object leak in aifc.open() when file is given as a
  filesystem path and is not in valid AIFF format. Patch by Anthony Zhang.

- bpo-28556: Various updates to typing module: typing.Counter,
  typing.ChainMap, improved ABC caching, etc. Original PRs by Jelle
  Zijlstra, Ivan Levkivskyi, Manuel Krebber, and Łukasz Langa.

- bpo-29100: Fix datetime.fromtimestamp() regression introduced in Python
  3.6.0: check minimum and maximum years.

- bpo-29519: Fix weakref spewing exceptions during interpreter shutdown when
  used with a rare combination of multiprocessing and custom codecs.

- bpo-29416: Prevent infinite loop in pathlib.Path.mkdir

- bpo-29444: Fixed out-of-bounds buffer access in the group() method of the
  match object. Based on patch by WGH.

- bpo-29335: Fix subprocess.Popen.wait() when the child process has exited
  to a stopped instead of terminated state (ex: when under ptrace).

- bpo-29290: Fix a regression in argparse that help messages would wrap at
  non-breaking spaces.

- bpo-28735: Fixed the comparison of mock.MagickMock with mock.ANY.

- bpo-29316: Restore the provisional status of typing module, add
  corresponding note to documentation. Patch by Ivan L.

- bpo-29219: Fixed infinite recursion in the repr of uninitialized
  ctypes.CDLL instances.

- bpo-29011: Fix an important omission by adding Deque to the typing module.

- bpo-28969: Fixed race condition in C implementation of
  functools.lru_cache. KeyError could be raised when cached function with
  full cache was simultaneously called from differen threads with the same
  uncached arguments.

- bpo-29142: In urllib.request, suffixes in no_proxy environment variable
  with leading dots could match related hostnames again (e.g. .b.c matches
  a.b.c). Patch by Milan Oberkirch.

- bpo-28961: Fix unittest.mock._Call helper: don't ignore the name parameter
  anymore. Patch written by Jiajun Huang.

- bpo-29203: functools.lru_cache() now respects PEP 468 and preserves the
  order of keyword arguments.  f(a=1, b=2) is now cached separately from
  f(b=2, a=1) since both calls could potentially give different results.

- bpo-15812: inspect.getframeinfo() now correctly shows the first line of a
  context. Patch by Sam Breese.

- bpo-29094: Offsets in a ZIP file created with extern file object and modes
  "w" and "x" now are relative to the start of the file.

- bpo-29085: Allow random.Random.seed() to use high quality OS randomness
  rather than the pid and time.

- bpo-29061: Fixed bug in secrets.randbelow() which would hang when given a
  negative input.  Patch by Brendan Donegan.

- bpo-29079: Prevent infinite loop in pathlib.resolve() on Windows

- bpo-13051: Fixed recursion errors in large or resized
  curses.textpad.Textbox.  Based on patch by Tycho Andersen.

- bpo-29119: Fix weakrefs in the pure python version of
  collections.OrderedDict move_to_end() method. Contributed by Andra
  Bogildea.

- bpo-9770: curses.ascii predicates now work correctly with negative
  integers.

- bpo-28427: old keys should not remove new values from WeakValueDictionary
  when collecting from another thread.

- bpo-28923: Remove editor artifacts from Tix.py.

- bpo-29055: Neaten-up empty population error on random.choice() by
  suppressing the upstream exception.

- bpo-28871: Fixed a crash when deallocate deep ElementTree.

- bpo-19542: Fix bugs in WeakValueDictionary.setdefault() and
  WeakValueDictionary.pop() when a GC collection happens in another thread.

- bpo-20191: Fixed a crash in resource.prlimit() when passing a sequence
  that doesn't own its elements as limits.

- bpo-28779: multiprocessing.set_forkserver_preload() would crash the
  forkserver process if a preloaded module instantiated some multiprocessing
  objects such as locks.

- bpo-28847: dbm.dumb now supports reading read-only files and no longer
  writes the index file when it is not changed.

- bpo-26937: The chown() method of the tarfile.TarFile class does not fail
  now when the grp module cannot be imported, as for example on Android
  platforms.

IDLE
----

- bpo-29071: IDLE colors f-string prefixes (but not invalid ur prefixes).

- bpo-28572: Add 10% to coverage of IDLE's test_configdialog. Update and
  augment description of the configuration system.

Windows
-------

- bpo-29579: Removes readme.txt from the installer

- bpo-29326: Ignores blank lines in ._pth files (Patch by Alexey Izbyshev)

- bpo-28164: Correctly handle special console filenames (patch by Eryk Sun)

- bpo-29409: Implement PEP 529 for io.FileIO (Patch by Eryk Sun)

- bpo-29392: Prevent crash when passing invalid arguments into msvcrt
  module.

- bpo-25778: winreg does not truncate string correctly (Patch by Eryk Sun)

- bpo-28896: Deprecate WindowsRegistryFinder and disable it by default.

C API
-----

- bpo-27867: Function PySlice_GetIndicesEx() is replaced with a macro if
  Py_LIMITED_API is not set or set to the value between 0x03050400 and
  0x03060000 (not including) or 0x03060100 or higher.

- bpo-29083: Fixed the declaration of some public API functions.
  PyArg_VaParse() and PyArg_VaParseTupleAndKeywords() were not available in
  limited API. PyArg_ValidateKeywordArguments(), PyArg_UnpackTuple() and
  Py_BuildValue() were not available in limited API of version < 3.3 when
  PY_SSIZE_T_CLEAN is defined.

- bpo-29058: All stable API extensions added after Python 3.2 are now
  available only when Py_LIMITED_API is set to the PY_VERSION_HEX value of
  the minimum Python version supporting this API.

Documentation
-------------

- bpo-28929: Link the documentation to its source file on GitHub.

- bpo-25008: Document smtpd.py as effectively deprecated and add a pointer
  to aiosmtpd, a third-party asyncio-based replacement.

- bpo-26355: Add canonical header link on each page to corresponding major
  version of the documentation. Patch by Matthias Bussonnier.

- bpo-29349: Fix Python 2 syntax in code for building the documentation.

Tests
-----

- bpo-28087: Skip test_asyncore and test_eintr poll failures on macOS. Skip
  some tests of select.poll when running on macOS due to unresolved issues
  with the underlying system poll function on some macOS versions.

- bpo-29571: to match the behaviour of the ``re.LOCALE`` flag,
  test_re.test_locale_flag now uses ``locale.getpreferredencoding(False)``
  to determine the candidate encoding for the test regex (allowing it to
  correctly skip the test when the default locale encoding is a multi-byte
  encoding)

- bpo-28950: Disallow -j0 to be combined with -T/-l in regrtest command line
  arguments.

- bpo-28683: Fix the tests that bind() a unix socket and raise
  PermissionError on Android for a non-root user.

- bpo-26939: Add the support.setswitchinterval() function to fix
  test_functools hanging on the Android armv7 qemu emulator.

Build
-----

- bpo-27593: sys.version and the platform module python_build(),
  python_branch(), and python_revision() functions now use git information
  rather than hg when building from a repo.

- bpo-29572: Update Windows build and OS X installers to use OpenSSL 1.0.2k.

- bpo-26851: Set Android compilation and link flags.

- bpo-28768: Fix implicit declaration of function _setmode. Patch by
  Masayuki Yamamoto

- bpo-29080: Removes hard dependency on hg.exe from PCBuild/build.bat

- bpo-23903: Added missed names to PC/python3.def.

- bpo-28762: lockf() is available on Android API level 24, but the F_LOCK
  macro is not defined in android-ndk-r13.

- bpo-28538: Fix the compilation error that occurs because if_nameindex() is
  available on Android API level 24, but the if_nameindex structure is not
  defined.

- bpo-20211: Do not add the directory for installing C header files and the
  directory for installing object code libraries to the cross compilation
  search paths. Original patch by Thomas Petazzoni.

- bpo-28849: Do not define sys.implementation._multiarch on Android.


What's New in Python 3.6.0 final?
=================================

*Release date: 2016-12-23*

No changes since release candidate 2



What's New in Python 3.6.0 release candidate 2?
===============================================

*Release date: 2016-12-16*

Core and Builtins
-----------------

- bpo-28147: Fix a memory leak in split-table dictionaries: setattr() must
  not convert combined table into split table. Patch written by INADA Naoki.

- bpo-28990: Fix asyncio SSL hanging if connection is closed before
  handshake is completed. (Patch by HoHo-Ho)

Tools/Demos
-----------

- bpo-28770: Fix python-gdb.py for fastcalls.

Windows
-------

- bpo-28896: Deprecate WindowsRegistryFinder.

Build
-----

- bpo-28898: Prevent gdb build errors due to HAVE_LONG_LONG redefinition.


What's New in Python 3.6.0 release candidate 1?
===============================================

*Release date: 2016-12-06*

Core and Builtins
-----------------

- bpo-23722: Rather than silently producing a class that doesn't support
  zero-argument ``super()`` in methods, failing to pass the new
  ``__classcell__`` namespace entry up to ``type.__new__`` now results in a
  ``DeprecationWarning`` and a class that supports zero-argument
  ``super()``.

- bpo-28797: Modifying the class __dict__ inside the __set_name__ method of
  a descriptor that is used inside that class no longer prevents calling the
  __set_name__ method of other descriptors.

- bpo-28782: Fix a bug in the implementation ``yield from`` when checking if
  the next instruction is YIELD_FROM. Regression introduced by WORDCODE
  (issue #26647).

Library
-------

- bpo-27030: Unknown escapes in re.sub() replacement template are allowed
  again.  But they still are deprecated and will be disabled in 3.7.

- bpo-28835: Fix a regression introduced in warnings.catch_warnings(): call
  warnings.showwarning() if it was overriden inside the context manager.

- bpo-27172: To assist with upgrades from 2.7, the previously documented
  deprecation of ``inspect.getfullargspec()`` has been reversed. This
  decision may be revisited again after the Python 2.7 branch is no longer
  officially supported.

- bpo-26273: Add new :data:`socket.TCP_CONGESTION` (Linux 2.6.13) and
  :data:`socket.TCP_USER_TIMEOUT` (Linux 2.6.37) constants. Patch written by
  Omar Sandoval.

- bpo-24142: Reading a corrupt config file left configparser in an invalid
  state. Original patch by Florian Höch.

- bpo-28843: Fix asyncio C Task to handle exceptions __traceback__.

C API
-----

- bpo-28808: PyUnicode_CompareWithASCIIString() now never raises exceptions.

Documentation
-------------

- bpo-23722: The data model reference and the porting section in the What's
  New guide now cover the additional ``__classcell__`` handling needed for
  custom metaclasses to fully support PEP 487 and zero-argument ``super()``.

Tools/Demos
-----------

- bpo-28023: Fix python-gdb.py didn't support new dict implementation.


What's New in Python 3.6.0 beta 4?
==================================

*Release date: 2016-11-21*

Core and Builtins
-----------------

- bpo-28532: Show sys.version when -V option is supplied twice.

- bpo-27100: The with-statement now checks for __enter__ before it checks
  for __exit__. This gives less confusing error messages when both methods
  are missing. Patch by Jonathan Ellington.

- bpo-28746: Fix the set_inheritable() file descriptor method on platforms
  that do not have the ioctl FIOCLEX and FIONCLEX commands.

- bpo-26920: Fix not getting the locale's charset upon initializing the
  interpreter, on platforms that do not have langinfo.

- bpo-28648: Fixed crash in Py_DecodeLocale() in debug build on Mac OS X
  when decode astral characters.  Patch by Xiang Zhang.

- bpo-19398: Extra slash no longer added to sys.path components in case of
  empty compile- time PYTHONPATH components.

- bpo-28665: Improve speed of the STORE_DEREF opcode by 40%.

- bpo-28583: PyDict_SetDefault didn't combine split table when needed. Patch
  by Xiang Zhang.

- bpo-27243: Change PendingDeprecationWarning -> DeprecationWarning. As it
  was agreed in the issue, __aiter__ returning an awaitable should result in
  PendingDeprecationWarning in 3.5 and in DeprecationWarning in 3.6.

- bpo-26182: Fix a refleak in code that raises DeprecationWarning.

- bpo-28721: Fix asynchronous generators aclose() and athrow() to handle
  StopAsyncIteration propagation properly.

Library
-------

- bpo-28752: Restored the __reduce__() methods of datetime objects.

- bpo-28727: Regular expression patterns, _sre.SRE_Pattern objects created
  by re.compile(), become comparable (only x==y and x!=y operators). This
  change should fix the issue #18383: don't duplicate warning filters when
  the warnings module is reloaded (thing usually only done in unit tests).

- bpo-20572: The subprocess.Popen.wait method's undocumented endtime
  parameter now raises a DeprecationWarning.

- bpo-25659: In ctypes, prevent a crash calling the from_buffer() and
  from_buffer_copy() methods on abstract classes like Array.

- bpo-19717: Makes Path.resolve() succeed on paths that do not exist. Patch
  by Vajrasky Kok

- bpo-28563: Fixed possible DoS and arbitrary code execution when handle
  plural form selections in the gettext module.  The expression parser now
  supports exact syntax supported by GNU gettext.

- bpo-28387: Fixed possible crash in _io.TextIOWrapper deallocator when the
  garbage collector is invoked in other thread.  Based on patch by Sebastian
  Cufre.

- bpo-28600: Optimize loop.call_soon.

- bpo-28613: Fix get_event_loop() return the current loop if called from
  coroutines/callbacks.

- bpo-28634: Fix asyncio.isfuture() to support unittest.Mock.

- bpo-26081: Fix refleak in _asyncio.Future.__iter__().throw.

- bpo-28639: Fix inspect.isawaitable to always return bool Patch by Justin
  Mayfield.

- bpo-28652: Make loop methods reject socket kinds they do not support.

- bpo-28653: Fix a refleak in functools.lru_cache.

- bpo-28703: Fix asyncio.iscoroutinefunction to handle Mock objects.

- bpo-28704: Fix create_unix_server to support Path-like objects (PEP 519).

- bpo-28720: Add collections.abc.AsyncGenerator.

Documentation
-------------

- bpo-28513: Documented command-line interface of zipfile.

Tests
-----

- bpo-28666: Now test.support.rmtree is able to remove unwritable or
  unreadable directories.

- bpo-23839: Various caches now are cleared before running every test file.

Build
-----

- bpo-10656: Fix out-of-tree building on AIX.  Patch by Tristan Carel and
  Michael Haubenwallner.

- bpo-26359: Rename --with-optimiations to --enable-optimizations.

- bpo-28676: Prevent missing 'getentropy' declaration warning on macOS.
  Patch by Gareth Rees.


What's New in Python 3.6.0 beta 3?
==================================

*Release date: 2016-10-31*

Core and Builtins
-----------------

- bpo-28128: Deprecation warning for invalid str and byte escape sequences
  now prints better information about where the error occurs. Patch by
  Serhiy Storchaka and Eric Smith.

- bpo-28509: dict.update() no longer allocate unnecessary large memory.

- bpo-28426: Fixed potential crash in PyUnicode_AsDecodedObject() in debug
  build.

- bpo-28517: Fixed of-by-one error in the peephole optimizer that caused
  keeping unreachable code.

- bpo-28214: Improved exception reporting for problematic __set_name__
  attributes.

- bpo-23782: Fixed possible memory leak in _PyTraceback_Add() and exception
  loss in PyTraceBack_Here().

- bpo-28471: Fix "Python memory allocator called without holding the GIL"
  crash in socket.setblocking.

Library
-------

- bpo-27517: LZMA compressor and decompressor no longer raise exceptions if
  given empty data twice.  Patch by Benjamin Fogle.

- bpo-28549: Fixed segfault in curses's addch() with ncurses6.

- bpo-28449: tarfile.open() with mode "r" or "r:" now tries to open a tar
  file with compression before trying to open it without compression.
  Otherwise it had 50% chance failed with ignore_zeros=True.

- bpo-23262: The webbrowser module now supports Firefox 36+ and derived
  browsers.  Based on patch by Oleg Broytman.

- bpo-27939: Fixed bugs in tkinter.ttk.LabeledScale and tkinter.Scale caused
  by representing the scale as float value internally in Tk.  tkinter.IntVar
  now works if float value is set to underlying Tk variable.

- bpo-18844: The various ways of specifying weights for random.choices() now
  produce the same result sequences.

- bpo-28255: calendar.TextCalendar().prmonth() no longer prints a space at
  the start of new line after printing a month's calendar.  Patch by Xiang
  Zhang.

- bpo-20491: The textwrap.TextWrapper class now honors non-breaking spaces.
  Based on patch by Kaarle Ritvanen.

- bpo-28353: os.fwalk() no longer fails on broken links.

- bpo-28430: Fix iterator of C implemented asyncio.Future doesn't accept
  non-None value is passed to it.send(val).

- bpo-27025: Generated names for Tkinter widgets now start by the "!" prefix
  for readability.

- bpo-25464: Fixed HList.header_exists() in tkinter.tix module by addin a
  workaround to Tix library bug.

- bpo-28488: shutil.make_archive() no longer adds entry "./" to ZIP archive.

- bpo-25953: re.sub() now raises an error for invalid numerical group
  reference in replacement template even if the pattern is not found in the
  string.  Error message for invalid group reference now includes the group
  index and the position of the reference. Based on patch by SilentGhost.

- bpo-18219: Optimize csv.DictWriter for large number of columns. Patch by
  Mariatta Wijaya.

- bpo-28448: Fix C implemented asyncio.Future didn't work on Windows.

- bpo-28480: Fix error building socket module when multithreading is
  disabled.

- bpo-24452: Make webbrowser support Chrome on Mac OS X.

- bpo-20766: Fix references leaked by pdb in the handling of SIGINT
  handlers.

- bpo-28492: Fix how StopIteration exception is raised in _asyncio.Future.

- bpo-28500: Fix asyncio to handle async gens GC from another thread.

- bpo-26923: Fix asyncio.Gather to refuse being cancelled once all children
  are done. Patch by Johannes Ebke.

- bpo-26796: Don't configure the number of workers for default threadpool
  executor. Initial patch by Hans Lawrenz.

- bpo-28544: Implement asyncio.Task in C.

Windows
-------

- bpo-28522: Fixes mishandled buffer reallocation in getpathp.c

Build
-----

- bpo-28444: Fix missing extensions modules when cross compiling.

- bpo-28208: Update Windows build and OS X installers to use SQLite 3.14.2.

- bpo-28248: Update Windows build and OS X installers to use OpenSSL 1.0.2j.

Tests
-----

- bpo-26944: Fix test_posix for Android where 'id -G' is entirely wrong or
  missing the effective gid.

- bpo-28409: regrtest: fix the parser of command line arguments.


What's New in Python 3.6.0 beta 2?
==================================

*Release date: 2016-10-10*

Core and Builtins
-----------------

- bpo-28183: Optimize and cleanup dict iteration.

- bpo-26081: Added C implementation of asyncio.Future. Original patch by
  Yury Selivanov.

- bpo-28379: Added sanity checks and tests for PyUnicode_CopyCharacters().
  Patch by Xiang Zhang.

- bpo-28376: The type of long range iterator is now registered as Iterator.
  Patch by Oren Milman.

- bpo-28376: Creating instances of range_iterator by calling range_iterator
  type now is deprecated.  Patch by Oren Milman.

- bpo-28376: The constructor of range_iterator now checks that step is not
  0. Patch by Oren Milman.

- bpo-26906: Resolving special methods of uninitialized type now causes
  implicit initialization of the type instead of a fail.

- bpo-18287: PyType_Ready() now checks that tp_name is not NULL. Original
  patch by Niklas Koep.

- bpo-24098: Fixed possible crash when AST is changed in process of
  compiling it.

- bpo-28201: Dict reduces possibility of 2nd conflict in hash table when
  hashes have same lower bits.

- bpo-28350: String constants with null character no longer interned.

- bpo-26617: Fix crash when GC runs during weakref callbacks.

- bpo-27942: String constants now interned recursively in tuples and
  frozensets.

- bpo-21578: Fixed misleading error message when ImportError called with
  invalid keyword args.

- bpo-28203: Fix incorrect type in complex(1.0, {2:3}) error message. Patch
  by Soumya Sharma.

- bpo-28086: Single var-positional argument of tuple subtype was passed
  unscathed to the C-defined function.  Now it is converted to exact tuple.

- bpo-28214: Now __set_name__ is looked up on the class instead of the
  instance.

- bpo-27955: Fallback on reading /dev/urandom device when the getrandom()
  syscall fails with EPERM, for example when blocked by SECCOMP.

- bpo-28192: Don't import readline in isolated mode.

- Upgrade internal unicode databases to Unicode version 9.0.0.

- bpo-28131: Fix a regression in zipimport's compile_source().  zipimport
  should use the same optimization level as the interpreter.

- bpo-28126: Replace Py_MEMCPY with memcpy(). Visual Studio can properly
  optimize memcpy().

- bpo-28120: Fix dict.pop() for splitted dictionary when trying to remove a
  "pending key" (Not yet inserted in split-table). Patch by Xiang Zhang.

- bpo-26182: Raise DeprecationWarning when async and await keywords are used
  as variable/attribute/class/function name.

Library
-------

- bpo-27998: Fixed bytes path support in os.scandir() on Windows. Patch by
  Eryk Sun.

- bpo-28317: The disassembler now decodes FORMAT_VALUE argument.

- bpo-26293: Fixed writing ZIP files that starts not from the start of the
  file.  Offsets in ZIP file now are relative to the start of the archive in
  conforming to the specification.

- bpo-28380: unittest.mock Mock autospec functions now properly support
  assert_called, assert_not_called, and assert_called_once.

- bpo-27181: remove statistics.geometric_mean and defer until 3.7.

- bpo-28229: lzma module now supports pathlib.

- bpo-28321: Fixed writing non-BMP characters with binary format in
  plistlib.

- bpo-28225: bz2 module now supports pathlib.  Initial patch by Ethan
  Furman.

- bpo-28227: gzip now supports pathlib.  Patch by Ethan Furman.

- bpo-27358: Optimized merging var-keyword arguments and improved error
  message when passing a non-mapping as a var-keyword argument.

- bpo-28257: Improved error message when passing a non-iterable as a var-
  positional argument.  Added opcode BUILD_TUPLE_UNPACK_WITH_CALL.

- bpo-28322: Fixed possible crashes when unpickle itertools objects from
  incorrect pickle data.  Based on patch by John Leitch.

- bpo-28228: imghdr now supports pathlib.

- bpo-28226: compileall now supports pathlib.

- bpo-28314: Fix function declaration (C flags) for the getiterator() method
  of xml.etree.ElementTree.Element.

- bpo-28148: Stop using localtime() and gmtime() in the time module.

  Introduced platform independent _PyTime_localtime API that is similar to
  POSIX localtime_r, but available on all platforms.  Patch by Ed Schouten.

- bpo-28253: Fixed calendar functions for extreme months: 0001-01 and
  9999-12.

  Methods itermonthdays() and itermonthdays2() are reimplemented so that
  they don't call itermonthdates() which can cause datetime.date
  under/overflow.

- bpo-28275: Fixed possible use after free in the decompress() methods of
  the LZMADecompressor and BZ2Decompressor classes. Original patch by John
  Leitch.

- bpo-27897: Fixed possible crash in sqlite3.Connection.create_collation()
  if pass invalid string-like object as a name.  Patch by Xiang Zhang.

- bpo-18844: random.choices() now has k as a keyword-only argument to
  improve the readability of common cases and come into line with the
  signature used in other languages.

- bpo-18893: Fix invalid exception handling in Lib/ctypes/macholib/dyld.py.
  Patch by Madison May.

- bpo-27611: Fixed support of default root window in the tkinter.tix module.
  Added the master parameter in the DisplayStyle constructor.

- bpo-27348: In the traceback module, restore the formatting of exception
  messages like "Exception: None".  This fixes a regression introduced in
  3.5a2.

- bpo-25651: Allow falsy values to be used for msg parameter of subTest().

- bpo-27778: Fix a memory leak in os.getrandom() when the getrandom() is
  interrupted by a signal and a signal handler raises a Python exception.

- bpo-28200: Fix memory leak on Windows in the os module (fix
  path_converter() function).

- bpo-25400: RobotFileParser now correctly returns default values for
  crawl_delay and request_rate.  Initial patch by Peter Wirtz.

- bpo-27932: Prevent memory leak in win32_ver().

- Fix UnboundLocalError in socket._sendfile_use_sendfile.

- bpo-28075: Check for ERROR_ACCESS_DENIED in Windows implementation of
  os.stat().  Patch by Eryk Sun.

- bpo-22493: Warning message emitted by using inline flags in the middle of
  regular expression now contains a (truncated) regex pattern. Patch by Tim
  Graham.

- bpo-25270: Prevent codecs.escape_encode() from raising SystemError when an
  empty bytestring is passed.

- bpo-28181: Get antigravity over HTTPS. Patch by Kaartic Sivaraam.

- bpo-25895: Enable WebSocket URL schemes in urllib.parse.urljoin. Patch by
  Gergely Imreh and Markus Holtermann.

- bpo-28114: Fix a crash in parse_envlist() when env contains byte strings.
  Patch by Eryk Sun.

- bpo-27599: Fixed buffer overrun in binascii.b2a_qp() and
  binascii.a2b_qp().

- bpo-27906: Fix socket accept exhaustion during high TCP traffic. Patch by
  Kevin Conway.

- bpo-28174: Handle when SO_REUSEPORT isn't properly supported. Patch by
  Seth Michael Larson.

- bpo-26654: Inspect functools.partial in asyncio.Handle.__repr__. Patch by
  iceboy.

- bpo-26909: Fix slow pipes IO in asyncio. Patch by INADA Naoki.

- bpo-28176: Fix callbacks race in asyncio.SelectorLoop.sock_connect.

- bpo-27759: Fix selectors incorrectly retain invalid file descriptors.
  Patch by Mark Williams.

- bpo-28368: Refuse monitoring processes if the child watcher has no loop
  attached. Patch by Vincent Michel.

- bpo-28369: Raise RuntimeError when transport's FD is used with add_reader,
  add_writer, etc.

- bpo-28370: Speedup asyncio.StreamReader.readexactly. Patch by Коренберг
  Марк.

- bpo-28371: Deprecate passing asyncio.Handles to run_in_executor.

- bpo-28372: Fix asyncio to support formatting of non-python coroutines.

- bpo-28399: Remove UNIX socket from FS before binding. Patch by Коренберг
  Марк.

- bpo-27972: Prohibit Tasks to await on themselves.

Windows
-------

- bpo-28402: Adds signed catalog files for stdlib on Windows.

- bpo-28333: Enables Unicode for ps1/ps2 and input() prompts. (Patch by Eryk
  Sun)

- bpo-28251: Improvements to help manuals on Windows.

- bpo-28110: launcher.msi has different product codes between 32-bit and
  64-bit

- bpo-28161: Opening CON for write access fails

- bpo-28162: WindowsConsoleIO readall() fails if first line starts with
  Ctrl+Z

- bpo-28163: WindowsConsoleIO fileno() passes wrong flags to _open_osfhandle

- bpo-28164: _PyIO_get_console_type fails for various paths

- bpo-28137: Renames Windows path file to ._pth

- bpo-28138: Windows ._pth file should allow import site

C API
-----

- bpo-28426: Deprecated undocumented functions PyUnicode_AsEncodedObject(),
  PyUnicode_AsDecodedObject(), PyUnicode_AsDecodedUnicode() and
  PyUnicode_AsEncodedUnicode().

Build
-----

- bpo-28258: Fixed build with Estonian locale (python-config and distclean
  targets in Makefile).  Patch by Arfrever Frehtes Taifersar Arahesis.

- bpo-26661: setup.py now detects system libffi with multiarch wrapper.

- bpo-15819: Remove redundant include search directory option for building
  outside the source tree.

Tests
-----

- bpo-28217: Adds _testconsole module to test console input.


What's New in Python 3.6.0 beta 1?
==================================

*Release date: 2016-09-12*

Core and Builtins
-----------------

- bpo-23722: The __class__ cell used by zero-argument super() is now
  initialized from type.__new__ rather than __build_class__, so class
  methods relying on that will now work correctly when called from metaclass
  methods during class creation. Patch by Martin Teichmann.

- bpo-25221: Fix corrupted result from PyLong_FromLong(0) when Python is
  compiled with NSMALLPOSINTS = 0.

- bpo-27080: Implement formatting support for PEP 515.  Initial patch by
  Chris Angelico.

- bpo-27199: In tarfile, expose copyfileobj bufsize to improve throughput.
  Patch by Jason Fried.

- bpo-27948: In f-strings, only allow backslashes inside the braces (where
  the expressions are).  This is a breaking change from the 3.6 alpha
  releases, where backslashes are allowed anywhere in an f-string.  Also,
  require that expressions inside f-strings be enclosed within literal
  braces, and not escapes like ``f'\x7b"hi"\x7d'``.

- bpo-28046: Remove platform-specific directories from sys.path.

- bpo-28071: Add early-out for differencing from an empty set.

- bpo-25758: Prevents zipimport from unnecessarily encoding a filename
  (patch by Eryk Sun)

- bpo-25856: The __module__ attribute of extension classes and functions now
  is interned. This leads to more compact pickle data with protocol 4.

- bpo-27213: Rework CALL_FUNCTION* opcodes to produce shorter and more
  efficient bytecode. Patch by Demur Rumed, design by Serhiy Storchaka,
  reviewed by Serhiy Storchaka and Victor Stinner.

- bpo-26331: Implement tokenizing support for PEP 515. Patch by Georg
  Brandl.

- bpo-27999: Make "global after use" a SyntaxError, and ditto for nonlocal.
  Patch by Ivan Levkivskyi.

- bpo-28003: Implement PEP 525 -- Asynchronous Generators.

- bpo-27985: Implement PEP 526 -- Syntax for Variable Annotations. Patch by
  Ivan Levkivskyi.

- bpo-26058: Add a new private version to the builtin dict type, incremented
  at each dictionary creation and at each dictionary change. Implementation
  of the PEP 509.

- bpo-27364: A backslash-character pair that is not a valid escape sequence
  now generates a DeprecationWarning.  Patch by Emanuel Barry.

- bpo-27350: `dict` implementation is changed like PyPy. It is more compact
  and preserves insertion order. (Concept developed by Raymond Hettinger and
  patch by Inada Naoki.)

- bpo-27911: Remove unnecessary error checks in
  ``exec_builtin_or_dynamic()``.

- bpo-27078: Added BUILD_STRING opcode.  Optimized f-strings evaluation.

- bpo-17884: Python now requires systems with inttypes.h and stdint.h

- bpo-27961: Require platforms to support ``long long``. Python hasn't
  compiled without ``long long`` for years, so this is basically a
  formality.

- bpo-27355: Removed support for Windows CE.  It was never finished, and
  Windows CE is no longer a relevant platform for Python.

- Implement PEP 523.

- bpo-27870: A left shift of zero by a large integer no longer attempts to
  allocate large amounts of memory.

- bpo-25402: In int-to-decimal-string conversion, improve the estimate of
  the intermediate memory required, and remove an unnecessarily strict
  overflow check. Patch by Serhiy Storchaka.

- bpo-27214: In long_invert, be more careful about modifying object returned
  by long_add, and remove an unnecessary check for small longs. Thanks Oren
  Milman for analysis and patch.

- bpo-27506: Support passing the bytes/bytearray.translate() "delete"
  argument by keyword.

- bpo-27812: Properly clear out a generator's frame's backreference to the
  generator to prevent crashes in frame.clear().

- bpo-27811: Fix a crash when a coroutine that has not been awaited is
  finalized with warnings-as-errors enabled.

- bpo-27587: Fix another issue found by PVS-Studio: Null pointer check after
  use of 'def' in _PyState_AddModule(). Initial patch by Christian Heimes.

- bpo-27792: The modulo operation applied to ``bool`` and other ``int``
  subclasses now always returns an ``int``. Previously the return type
  depended on the input values. Patch by Xiang Zhang.

- bpo-26984: int() now always returns an instance of exact int.

- bpo-25604: Fix a minor bug in integer true division; this bug could
  potentially have caused off-by-one-ulp results on platforms with
  unreliable ldexp implementations.

- bpo-24254: Make class definition namespace ordered by default.

- bpo-27662: Fix an overflow check in ``List_New``: the original code was
  checking against ``Py_SIZE_MAX`` instead of the correct upper bound of
  ``Py_SSIZE_T_MAX``. Patch by Xiang Zhang.

- bpo-27782: Multi-phase extension module import now correctly allows the
  ``m_methods`` field to be used to add module level functions to instances
  of non-module types returned from ``Py_create_mod``. Patch by Xiang Zhang.

- bpo-27936: The round() function accepted a second None argument for some
  types but not for others.  Fixed the inconsistency by accepting None for
  all numeric types.

- bpo-27487: Warn if a submodule argument to "python -m" or
  runpy.run_module() is found in sys.modules after parent packages are
  imported, but before the submodule is executed.

- bpo-27157: Make only type() itself accept the one-argument form. Patch by
  Eryk Sun and Emanuel Barry.

- bpo-27558: Fix a SystemError in the implementation of "raise" statement.
  In a brand new thread, raise a RuntimeError since there is no active
  exception to reraise. Patch written by Xiang Zhang.

- bpo-28008: Implement PEP 530 -- asynchronous comprehensions.

- bpo-27942: Fix memory leak in codeobject.c

Library
-------

- bpo-28732: Fix crash in os.spawnv() with no elements in args

- bpo-28485: Always raise ValueError for negative
  compileall.compile_dir(workers=...) parameter, even when multithreading is
  unavailable.

- bpo-28037: Use sqlite3_get_autocommit() instead of setting
  Connection->inTransaction manually.

- bpo-25283: Attributes tm_gmtoff and tm_zone are now available on all
  platforms in the return values of time.localtime() and time.gmtime().

- bpo-24454: Regular expression match object groups are now accessible using
  __getitem__. "mo[x]" is equivalent to "mo.group(x)".

- bpo-10740: sqlite3 no longer implicitly commit an open transaction before
  DDL statements.

- bpo-17941: Add a *module* parameter to collections.namedtuple().

- bpo-22493: Inline flags now should be used only at the start of the
  regular expression. Deprecation warning is emitted if uses them in the
  middle of the regular expression.

- bpo-26885: xmlrpc now supports unmarshalling additional data types used by
  Apache XML- RPC implementation for numerics and None.

- bpo-28070: Fixed parsing inline verbose flag in regular expressions.

- bpo-19500: Add client-side SSL session resumption to the ssl module.

- bpo-28022: Deprecate ssl-related arguments in favor of SSLContext. The
  deprecation include manual creation of SSLSocket and certfile/keyfile (or
  similar) in ftplib, httplib, imaplib, smtplib, poplib and urllib.

- bpo-28043: SSLContext has improved default settings: OP_NO_SSLv2,
  OP_NO_SSLv3, OP_NO_COMPRESSION, OP_CIPHER_SERVER_PREFERENCE,
  OP_SINGLE_DH_USE, OP_SINGLE_ECDH_USE and HIGH ciphers without MD5.

- bpo-24693: Changed some RuntimeError's in the zipfile module to more
  appropriate types. Improved some error messages and debugging output.

- bpo-17909: ``json.load`` and ``json.loads`` now support binary input
  encoded as UTF-8, UTF-16 or UTF-32. Patch by Serhiy Storchaka.

- bpo-27137: the pure Python fallback implementation of
  ``functools.partial`` now matches the behaviour of its accelerated C
  counterpart for subclassing, pickling and text representation purposes.
  Patch by Emanuel Barry and Serhiy Storchaka.

- Fix possible integer overflows and crashes in the mmap module with unusual
  usage patterns.

- bpo-1703178: Fix the ability to pass the --link-objects option to the
  distutils build_ext command.

- bpo-28019: itertools.count() no longer rounds non-integer step in range
  between 1.0 and 2.0 to 1.

- bpo-18401: Pdb now supports the 'readrc' keyword argument to control
  whether .pdbrc files should be read.  Patch by Martin Matusiak and Sam
  Kimbrel.

- bpo-25969: Update the lib2to3 grammar to handle the unpacking
  generalizations added in 3.5.

- bpo-14977: mailcap now respects the order of the lines in the mailcap
  files ("first match"), as required by RFC 1542.  Patch by Michael Lazar.

- bpo-28082: Convert re flag constants to IntFlag.

- bpo-28025: Convert all ssl module constants to IntEnum and IntFlags.
  SSLContext properties now return flags and enums.

- bpo-23591: Add Flag, IntFlag, and auto() to enum module.

- bpo-433028: Added support of modifier spans in regular expressions.

- bpo-24594: Validates persist parameter when opening MSI database

- bpo-17582: xml.etree.ElementTree nows preserves whitespaces in attributes
  (Patch by Duane Griffin.  Reviewed and approved by Stefan Behnel.)

- bpo-28047: Fixed calculation of line length used for the base64 CTE in the
  new email policies.

- bpo-27576: Fix call order in OrderedDict.__init__().

- email.generator.DecodedGenerator now supports the policy keyword.

- bpo-28027: Remove undocumented modules from ``Lib/plat-*``: IN, CDROM,
  DLFCN, TYPES, CDIO, and STROPTS.

- bpo-27445: Don't pass str(_charset) to MIMEText.set_payload(). Patch by
  Claude Paroz.

- bpo-24277: The new email API is no longer provisional, and the docs have
  been reorganized and rewritten to emphasize the new API.

- bpo-22450: urllib now includes an ``Accept: */*`` header among the default
  headers. This makes the results of REST API requests more consistent and
  predictable especially when proxy servers are involved.

- lib2to3.pgen3.driver.load_grammar() now creates a stable cache file
  between runs given the same Grammar.txt input regardless of the hash
  randomization setting.

- bpo-28005: Allow ImportErrors in encoding implementation to propagate.

- bpo-26667: Support path-like objects in importlib.util.

- bpo-27570: Avoid zero-length memcpy() etc calls with null source pointers
  in the "ctypes" and "array" modules.

- bpo-22233: Break email header lines *only* on the RFC specified CR and LF
  characters, not on arbitrary unicode line breaks.  This also fixes a bug
  in HTTP header parsing.

- bpo-27331: The email.mime classes now all accept an optional policy
  keyword.

- bpo-27988: Fix email iter_attachments incorrect mutation of payload list.

- bpo-16113: Add SHA-3 and SHAKE support to hashlib module.

- Eliminate a tautological-pointer-compare warning in _scproxy.c.

- bpo-27776: The :func:`os.urandom` function does now block on Linux 3.17
  and newer until the system urandom entropy pool is initialized to increase
  the security. This change is part of the :pep:`524`.

- bpo-27778: Expose the Linux ``getrandom()`` syscall as a new
  :func:`os.getrandom` function. This change is part of the :pep:`524`.

- bpo-27691: Fix ssl module's parsing of GEN_RID subject alternative name
  fields in X.509 certs.

- bpo-18844: Add random.choices().

- bpo-25761: Improved error reporting about truncated pickle data in C
  implementation of unpickler.  UnpicklingError is now raised instead of
  AttributeError and ValueError in some cases.

- bpo-26798: Add BLAKE2 (blake2b and blake2s) to hashlib.

- bpo-26032: Optimized globbing in pathlib by using os.scandir(); it is now
  about 1.5--4 times faster.

- bpo-25596: Optimized glob() and iglob() functions in the glob module; they
  are now about 3--6 times faster.

- bpo-27928: Add scrypt (password-based key derivation function) to hashlib
  module (requires OpenSSL 1.1.0).

- bpo-27850: Remove 3DES from ssl module's default cipher list to counter
  measure sweet32 attack (CVE-2016-2183).

- bpo-27766: Add ChaCha20 Poly1305 to ssl module's default ciper list.
  (Required OpenSSL 1.1.0 or LibreSSL).

- bpo-25387: Check return value of winsound.MessageBeep.

- bpo-27866: Add SSLContext.get_ciphers() method to get a list of all
  enabled ciphers.

- bpo-27744: Add AF_ALG (Linux Kernel crypto) to socket module.

- bpo-26470: Port ssl and hashlib module to OpenSSL 1.1.0.

- bpo-11620: Fix support for SND_MEMORY in winsound.PlaySound.  Based on a
  patch by Tim Lesher.

- bpo-11734: Add support for IEEE 754 half-precision floats to the struct
  module. Based on a patch by Eli Stevens.

- bpo-27919: Deprecated ``extra_path`` distribution option in distutils
  packaging.

- bpo-23229: Add new ``cmath`` constants: ``cmath.inf`` and ``cmath.nan`` to
  match ``math.inf`` and ``math.nan``, and also ``cmath.infj`` and
  ``cmath.nanj`` to match the format used by complex repr.

- bpo-27842: The csv.DictReader now returns rows of type OrderedDict.
  (Contributed by Steve Holden.)

- Remove support for passing a file descriptor to os.access. It never worked
  but previously didn't raise.

- bpo-12885: Fix error when distutils encounters symlink.

- bpo-27881: Fixed possible bugs when setting
  sqlite3.Connection.isolation_level. Based on patch by Xiang Zhang.

- bpo-27861: Fixed a crash in sqlite3.Connection.cursor() when a factory
  creates not a cursor.  Patch by Xiang Zhang.

- bpo-19884: Avoid spurious output on OS X with Gnu Readline.

- bpo-27706: Restore deterministic behavior of random.Random().seed() for
  string seeds using seeding version 1.  Allows sequences of calls to
  random() to exactly match those obtained in Python 2. Patch by Nofar
  Schnider.

- bpo-10513: Fix a regression in Connection.commit().  Statements should not
  be reset after a commit.

- bpo-12319: Chunked transfer encoding support added to
  http.client.HTTPConnection requests.  The
  urllib.request.AbstractHTTPHandler class does not enforce a Content-Length
  header any more.  If a HTTP request has a file or iterable body, but no
  Content-Length header, the library now falls back to use chunked transfer-
  encoding.

- A new version of typing.py from https://github.com/python/typing: -
  Collection (only for 3.6) (Issue #27598) - Add FrozenSet to __all__
  (upstream #261) - fix crash in _get_type_vars() (upstream #259) - Remove
  the dict constraint in ForwardRef._eval_type (upstream #252)

- bpo-27832: Make ``_normalize`` parameter to ``Fraction`` constuctor
  keyword-only, so that ``Fraction(2, 3, 4)`` now raises ``TypeError``.

- bpo-27539: Fix unnormalised ``Fraction.__pow__`` result in the case of
  negative exponent and negative base.

- bpo-21718: cursor.description is now available for queries using CTEs.

- bpo-27819: In distutils sdists, simply produce the "gztar" (gzipped tar
  format) distributions on all platforms unless "formats" is supplied.

- bpo-2466: posixpath.ismount now correctly recognizes mount points which
  the user does not have permission to access.

- bpo-9998: On Linux, ctypes.util.find_library now looks in LD_LIBRARY_PATH
  for shared libraries.

- bpo-27573: exit message for code.interact is now configurable.

- bpo-27930: Improved behaviour of logging.handlers.QueueListener. Thanks to
  Paulo Andrade and Petr Viktorin for the analysis and patch.

- bpo-6766: Distributed reference counting added to multiprocessing to
  support nesting of shared values / proxy objects.

- bpo-21201: Improves readability of multiprocessing error message.  Thanks
  to Wojciech Walczak for patch.

- asyncio: Add set_protocol / get_protocol to Transports.

- bpo-27456: asyncio: Set TCP_NODELAY by default.

IDLE
----

- bpo-15308: Add 'interrupt execution' (^C) to Shell menu. Patch by Roger
  Serwy, updated by Bayard Randel.

- bpo-27922: Stop IDLE tests from 'flashing' gui widgets on the screen.

- bpo-27891: Consistently group and sort imports within idlelib modules.

- bpo-17642: add larger font sizes for classroom projection.

- Add version to title of IDLE help window.

- bpo-25564: In section on IDLE -- console differences, mention that using
  exec means that __builtins__ is defined for each statement.

- bpo-27821: Fix 3.6.0a3 regression that prevented custom key sets from
  being selected when no custom theme was defined.

C API
-----

- bpo-26900: Excluded underscored names and other private API from limited
  API.

- bpo-26027: Add support for path-like objects in PyUnicode_FSConverter() &
  PyUnicode_FSDecoder().

Tests
-----

- bpo-27427: Additional tests for the math module. Patch by Francisco Couzo.

- bpo-27953: Skip math and cmath tests that fail on OS X 10.4 due to a poor
  libm implementation of tan.

- bpo-26040: Improve test_math and test_cmath coverage and rigour. Patch by
  Jeff Allen.

- bpo-27787: Call gc.collect() before checking each test for "dangling
  threads", since the dangling threads are weak references.

Build
-----

- bpo-27566: Fix clean target in freeze makefile (patch by Lisa Roach)

- bpo-27705: Update message in validate_ucrtbase.py

- bpo-27976: Deprecate building _ctypes with the bundled copy of libffi on
  non-OSX UNIX platforms.

- bpo-27983: Cause lack of llvm-profdata tool when using clang as required
  for PGO linking to be a configure time error rather than make time when
  --with- optimizations is enabled.  Also improve our ability to find the
  llvm- profdata tool on MacOS and some Linuxes.

- bpo-21590: Support for DTrace and SystemTap probes.

- bpo-26307: The profile-opt build now applies PGO to the built-in modules.

- bpo-26359: Add the --with-optimizations flag to turn on LTO and PGO build
  support when available.

- bpo-27917: Set platform triplets for Android builds.

- bpo-25825: Update references to the $(LIBPL) installation path on AIX.
  This path was changed in 3.2a4.

- Update OS X installer to use SQLite 3.14.1 and XZ 5.2.2.

- bpo-21122: Fix LTO builds on OS X.

- bpo-17128: Build OS X installer with a private copy of OpenSSL. Also
  provide a sample Install Certificates command script to install a set of
  root certificates from the third-party certifi module.

Tools/Demos
-----------

- bpo-27952: Get Tools/scripts/fixcid.py working with Python 3 and the
  current "re" module, avoid invalid Python backslash escapes, and fix a bug
  parsing escaped C quote signs.

Windows
-------

- bpo-28065: Update xz dependency to 5.2.2 and build it from source.

- bpo-25144: Ensures TargetDir is set before continuing with custom install.

- bpo-1602: Windows console doesn't input or print Unicode (PEP 528)

- bpo-27781: Change file system encoding on Windows to UTF-8 (PEP 529)

- bpo-27731: Opt-out of MAX_PATH on Windows 10

- bpo-6135: Adds encoding and errors parameters to subprocess.

- bpo-27959: Adds oem encoding, alias ansi to mbcs, move aliasmbcs to codec
  lookup.

- bpo-27982: The functions of the winsound module now accept keyword
  arguments.

- bpo-20366: Build full text search support into SQLite on Windows.

- bpo-27756: Adds new icons for Python files and processes on Windows.
  Designs by Cherry Wang.

- bpo-27883: Update sqlite to 3.14.1.0 on Windows.


What's New in Python 3.6.0 alpha 4?
===================================

*Release date: 2016-08-15*

Core and Builtins
-----------------

- bpo-27704: Optimized creating bytes and bytearray from byte-like objects
  and iterables. Speed up to 3 times for short objects.  Original patch by
  Naoki Inada.

- bpo-26823: Large sections of repeated lines in tracebacks are now
  abbreviated as "[Previous line repeated {count} more times]" by the
  builtin traceback rendering. Patch by Emanuel Barry.

- bpo-27574: Decreased an overhead of parsing keyword arguments in functions
  implemented with using Argument Clinic.

- bpo-22557: Now importing already imported modules is up to 2.5 times
  faster.

- bpo-17596: Include <wincrypt.h> to help with Min GW building.

- bpo-17599: On Windows, rename the privately defined REPARSE_DATA_BUFFER
  structure to avoid conflicting with the definition from Min GW.

- bpo-27507: Add integer overflow check in bytearray.extend().  Patch by
  Xiang Zhang.

- bpo-27581: Don't rely on wrapping for overflow check in
  PySequence_Tuple().  Patch by Xiang Zhang.

- bpo-1621: Avoid signed integer overflow in list and tuple operations.
  Patch by Xiang Zhang.

- bpo-27419: Standard __import__() no longer look up "__import__" in globals
  or builtins for importing submodules or "from import".  Fixed a crash if
  raise a warning about unabling to resolve package from __spec__ or
  __package__.

- bpo-27083: Respect the PYTHONCASEOK environment variable under Windows.

- bpo-27514: Make having too many statically nested blocks a SyntaxError
  instead of SystemError.

- bpo-27366: Implemented PEP 487 (Simpler customization of class creation).
  Upon subclassing, the __init_subclass__ classmethod is called on the base
  class. Descriptors are initialized with __set_name__ after class creation.

Library
-------

- bpo-26027: Add PEP 519/__fspath__() support to the os and os.path modules.
  Includes code from Jelle Zijlstra. (See also: bpo-27524)

- bpo-27598: Add Collections to collections.abc. Patch by Ivan Levkivskyi,
  docs by Neil Girdhar.

- bpo-25958: Support "anti-registration" of special methods from various
  ABCs, like __hash__, __iter__ or __len__.  All these (and several more)
  can be set to None in an implementation class and the behavior will be as
  if the method is not defined at all. (Previously, this mechanism existed
  only for __hash__, to make mutable classes unhashable.)  Code contributed
  by Andrew Barnert and Ivan Levkivskyi.

- bpo-16764: Support keyword arguments to zlib.decompress().  Patch by Xiang
  Zhang.

- bpo-27736: Prevent segfault after interpreter re-initialization due to ref
  count problem introduced in code for Issue #27038 in 3.6.0a3. Patch by
  Xiang Zhang.

- bpo-25628: The *verbose* and *rename* parameters for
  collections.namedtuple are now keyword-only.

- bpo-12345: Add mathematical constant tau to math and cmath. See also PEP
  628.

- bpo-26823: traceback.StackSummary.format now abbreviates large sections of
  repeated lines as "[Previous line repeated {count} more times]" (this
  change then further affects other traceback display operations in the
  module). Patch by Emanuel Barry.

- bpo-27664: Add to concurrent.futures.thread.ThreadPoolExecutor() the
  ability to specify a thread name prefix.

- bpo-27181: Add geometric_mean and harmonic_mean to statistics module.

- bpo-27573: code.interact now prints an message when exiting.

- bpo-6422: Add autorange method to timeit.Timer objects.

- bpo-27773: Correct some memory management errors server_hostname in
  _ssl.wrap_socket().

- bpo-26750: unittest.mock.create_autospec() now works properly for
  subclasses of property() and other data descriptors.  Removes the never
  publicly used, never documented unittest.mock.DescriptorTypes tuple.

- bpo-26754: Undocumented support of general bytes-like objects as path in
  compile() and similar functions is now deprecated.

- bpo-26800: Undocumented support of general bytes-like objects as paths in
  os functions is now deprecated.

- bpo-26981: Add _order_ compatibility shim to enum.Enum for Python 2/3 code
  bases.

- bpo-27661: Added tzinfo keyword argument to datetime.combine.

- In the curses module, raise an error if window.getstr() or window.instr()
  is passed a negative value.

- bpo-27783: Fix possible usage of uninitialized memory in
  operator.methodcaller.

- bpo-27774: Fix possible Py_DECREF on unowned object in _sre.

- bpo-27760: Fix possible integer overflow in binascii.b2a_qp.

- bpo-27758: Fix possible integer overflow in the _csv module for large
  record lengths.

- bpo-27568: Prevent HTTPoxy attack (CVE-2016-1000110). Ignore the
  HTTP_PROXY variable when REQUEST_METHOD environment is set, which
  indicates that the script is in CGI mode.

- bpo-7063: Remove dead code from the "array" module's slice handling. Patch
  by Chuck.

- bpo-27656: Do not assume sched.h defines any SCHED_* constants.

- bpo-27130: In the "zlib" module, fix handling of large buffers (typically
  4 GiB) when compressing and decompressing.  Previously, inputs were
  limited to 4 GiB, and compression and decompression operations did not
  properly handle results of 4 GiB.

- bpo-24773: Implemented PEP 495 (Local Time Disambiguation).

- Expose the EPOLLEXCLUSIVE constant (when it is defined) in the select
  module.

- bpo-27567: Expose the EPOLLRDHUP and POLLRDHUP constants in the select
  module.

- bpo-1621: Avoid signed int negation overflow in the "audioop" module.

- bpo-27533: Release GIL in nt._isdir

- bpo-17711: Fixed unpickling by the persistent ID with protocol 0. Original
  patch by Alexandre Vassalotti.

- bpo-27522: Avoid an unintentional reference cycle in email.feedparser.

- bpo-27512: Fix a segfault when os.fspath() called an __fspath__() method
  that raised an exception. Patch by Xiang Zhang.

IDLE
----

- bpo-27714: text_textview and test_autocomplete now pass when re-run in the
  same process.  This occurs when test_idle fails when run with the -w
  option but without -jn.  Fix warning from test_config.

- bpo-27621: Put query response validation error messages in the query box
  itself instead of in a separate massagebox.  Redo tests to match. Add Mac
  OSX refinements. Original patch by Mark Roseman.

- bpo-27620: Escape key now closes Query box as cancelled.

- bpo-27609: IDLE: tab after initial whitespace should tab, not
  autocomplete. This fixes problem with writing docstrings at least twice
  indented.

- bpo-27609: Explicitly return None when there are also non-None returns. In
  a few cases, reverse a condition and eliminate a return.

- bpo-25507: IDLE no longer runs buggy code because of its tkinter imports.
  Users must include the same imports required to run directly in Python.

- bpo-27173: Add 'IDLE Modern Unix' to the built-in key sets. Make the
  default key set depend on the platform. Add tests for the changes to the
  config module.

- bpo-27452: add line counter and crc to IDLE configHandler test dump.

Tests
-----

- bpo-25805: Skip a test in test_pkgutil as needed that doesn't work when
  ``__name__ == __main__``. Patch by SilentGhost.

- bpo-27472: Add test.support.unix_shell as the path to the default shell.

- bpo-27369: In test_pyexpat, avoid testing an error message detail that
  changed in Expat 2.2.0.

- bpo-27594: Prevent assertion error when running test_ast with coverage
  enabled: ensure code object has a valid first line number. Patch suggested
  by Ivan Levkivskyi.

Windows
-------

- bpo-27647: Update bundled Tcl/Tk to 8.6.6.

- bpo-27610: Adds PEP 514 metadata to Windows installer

- bpo-27469: Adds a shell extension to the launcher so that drag and drop
  works correctly.

- bpo-27309: Enables proper Windows styles in python[w].exe manifest.

Build
-----

- bpo-27713: Suppress spurious build warnings when updating importlib's
  bootstrap files. Patch by Xiang Zhang

- bpo-25825: Correct the references to Modules/python.exp, which is required
  on AIX.  The references were accidentally changed in 3.5.0a1.

- bpo-27453: CPP invocation in configure must use CPPFLAGS. Patch by Chi
  Hsuan Yen.

- bpo-27641: The configure script now inserts comments into the makefile to
  prevent the pgen and _freeze_importlib executables from being cross-
  compiled.

- bpo-26662: Set PYTHON_FOR_GEN in configure as the Python program to be
  used for file generation during the build.

- bpo-10910: Avoid C++ compilation errors on FreeBSD and OS X. Also update
  FreedBSD version checks for the original ctype UTF-8 workaround.


What's New in Python 3.6.0 alpha 3?
===================================

*Release date: 2016-07-11*

Core and Builtins
-----------------

- bpo-27473: Fixed possible integer overflow in bytes and bytearray
  concatenations. Patch by Xiang Zhang.

- bpo-23034: The output of a special Python build with defined COUNT_ALLOCS,
  SHOW_ALLOC_COUNT or SHOW_TRACK_COUNT macros is now off by  default.  It
  can be re-enabled using the "-X showalloccount" option.  It now outputs to
  stderr instead of stdout.

- bpo-27443: __length_hint__() of bytearray iterators no longer return a
  negative integer for a resized bytearray.

- bpo-27007: The fromhex() class methods of bytes and bytearray subclasses
  now return an instance of corresponding subclass.

Library
-------

- bpo-26844: Fix error message for imp.find_module() to refer to 'path'
  instead of 'name'. Patch by Lev Maximov.

- bpo-23804: Fix SSL zero-length recv() calls to not block and not raise an
  error about unclean EOF.

- bpo-27466: Change time format returned by http.cookie.time2netscape,
  confirming the netscape cookie format and making it consistent with
  documentation.

- bpo-21708: Deprecated dbm.dumb behavior that differs from common dbm
  behavior: creating a database in 'r' and 'w' modes and modifying a
  database in 'r' mode.

- bpo-26721: Change the socketserver.StreamRequestHandler.wfile attribute to
  implement BufferedIOBase. In particular, the write() method no longer does
  partial writes.

- bpo-22115: Added methods trace_add, trace_remove and trace_info in the
  tkinter.Variable class.  They replace old methods trace_variable, trace,
  trace_vdelete and trace_vinfo that use obsolete Tcl commands and might not
  work in future versions of Tcl.  Fixed old tracing methods:
  trace_vdelete() with wrong mode no longer break tracing, trace_vinfo() now
  always returns a list of pairs of strings, tracing in the "u" mode now
  works.

- bpo-26243: Only the level argument to zlib.compress() is keyword argument
  now.  The first argument is positional-only.

- bpo-27038: Expose the DirEntry type as os.DirEntry. Code patch by Jelle
  Zijlstra.

- bpo-27186: Update os.fspath()/PyOS_FSPath() to check the return value of
  __fspath__() to be either str or bytes.

- bpo-18726: All optional parameters of the dump(), dumps(), load() and
  loads() functions and JSONEncoder and JSONDecoder class constructors in
  the json module are now keyword-only.

- bpo-27319: Methods selection_set(), selection_add(), selection_remove()
  and selection_toggle() of ttk.TreeView now allow passing multiple items as
  multiple arguments instead of passing them as a tuple.  Deprecated
  undocumented ability of calling the selection() method with arguments.

- bpo-27079: Fixed curses.ascii functions isblank(), iscntrl() and
  ispunct().

- bpo-27294: Numerical state in the repr for Tkinter event objects is now
  represented as a combination of known flags.

- bpo-27177: Match objects in the re module now support index-like objects
  as group indices.  Based on patches by Jeroen Demeyer and Xiang Zhang.

- bpo-26754: Some functions (compile() etc) accepted a filename argument
  encoded as an iterable of integers. Now only strings and byte-like objects
  are accepted.

- bpo-26536: socket.ioctl now supports SIO_LOOPBACK_FAST_PATH. Patch by
  Daniel Stokes.

- bpo-27048: Prevents distutils failing on Windows when environment
  variables contain non-ASCII characters

- bpo-27330: Fixed possible leaks in the ctypes module.

- bpo-27238: Got rid of bare excepts in the turtle module.  Original patch
  by Jelle Zijlstra.

- bpo-27122: When an exception is raised within the context being managed by
  a contextlib.ExitStack() and one of the exit stack generators catches and
  raises it in a chain, do not re-raise the original exception when exiting,
  let the new chained one through.  This avoids the PEP 479 bug described in
  issue25782.

Security
--------

- bpo-27278: Fix os.urandom() implementation using getrandom() on Linux.
  Truncate size to INT_MAX and loop until we collected enough random bytes,
  instead of casting a directly Py_ssize_t to int.

Library
-------

- bpo-16864: sqlite3.Cursor.lastrowid now supports REPLACE statement.
  Initial patch by Alex LordThorsen.

- bpo-26386: Fixed ttk.TreeView selection operations with item id's
  containing spaces.

- bpo-8637: Honor a pager set by the env var MANPAGER (in preference to one
  set by the env var PAGER).

Security
--------

- bpo-22636: Avoid shell injection problems with ctypes.util.find_library().

Library
-------

- bpo-16182: Fix various functions in the "readline" module to use the
  locale encoding, and fix get_begidx() and get_endidx() to return code
  point indexes.

- bpo-27392: Add loop.connect_accepted_socket(). Patch by Jim Fulton.

IDLE
----

- bpo-27477: IDLE search dialogs now use ttk widgets.

- bpo-27173: Add 'IDLE Modern Unix' to the built-in key sets. Make the
  default key set depend on the platform. Add tests for the changes to the
  config module.

- bpo-27452: make command line "idle-test> python test_help.py" work.
  __file__ is relative when python is started in the file's directory.

- bpo-27452: add line counter and crc to IDLE configHandler test dump.

- bpo-27380: IDLE: add query.py with base Query dialog and ttk widgets.
  Module had subclasses SectionName, ModuleName, and HelpSource, which are
  used to get information from users by configdialog and file =>Load Module.
  Each subclass has itw own validity checks.  Using ModuleName allows users
  to edit bad module names instead of starting over. Add tests and delete
  the two files combined into the new one.

- bpo-27372: Test_idle no longer changes the locale.

- bpo-27365: Allow non-ascii chars in IDLE NEWS.txt, for contributor names.

- bpo-27245: IDLE: Cleanly delete custom themes and key bindings.
  Previously, when IDLE was started from a console or by import, a cascade
  of warnings was emitted. Patch by Serhiy Storchaka.

- bpo-24137: Run IDLE, test_idle, and htest with tkinter default root
  disabled.  Fix code and tests that fail with this restriction.  Fix htests
  to not create a second and redundant root and mainloop.

- bpo-27310: Fix IDLE.app failure to launch on OS X due to vestigial import.

C API
-----

- bpo-26754: PyUnicode_FSDecoder() accepted a filename argument encoded as
  an iterable of integers. Now only strings and byte-like objects are
  accepted.

Build
-----

- bpo-28066: Fix the logic that searches build directories for generated
  include files when building outside the source tree.

- bpo-27442: Expose the Android API level that python was built against, in
  sysconfig.get_config_vars() as 'ANDROID_API_LEVEL'.

- bpo-27434: The interpreter that runs the cross-build, found in PATH, must
  now be of the same feature version (e.g. 3.6) as the source being built.

- bpo-26930: Update Windows builds to use OpenSSL 1.0.2h.

- bpo-23968: Rename the platform directory from plat-$(MACHDEP) to
  plat-$(PLATFORM_TRIPLET). Rename the config directory (LIBPL) from
  config-$(LDVERSION) to config-$(LDVERSION)-$(PLATFORM_TRIPLET). Install
  the platform specifc _sysconfigdata module into the platform directory and
  rename it to include the ABIFLAGS.

- Don't use largefile support for GNU/Hurd.

Tools/Demos
-----------

- bpo-27332: Fixed the type of the first argument of module-level functions
  generated by Argument Clinic.  Patch by Petr Viktorin.

- bpo-27418: Fixed Tools/importbench/importbench.py.

Documentation
-------------

- bpo-19489: Moved the search box from the sidebar to the header and footer
  of each page. Patch by Ammar Askar.

- bpo-27285: Update documentation to reflect the deprecation of ``pyvenv``
  and normalize on the term "virtual environment". Patch by Steve Piercy.

Tests
-----

- bpo-27027: Added test.support.is_android that is True when this is an
  Android build.


What's New in Python 3.6.0 alpha 2?
===================================

*Release date: 2016-06-13*

Core and Builtins
-----------------

- bpo-27095: Simplified MAKE_FUNCTION and removed MAKE_CLOSURE opcodes.
  Patch by Demur Rumed.

- bpo-27190: Raise NotSupportedError if sqlite3 is older than 3.3.1. Patch
  by Dave Sawyer.

- bpo-27286: Fixed compiling BUILD_MAP_UNPACK_WITH_CALL opcode.  Calling
  function with generalized unpacking (PEP 448) and conflicting keyword
  names could cause undefined behavior.

- bpo-27140: Added BUILD_CONST_KEY_MAP opcode.

- bpo-27186: Add support for os.PathLike objects to open() (part of PEP
  519).

- bpo-27066: Fixed SystemError if a custom opener (for open()) returns a
  negative number without setting an exception.

- bpo-26983: float() now always return an instance of exact float. The
  deprecation warning is emitted if __float__ returns an instance of a
  strict subclass of float.  In a future versions of Python this can be an
  error.

- bpo-27097: Python interpreter is now about 7% faster due to optimized
  instruction decoding.  Based on patch by Demur Rumed.

- bpo-26647: Python interpreter now uses 16-bit wordcode instead of
  bytecode. Patch by Demur Rumed.

- bpo-23275: Allow assigning to an empty target list in round brackets: () =
  iterable.

- bpo-27243: Update the __aiter__ protocol: instead of returning an
  awaitable that resolves to an asynchronous iterator, the asynchronous
  iterator should be returned directly.  Doing the former will trigger a
  PendingDeprecationWarning.

Library
-------

- Comment out socket (SO_REUSEPORT) and posix (O_SHLOCK, O_EXLOCK) constants
  exposed on the API which are not implemented on GNU/Hurd. They would not
  work at runtime anyway.

- bpo-27025: Generated names for Tkinter widgets are now more meanful and
  recognizirable.

- bpo-25455: Fixed crashes in repr of recursive ElementTree.Element and
  functools.partial objects.

- bpo-27294: Improved repr for Tkinter event objects.

- bpo-20508: Improve exception message of IPv{4,6}Network.__getitem__. Patch
  by Gareth Rees.

Security
--------

- bpo-26556: Update expat to 2.1.1, fixes CVE-2015-1283.

- Fix TLS stripping vulnerability in smtplib, CVE-2016-0772. Reported by
  Team Oststrom.

Library
-------

- bpo-21386: Implement missing IPv4Address.is_global property.  It was
  documented since 07a5610bae9d.  Initial patch by Roger Luethi.

- bpo-27029: Removed deprecated support of universal newlines mode from
  ZipFile.open().

- bpo-27030: Unknown escapes consisting of ``'\'`` and an ASCII letter in
  regular expressions now are errors.  The re.LOCALE flag now can be used
  only with bytes patterns.

- bpo-27186: Add os.PathLike support to DirEntry (part of PEP 519). Initial
  patch by Jelle Zijlstra.

- bpo-20900: distutils register command now decodes HTTP responses
  correctly.  Initial patch by ingrid.

- bpo-27186: Add os.PathLike support to pathlib, removing its provisional
  status (part of PEP 519). Initial patch by Dusty Phillips.

- bpo-27186: Add support for os.PathLike objects to os.fsencode() and
  os.fsdecode() (part of PEP 519).

- bpo-27186: Introduce os.PathLike and os.fspath() (part of PEP 519).

- A new version of typing.py provides several new classes and features:
  @overload outside stubs, Reversible, DefaultDict, Text, ContextManager,
  Type[], NewType(), TYPE_CHECKING, and numerous bug fixes (note that some
  of the new features are not yet implemented in mypy or other static
  analyzers). Also classes for PEP 492 (Awaitable, AsyncIterable,
  AsyncIterator) have been added (in fact they made it into 3.5.1 but were
  never mentioned).

- bpo-25738: Stop http.server.BaseHTTPRequestHandler.send_error() from
  sending a message body for 205 Reset Content.  Also, don't send Content
  header fields in responses that don't have a body.  Patch by Susumu
  Koshiba.

- bpo-21313: Fix the "platform" module to tolerate when sys.version contains
  truncated build information.

Security
--------

- bpo-26839: On Linux, :func:`os.urandom` now calls ``getrandom()`` with
  ``GRND_NONBLOCK`` to fall back on reading ``/dev/urandom`` if the urandom
  entropy pool is not initialized yet. Patch written by Colm Buckley.

Library
-------

- bpo-23883: Added missing APIs to __all__ to match the documented APIs for
  the following modules: cgi, mailbox, mimetypes, plistlib and smtpd.
  Patches by Jacek Kołodziej.

- bpo-27164: In the zlib module, allow decompressing raw Deflate streams
  with a predefined zdict.  Based on patch by Xiang Zhang.

- bpo-24291: Fix wsgiref.simple_server.WSGIRequestHandler to completely
  write data to the client.  Previously it could do partial writes and
  truncate data.  Also, wsgiref.handler.ServerHandler can now handle stdout
  doing partial writes, but this is deprecated.

- bpo-21272: Use _sysconfigdata.py to initialize distutils.sysconfig.

- bpo-19611: :mod:`inspect` now reports the implicit ``.0`` parameters
  generated by the compiler for comprehension and generator expression
  scopes as if they were positional-only parameters called ``implicit0``.
  Patch by Jelle Zijlstra.

- bpo-26809: Add ``__all__`` to :mod:`string`.  Patch by Emanuel Barry.

- bpo-26373: subprocess.Popen.communicate now correctly ignores
  BrokenPipeError when the child process dies before .communicate() is
  called in more/all circumstances.

- signal, socket, and ssl module IntEnum constant name lookups now return a
  consistent name for values having multiple names.  Ex: signal.Signals(6)
  now refers to itself as signal.SIGALRM rather than flipping between that
  and signal.SIGIOT based on the interpreter's hash randomization seed.

- bpo-27167: Clarify the subprocess.CalledProcessError error message text
  when the child process died due to a signal.

- bpo-25931: Don't define socketserver.Forking* names on platforms such as
  Windows that do not support os.fork().

- bpo-21776: distutils.upload now correctly handles HTTPError. Initial patch
  by Claudiu Popa.

- bpo-26526: Replace custom parse tree validation in the parser module with
  a simple DFA validator.

- bpo-27114: Fix SSLContext._load_windows_store_certs fails with
  PermissionError

- bpo-18383: Avoid creating duplicate filters when using filterwarnings and
  simplefilter. Based on patch by Alex Shkop.

- bpo-23026: winreg.QueryValueEx() now return an integer for REG_QWORD type.

- bpo-26741: subprocess.Popen destructor now emits a ResourceWarning warning
  if the child process is still running.

- bpo-27056: Optimize pickle.load() and pickle.loads(), up to 10% faster to
  deserialize a lot of small objects.

- bpo-21271: New keyword only parameters in reset_mock call.

IDLE
----

- bpo-5124: Paste with text selected now replaces the selection on X11. This
  matches how paste works on Windows, Mac, most modern Linux apps, and ttk
  widgets. Original patch by Serhiy Storchaka.

- bpo-24750: Switch all scrollbars in IDLE to ttk versions. Where needed,
  minimal tests are added to cover changes.

- bpo-24759: IDLE requires tk 8.5 and availability ttk widgets. Delete now
  unneeded tk version tests and code for older versions. Add test for IDLE
  syntax colorizoer.

- bpo-27239: idlelib.macosx.isXyzTk functions initialize as needed.

- bpo-27262: move Aqua unbinding code, which enable context menus, to
  maxosx.

- bpo-24759: Make clear in idlelib.idle_test.__init__ that the directory is
  a private implementation of test.test_idle and tool for maintainers.

- bpo-27196: Stop 'ThemeChanged' warnings when running IDLE tests. These
  persisted after other warnings were suppressed in #20567. Apply Serhiy
  Storchaka's update_idletasks solution to four test files. Record this
  additional advice in idle_test/README.txt

- bpo-20567: Revise idle_test/README.txt with advice about avoiding tk
  warning messages from tests.  Apply advice to several IDLE tests.

- bpo-24225: Update idlelib/README.txt with new file names and event
  handlers.

- bpo-27156: Remove obsolete code not used by IDLE.

- bpo-27117: Make colorizer htest and turtledemo work with dark themes. Move
  code for configuring text widget colors to a new function.

- bpo-24225: Rename many `idlelib/*.py` and `idle_test/test_*.py` files.
  Edit files to replace old names with new names when the old name referred
  to the module rather than the class it contained. See the issue and IDLE
  section in What's New in 3.6 for more.

- bpo-26673: When tk reports font size as 0, change to size 10. Such fonts
  on Linux prevented the configuration dialog from opening.

- bpo-21939: Add test for IDLE's percolator. Original patch by Saimadhav
  Heblikar.

- bpo-21676: Add test for IDLE's replace dialog. Original patch by Saimadhav
  Heblikar.

- bpo-18410: Add test for IDLE's search dialog. Original patch by Westley
  Martínez.

- bpo-21703: Add test for undo delegator.  Patch mostly by Saimadhav
  Heblikar .

- bpo-27044: Add ConfigDialog.remove_var_callbacks to stop memory leaks.

- bpo-23977: Add more asserts to test_delegator.

Documentation
-------------

- bpo-16484: Change the default PYTHONDOCS URL to "https:", and fix the
  resulting links to use lowercase.  Patch by Sean Rodman, test by Kaushik
  Nadikuditi.

- bpo-24136: Document the new PEP 448 unpacking syntax of 3.5.

- bpo-22558: Add remaining doc links to source code for Python-coded
  modules. Patch by Yoni Lavi.

Tests
-----

- bpo-25285: regrtest now uses subprocesses when the -j1 command line option
  is used: each test file runs in a fresh child process. Before, the -j1
  option was ignored.

- bpo-25285: Tools/buildbot/test.bat script now uses -j1 by default to run
  each test file in fresh child process.

Windows
-------

- bpo-27064: The py.exe launcher now defaults to Python 3. The Windows
  launcher ``py.exe`` no longer prefers an installed Python 2 version over
  Python 3 by default when used interactively.

Build
-----

- bpo-27229: Fix the cross-compiling pgen rule for in-tree builds.  Patch by
  Xavier de Gaye.

- bpo-26930: Update OS X 10.5+ 32-bit-only installer to build and link with
  OpenSSL 1.0.2h.

Windows
-------

- bpo-17500: Remove unused and outdated icons. (See also:
  https://github.com/python/pythondotorg/issues/945)

C API
-----

- bpo-27186: Add the PyOS_FSPath() function (part of PEP 519).

- bpo-26282: PyArg_ParseTupleAndKeywords() now supports positional-only
  parameters.

Tools/Demos
-----------

- bpo-26282: Argument Clinic now supports positional-only and keyword
  parameters in the same function.


What's New in Python 3.6.0 alpha 1?
===================================

*Release date: 2016-05-16*

Core and Builtins
-----------------

- bpo-20041: Fixed TypeError when frame.f_trace is set to None. Patch by
  Xavier de Gaye.

- bpo-26168: Fixed possible refleaks in failing Py_BuildValue() with the "N"
  format unit.

- bpo-26991: Fix possible refleak when creating a function with annotations.

- bpo-27039: Fixed bytearray.remove() for values greater than 127.  Based on
  patch by Joe Jevnik.

- bpo-23640: int.from_bytes() no longer bypasses constructors for
  subclasses.

- bpo-27005: Optimized the float.fromhex() class method for exact float. It
  is now 2 times faster.

- bpo-18531: Single var-keyword argument of dict subtype was passed
  unscathed to the C-defined function.  Now it is converted to exact dict.

- bpo-26811: gc.get_objects() no longer contains a broken tuple with NULL
  pointer.

- bpo-20120: Use RawConfigParser for .pypirc parsing, removing support for
  interpolation unintentionally added with move to Python 3. Behavior no
  longer does any interpolation in .pypirc files, matching behavior in
  Python 2.7 and Setuptools 19.0.

- bpo-26249: Memory functions of the :c:func:`PyMem_Malloc` domain
  (:c:data:`PYMEM_DOMAIN_MEM`) now use the :ref:`pymalloc allocator
  <pymalloc>` rather than system :c:func:`malloc`. Applications calling
  :c:func:`PyMem_Malloc` without holding the GIL can now crash: use
  ``PYTHONMALLOC=debug`` environment variable to validate the usage of
  memory allocators in your application.

- bpo-26802: Optimize function calls only using unpacking like
  ``func(*tuple)`` (no other positional argument, no keyword): avoid copying
  the tuple. Patch written by Joe Jevnik.

- bpo-26659: Make the builtin slice type support cycle collection.

- bpo-26718: super.__init__ no longer leaks memory if called multiple times.
  NOTE: A direct call of super.__init__ is not endorsed!

- bpo-27138: Fix the doc comment for FileFinder.find_spec().

- bpo-27147: Mention PEP 420 in the importlib docs.

- bpo-25339: PYTHONIOENCODING now has priority over locale in setting the
  error handler for stdin and stdout.

- bpo-26494: Fixed crash on iterating exhausting iterators. Affected classes
  are generic sequence iterators, iterators of str, bytes, bytearray, list,
  tuple, set, frozenset, dict, OrderedDict, corresponding views and
  os.scandir() iterator.

- bpo-26574: Optimize ``bytes.replace(b'', b'.')`` and
  ``bytearray.replace(b'', b'.')``. Patch written by Josh Snider.

- bpo-26581: If coding cookie is specified multiple times on a line in
  Python source code file, only the first one is taken to account.

- bpo-19711: Add tests for reloading namespace packages.

- bpo-21099: Switch applicable importlib tests to use PEP 451 API.

- bpo-26563: Debug hooks on Python memory allocators now raise a fatal error
  if functions of the :c:func:`PyMem_Malloc` family are called without
  holding the GIL.

- bpo-26564: On error, the debug hooks on Python memory allocators now use
  the :mod:`tracemalloc` module to get the traceback where a memory block
  was allocated.

- bpo-26558: The debug hooks on Python memory allocator
  :c:func:`PyObject_Malloc` now detect when functions are called without
  holding the GIL.

- bpo-26516: Add :envvar:`PYTHONMALLOC` environment variable to set the
  Python memory allocators and/or install debug hooks.

- bpo-26516: The :c:func:`PyMem_SetupDebugHooks` function can now also be
  used on Python compiled in release mode.

- bpo-26516: The :envvar:`PYTHONMALLOCSTATS` environment variable can now
  also be used on Python compiled in release mode. It now has no effect if
  set to an empty string.

- bpo-26516: In debug mode, debug hooks are now also installed on Python
  memory allocators when Python is configured without pymalloc.

- bpo-26464: Fix str.translate() when string is ASCII and first replacements
  removes character, but next replacement uses a non-ASCII character or a
  string longer than 1 character. Regression introduced in Python 3.5.0.

- bpo-22836: Ensure exception reports from PyErr_Display() and
  PyErr_WriteUnraisable() are sensible even when formatting them produces
  secondary errors.  This affects the reports produced by
  sys.__excepthook__() and when __del__() raises an exception.

- bpo-26302: Correct behavior to reject comma as a legal character for
  cookie names.

- bpo-26136: Upgrade the warning when a generator raises StopIteration from
  PendingDeprecationWarning to DeprecationWarning.  Patch by Anish Shah.

- bpo-26204: The compiler now ignores all constant statements: bytes, str,
  int, float, complex, name constants (None, False, True), Ellipsis and
  ast.Constant; not only str and int. For example, ``1.0`` is now ignored in
  ``def f(): 1.0``.

- bpo-4806: Avoid masking the original TypeError exception when using star
  (``*``) unpacking in function calls.  Based on patch by Hagen Fürstenau
  and Daniel Urban.

- bpo-26146: Add a new kind of AST node: ``ast.Constant``. It can be used by
  external AST optimizers, but the compiler does not emit directly such
  node.

- bpo-23601: Sped-up allocation of dict key objects by using Python's small
  object allocator.  (Contributed by Julian Taylor.)

- bpo-18018: Import raises ImportError instead of SystemError if a relative
  import is attempted without a known parent package.

- bpo-25843: When compiling code, don't merge constants if they are equal
  but have a different types. For example, ``f1, f2 = lambda: 1, lambda:
  1.0`` is now correctly compiled to two different functions: ``f1()``
  returns ``1`` (``int``) and ``f2()`` returns ``1.0`` (``float``), even if
  ``1`` and ``1.0`` are equal.

- bpo-26107: The format of the ``co_lnotab`` attribute of code objects
  changes to support negative line number delta.

- bpo-26154: Add a new private _PyThreadState_UncheckedGet() function to get
  the current Python thread state, but don't issue a fatal error if it is
  NULL. This new function must be used instead of accessing directly the
  _PyThreadState_Current variable.  The variable is no more exposed since
  Python 3.5.1 to hide the exact implementation of atomic C types, to avoid
  compiler issues.

- bpo-25791: If __package__ != __spec__.parent or if neither __package__ or
  __spec__ are defined then ImportWarning is raised.

- bpo-22995: [UPDATE] Comment out the one of the pickleability tests in
  _PyObject_GetState() due to regressions observed in Cython-based projects.

- bpo-25961: Disallowed null characters in the type name.

- bpo-25973: Fix segfault when an invalid nonlocal statement binds a name
  starting with two underscores.

- bpo-22995: Instances of extension types with a state that aren't
  subclasses of list or dict and haven't implemented any pickle-related
  methods (__reduce__, __reduce_ex__, __getnewargs__, __getnewargs_ex__, or
  __getstate__), can no longer be pickled.  Including memoryview.

- bpo-20440: Massive replacing unsafe attribute setting code with special
  macro Py_SETREF.

- bpo-25766: Special method __bytes__() now works in str subclasses.

- bpo-25421: __sizeof__ methods of builtin types now use dynamic basic size.
  This allows sys.getsize() to work correctly with their subclasses with
  __slots__ defined.

- bpo-25709: Fixed problem with in-place string concatenation and utf-8
  cache.

- bpo-5319: New Py_FinalizeEx() API allowing Python to set an exit status of
  120 on failure to flush buffered streams.

- bpo-25485: telnetlib.Telnet is now a context manager.

- bpo-24097: Fixed crash in object.__reduce__() if slot name is freed inside
  __getattr__.

- bpo-24731: Fixed crash on converting objects with special methods
  __bytes__, __trunc__, and __float__ returning instances of subclasses of
  bytes, int, and float to subclasses of bytes, int, and float
  correspondingly.

- bpo-25630: Fix a possible segfault during argument parsing in functions
  that accept filesystem paths.

- bpo-23564: Fixed a partially broken sanity check in the _posixsubprocess
  internals regarding how fds_to_pass were passed to the child.  The bug had
  no actual impact as subprocess.py already avoided it.

- bpo-25388: Fixed tokenizer crash when processing undecodable source code
  with a null byte.

- bpo-25462: The hash of the key now is calculated only once in most
  operations in C implementation of OrderedDict.

- bpo-22995: Default implementation of __reduce__ and __reduce_ex__ now
  rejects builtin types with not defined __new__.

- bpo-24802: Avoid buffer overreads when int(), float(), compile(), exec()
  and eval() are passed bytes-like objects.  These objects are not
  necessarily terminated by a null byte, but the functions assumed they
  were.

- bpo-25555: Fix parser and AST: fill lineno and col_offset of "arg" node
  when compiling AST from Python objects.

- bpo-24726: Fixed a crash and leaking NULL in repr() of OrderedDict that
  was mutated by direct calls of dict methods.

- bpo-25449: Iterating OrderedDict with keys with unstable hash now raises
  KeyError in C implementations as well as in Python implementation.

- bpo-25395: Fixed crash when highly nested OrderedDict structures were
  garbage collected.

- bpo-25401: Optimize bytes.fromhex() and bytearray.fromhex(): they are now
  between 2x and 3.5x faster.

- bpo-25399: Optimize bytearray % args using the new private _PyBytesWriter
  API. Formatting is now between 2.5 and 5 times faster.

- bpo-25274: sys.setrecursionlimit() now raises a RecursionError if the new
  recursion limit is too low depending at the current recursion depth.
  Modify also the "lower-water mark" formula to make it monotonic. This mark
  is used to decide when the overflowed flag of the thread state is reset.

- bpo-24402: Fix input() to prompt to the redirected stdout when
  sys.stdout.fileno() fails.

- bpo-25349: Optimize bytes % args using the new private _PyBytesWriter API.
  Formatting is now up to 2 times faster.

- bpo-24806: Prevent builtin types that are not allowed to be subclassed
  from being subclassed through multiple inheritance.

- bpo-25301: The UTF-8 decoder is now up to 15 times as fast for error
  handlers: ``ignore``, ``replace`` and ``surrogateescape``.

- bpo-24848: Fixed a number of bugs in UTF-7 decoding of misformed data.

- bpo-25267: The UTF-8 encoder is now up to 75 times as fast for error
  handlers: ``ignore``, ``replace``, ``surrogateescape``, ``surrogatepass``.
  Patch co- written with Serhiy Storchaka.

- bpo-25280: Import trace messages emitted in verbose (-v) mode are no
  longer formatted twice.

- bpo-25227: Optimize ASCII and latin1 encoders with the ``surrogateescape``
  error handler: the encoders are now up to 3 times as fast. Initial patch
  written by Serhiy Storchaka.

- bpo-25003: On Solaris 11.3 or newer, os.urandom() now uses the getrandom()
  function instead of the getentropy() function. The getentropy() function
  is blocking to generate very good quality entropy, os.urandom() doesn't
  need such high- quality entropy.

- bpo-9232: Modify Python's grammar to allow trailing commas in the argument
  list of a function declaration.  For example, "def f(\*, a = 3,): pass" is
  now legal. Patch from Mark Dickinson.

- bpo-24965: Implement PEP 498 "Literal String Interpolation". This allows
  you to embed expressions inside f-strings, which are converted to normal
  strings at run time. Given x=3, then f'value={x}' == 'value=3'. Patch by
  Eric V. Smith.

- bpo-26478: Fix semantic bugs when using binary operators with dictionary
  views and tuples.

- bpo-26171: Fix possible integer overflow and heap corruption in
  zipimporter.get_data().

- bpo-25660: Fix TAB key behaviour in REPL with readline.

- bpo-26288: Optimize PyLong_AsDouble.

- bpo-26289: Optimize floor and modulo division for single-digit longs.
  Microbenchmarks show 2-2.5x improvement.  Built-in 'divmod' function is
  now also ~10% faster. (See also: bpo-26315)

- bpo-25887: Raise a RuntimeError when a coroutine object is awaited more
  than once.

Library
-------

- bpo-27057: Fix os.set_inheritable() on Android, ioctl() is blocked by
  SELinux and fails with EACCESS. The function now falls back to fcntl().
  Patch written by Michał Bednarski.

- bpo-27014: Fix infinite recursion using typing.py.  Thanks to Kalle Tuure!

- bpo-27031: Removed dummy methods in Tkinter widget classes: tk_menuBar()
  and tk_bindForTraversal().

- bpo-14132: Fix urllib.request redirect handling when the target only has a
  query string.  Original fix by Ján Janech.

- bpo-17214: The "urllib.request" module now percent-encodes non-ASCII bytes
  found in redirect target URLs.  Some servers send Location header fields
  with non- ASCII bytes, but "http.client" requires the request target to be
  ASCII- encodable, otherwise a UnicodeEncodeError is raised.  Based on
  patch by Christian Heimes.

- bpo-27033: The default value of the decode_data parameter for
  smtpd.SMTPChannel and smtpd.SMTPServer constructors is changed to False.

- bpo-27034: Removed deprecated class asynchat.fifo.

- bpo-26870: Added readline.set_auto_history(), which can stop entries being
  automatically added to the history list.  Based on patch by Tyler
  Crompton.

- bpo-26039: zipfile.ZipFile.open() can now be used to write data into a ZIP
  file, as well as for extracting data.  Patch by Thomas Kluyver.

- bpo-26892: Honor debuglevel flag in urllib.request.HTTPHandler. Patch
  contributed by Chi Hsuan Yen.

- bpo-22274: In the subprocess module, allow stderr to be redirected to
  stdout even when stdout is not redirected.  Patch by Akira Li.

- bpo-26807: mock_open 'files' no longer error on readline at end of file.
  Patch from Yolanda Robla.

- bpo-25745: Fixed leaking a userptr in curses panel destructor.

- bpo-26977: Removed unnecessary, and ignored, call to sum of squares helper
  in statistics.pvariance.

- bpo-26002: Use bisect in statistics.median instead of a linear search.
  Patch by Upendra Kuma.

- bpo-25974: Make use of new Decimal.as_integer_ratio() method in statistics
  module. Patch by Stefan Krah.

- bpo-26996: Add secrets module as described in PEP 506.

- bpo-26881: The modulefinder module now supports extended opcode arguments.

- bpo-23815: Fixed crashes related to directly created instances of types in
  _tkinter and curses.panel modules.

- bpo-17765: weakref.ref() no longer silently ignores keyword arguments.
  Patch by Georg Brandl.

- bpo-26873: xmlrpc now raises ResponseError on unsupported type tags
  instead of silently return incorrect result.

- bpo-26915: The __contains__ methods in the collections ABCs now check for
  identity before checking equality.  This better matches the behavior of
  the concrete classes, allows sensible handling of NaNs, and makes it
  easier to reason about container invariants.

- bpo-26711: Fixed the comparison of plistlib.Data with other types.

- bpo-24114: Fix an uninitialized variable in `ctypes.util`.

  The bug only occurs on SunOS when the ctypes implementation searches for
  the `crle` program.  Patch by Xiang Zhang.  Tested on SunOS by Kees Bos.

- bpo-26864: In urllib.request, change the proxy bypass host checking
  against no_proxy to be case-insensitive, and to not match unrelated host
  names that happen to have a bypassed hostname as a suffix.  Patch by Xiang
  Zhang.

- bpo-24902: Print server URL on http.server startup.  Initial patch by
  Felix Kaiser.

- bpo-25788: fileinput.hook_encoded() now supports an "errors" argument for
  passing to open.  Original patch by Joseph Hackman.

- bpo-26634: recursive_repr() now sets __qualname__ of wrapper.  Patch by
  Xiang Zhang.

- bpo-26804: urllib.request will prefer lower_case proxy environment
  variables over UPPER_CASE or Mixed_Case ones. Patch contributed by Hans-
  Peter Jansen.

- bpo-26837: assertSequenceEqual() now correctly outputs non-stringified
  differing items (like bytes in the -b mode).  This affects
  assertListEqual() and assertTupleEqual().

- bpo-26041: Remove "will be removed in Python 3.7" from deprecation
  messages of platform.dist() and platform.linux_distribution(). Patch by
  Kumaripaba Miyurusara Athukorala.

- bpo-26822: itemgetter, attrgetter and methodcaller objects no longer
  silently ignore keyword arguments.

- bpo-26733: Disassembling a class now disassembles class and static
  methods. Patch by Xiang Zhang.

- bpo-26801: Fix error handling in :func:`shutil.get_terminal_size`, catch
  :exc:`AttributeError` instead of :exc:`NameError`. Patch written by
  Emanuel Barry.

- bpo-24838: tarfile's ustar and gnu formats now correctly calculate name
  and link field limits for multibyte character encodings like utf-8.

Security
--------

- bpo-26657: Fix directory traversal vulnerability with http.server on
  Windows.  This fixes a regression that was introduced in 3.3.4rc1 and
  3.4.0rc1.  Based on patch by Philipp Hagemeister.

Library
-------

- bpo-26717: Stop encoding Latin-1-ized WSGI paths with UTF-8.  Patch by
  Anthony Sottile.

- bpo-26782: Add STARTUPINFO to subprocess.__all__ on Windows.

- bpo-26404: Add context manager to socketserver.  Patch by Aviv Palivoda.

- bpo-26735: Fix :func:`os.urandom` on Solaris 11.3 and newer when reading
  more than 1,024 bytes: call ``getrandom()`` multiple times with a limit of
  1024 bytes per call.

- bpo-26585: Eliminate http.server._quote_html() and use
  html.escape(quote=False).  Patch by Xiang Zhang.

- bpo-26685: Raise OSError if closing a socket fails.

- bpo-16329: Add .webm to mimetypes.types_map.  Patch by Giampaolo Rodola'.

- bpo-13952: Add .csv to mimetypes.types_map.  Patch by Geoff Wilson.

- bpo-26587: the site module now allows .pth files to specify files to be
  added to sys.path (e.g. zip files).

- bpo-25609: Introduce contextlib.AbstractContextManager and
  typing.ContextManager.

- bpo-26709: Fixed Y2038 problem in loading binary PLists.

- bpo-23735: Handle terminal resizing with Readline 6.3+ by installing our
  own SIGWINCH handler.  Patch by Eric Price.

- bpo-25951: Change SSLSocket.sendall() to return None, as explicitly
  documented for plain socket objects.  Patch by Aviv Palivoda.

- bpo-26586: In http.server, respond with "413 Request header fields too
  large" if there are too many header fields to parse, rather than killing
  the connection and raising an unhandled exception.  Patch by Xiang Zhang.

- bpo-26676: Added missing XMLPullParser to ElementTree.__all__.

- bpo-22854: Change BufferedReader.writable() and BufferedWriter.readable()
  to always return False.

- bpo-26492: Exhausted iterator of array.array now conforms with the
  behavior of iterators of other mutable sequences: it lefts exhausted even
  if iterated array is extended.

- bpo-26641: doctest.DocFileTest and doctest.testfile() now support packages
  (module splitted into multiple directories) for the package parameter.

- bpo-25195: Fix a regression in mock.MagicMock. _Call is a subclass of
  tuple (changeset 3603bae63c13 only works for classes) so we need to
  implement __ne__ ourselves.  Patch by Andrew Plummer.

- bpo-26644: Raise ValueError rather than SystemError when a negative length
  is passed to SSLSocket.recv() or read().

- bpo-23804: Fix SSL recv(0) and read(0) methods to return zero bytes
  instead of up to 1024.

- bpo-26616: Fixed a bug in datetime.astimezone() method.

- bpo-26637: The :mod:`importlib` module now emits an :exc:`ImportError`
  rather than a :exc:`TypeError` if :func:`__import__` is tried during the
  Python shutdown process but :data:`sys.path` is already cleared (set to
  ``None``).

- bpo-21925: :func:`warnings.formatwarning` now catches exceptions when
  calling :func:`linecache.getline` and
  :func:`tracemalloc.get_object_traceback` to be able to log
  :exc:`ResourceWarning` emitted late during the Python shutdown process.

- bpo-23848: On Windows, faulthandler.enable() now also installs an
  exception handler to dump the traceback of all Python threads on any
  Windows exception, not only on UNIX signals (SIGSEGV, SIGFPE, SIGABRT).

- bpo-26530: Add C functions :c:func:`_PyTraceMalloc_Track` and
  :c:func:`_PyTraceMalloc_Untrack` to track memory blocks using the
  :mod:`tracemalloc` module. Add :c:func:`_PyTraceMalloc_GetTraceback` to
  get the traceback of an object.

- bpo-26588: The _tracemalloc now supports tracing memory allocations of
  multiple address spaces (domains).

- bpo-24266: Ctrl+C during Readline history search now cancels the search
  mode when compiled with Readline 7.

- bpo-26590: Implement a safe finalizer for the _socket.socket type. It now
  releases the GIL to close the socket.

- bpo-18787: spwd.getspnam() now raises a PermissionError if the user
  doesn't have privileges.

- bpo-26560: Avoid potential ValueError in BaseHandler.start_response.
  Initial patch by Peter Inglesby.

- bpo-26567: Add a new function :c:func:`PyErr_ResourceWarning` function to
  pass the destroyed object. Add a *source* attribute to
  :class:`warnings.WarningMessage`. Add warnings._showwarnmsg() which uses
  tracemalloc to get the traceback where source object was allocated.

Security
--------

- bpo-26313: ssl.py _load_windows_store_certs fails if windows cert store is
  empty. Patch by Baji.

Library
-------

- bpo-26569: Fix :func:`pyclbr.readmodule` and :func:`pyclbr.readmodule_ex`
  to support importing packages.

- bpo-26499: Account for remaining Content-Length in HTTPResponse.readline()
  and read1(). Based on patch by Silent Ghost. Also document that
  HTTPResponse now supports these methods.

- bpo-25320: Handle sockets in directories unittest discovery is scanning.
  Patch from Victor van den Elzen.

- bpo-16181: cookiejar.http2time() now returns None if year is higher than
  datetime.MAXYEAR.

- bpo-26513: Fixes platform module detection of Windows Server

- bpo-23718: Fixed parsing time in week 0 before Jan 1.  Original patch by
  Tamás Bence Gedai.

- bpo-26323: Add Mock.assert_called() and Mock.assert_called_once() methods
  to unittest.mock. Patch written by Amit Saha.

- bpo-20589: Invoking Path.owner() and Path.group() on Windows now raise
  NotImplementedError instead of ImportError.

- bpo-26177: Fixed the keys() method for Canvas and Scrollbar widgets.

- bpo-15068: Got rid of excessive buffering in fileinput. The bufsize
  parameter is now deprecated and ignored.

- bpo-19475: Added an optional argument timespec to the datetime isoformat()
  method to choose the precision of the time component.

- bpo-2202: Fix UnboundLocalError in
  AbstractDigestAuthHandler.get_algorithm_impls. Initial patch by Mathieu
  Dupuy.

- bpo-26167: Minimized overhead in copy.copy() and copy.deepcopy().
  Optimized copying and deepcopying bytearrays, NotImplemented, slices,
  short lists, tuples, dicts, sets.

- bpo-25718: Fixed pickling and copying the accumulate() iterator with total
  is None.

- bpo-26475: Fixed debugging output for regular expressions with the (?x)
  flag.

- bpo-26482: Allowed pickling recursive dequeues.

- bpo-26335: Make mmap.write() return the number of bytes written like other
  write methods.  Patch by Jakub Stasiak.

- bpo-26457: Fixed the subnets() methods in IP network classes for the case
  when resulting prefix length is equal to maximal prefix length. Based on
  patch by Xiang Zhang.

- bpo-26385: Remove the file if the internal open() call in
  NamedTemporaryFile() fails. Patch by Silent Ghost.

- bpo-26402: Fix XML-RPC client to retry when the server shuts down a
  persistent connection.  This was a regression related to the new
  http.client.RemoteDisconnected exception in 3.5.0a4.

- bpo-25913: Leading ``<~`` is optional now in base64.a85decode() with
  adobe=True.  Patch by Swati Jaiswal.

- bpo-26186: Remove an invalid type check in importlib.util.LazyLoader.

- bpo-26367: importlib.__import__() raises ImportError like
  builtins.__import__() when ``level`` is specified but without an
  accompanying package specified.

- bpo-26309: In the "socketserver" module, shut down the request (closing
  the connected socket) when verify_request() returns false.  Patch by Aviv
  Palivoda.

- bpo-23430: Change the socketserver module to only catch exceptions raised
  from a request handler that are derived from Exception (instead of
  BaseException). Therefore SystemExit and KeyboardInterrupt no longer
  trigger the handle_error() method, and will now to stop a single-threaded
  server.

Security
--------

- bpo-25939: On Windows open the cert store readonly in
  ssl.enum_certificates.

Library
-------

- bpo-25995: os.walk() no longer uses FDs proportional to the tree depth.

- bpo-25994: Added the close() method and the support of the context manager
  protocol for the os.scandir() iterator.

- bpo-23992: multiprocessing: make MapResult not fail-fast upon exception.

- bpo-26243: Support keyword arguments to zlib.compress().  Patch by Aviv
  Palivoda.

- bpo-26117: The os.scandir() iterator now closes file descriptor not only
  when the iteration is finished, but when it was failed with error.

- bpo-25949: __dict__ for an OrderedDict instance is now created only when
  needed.

- bpo-25911: Restored support of bytes paths in os.walk() on Windows.

- bpo-26045: Add UTF-8 suggestion to error message when posting a non-
  Latin-1 string with http.client.

- bpo-26039: Added zipfile.ZipInfo.from_file() and zipinfo.ZipInfo.is_dir().
  Patch by Thomas Kluyver.

- bpo-12923: Reset FancyURLopener's redirect counter even if there is an
  exception. Based on patches by Brian Brazil and Daniel Rocco.

- bpo-25945: Fixed a crash when unpickle the functools.partial object with
  wrong state. Fixed a leak in failed functools.partial constructor. "args"
  and "keywords" attributes of functools.partial have now always types tuple
  and dict correspondingly.

- bpo-26202: copy.deepcopy() now correctly copies range() objects with non-
  atomic attributes.

- bpo-23076: Path.glob() now raises a ValueError if it's called with an
  invalid pattern. Patch by Thomas Nyberg.

- bpo-19883: Fixed possible integer overflows in zipimport.

- bpo-26227: On Windows, getnameinfo(), gethostbyaddr() and
  gethostbyname_ex() functions of the socket module now decode the hostname
  from the ANSI code page rather than UTF-8.

- bpo-26099: The site module now writes an error into stderr if
  sitecustomize module can be imported but executing the module raise an
  ImportError. Same change for usercustomize.

- bpo-26147: xmlrpc now works with strings not encodable with used non-UTF-8
  encoding.

- bpo-25935: Garbage collector now breaks reference loops with OrderedDict.

- bpo-16620: Fixed AttributeError in msilib.Directory.glob().

- bpo-26013: Added compatibility with broken protocol 2 pickles created in
  old Python 3 versions (3.4.3 and lower).

- bpo-26129: Deprecated accepting non-integers in grp.getgrgid().

- bpo-25850: Use cross-compilation by default for 64-bit Windows.

- bpo-25822: Add docstrings to the fields of urllib.parse results. Patch
  contributed by Swati Jaiswal.

- bpo-22642: Convert trace module option parsing mechanism to argparse.
  Patch contributed by SilentGhost.

- bpo-24705: Fix sysconfig._parse_makefile not expanding ${} vars appearing
  before $() vars.

- bpo-26069: Remove the deprecated apis in the trace module.

- bpo-22138: Fix mock.patch behavior when patching descriptors. Restore
  original values after patching. Patch contributed by Sean McCully.

- bpo-25672: In the ssl module, enable the SSL_MODE_RELEASE_BUFFERS mode
  option if it is safe to do so.

- bpo-26012: Don't traverse into symlinks for ``**`` pattern in
  pathlib.Path.[r]glob().

- bpo-24120: Ignore PermissionError when traversing a tree with
  pathlib.Path.[r]glob(). Patch by Ulrich Petri.

- bpo-21815: Accept ] characters in the data portion of imap responses, in
  order to handle the flags with square brackets accepted and produced by
  servers such as gmail.

- bpo-25447: fileinput now uses sys.stdin as-is if it does not have a buffer
  attribute (restores backward compatibility).

- bpo-25971: Optimized creating Fractions from floats by 2 times and from
  Decimals by 3 times.

- bpo-25802: Document as deprecated the remaining implementations of
  importlib.abc.Loader.load_module().

- bpo-25928: Add Decimal.as_integer_ratio().

- bpo-25447: Copying the lru_cache() wrapper object now always works,
  independently from the type of the wrapped object (by returning the
  original object unchanged).

- bpo-25768: Have the functions in compileall return booleans instead of
  ints and add proper documentation and tests for the return values.

- bpo-24103: Fixed possible use after free in ElementTree.XMLPullParser.

- bpo-25860: os.fwalk() no longer skips remaining directories when error
  occurs. Original patch by Samson Lee.

- bpo-25914: Fixed and simplified OrderedDict.__sizeof__.

- bpo-25869: Optimized deepcopying ElementTree; it is now 20 times faster.

- bpo-25873: Optimized iterating ElementTree.  Iterating elements
  Element.iter() is now 40% faster, iterating text Element.itertext() is now
  up to 2.5 times faster.

- bpo-25902: Fixed various refcount issues in ElementTree iteration.

- bpo-22227: The TarFile iterator is reimplemented using generator. This
  implementation is simpler that using class.

- bpo-25638: Optimized ElementTree.iterparse(); it is now 2x faster.
  Optimized ElementTree parsing; it is now 10% faster.

- bpo-25761: Improved detecting errors in broken pickle data.

- bpo-25717: Restore the previous behaviour of tolerating most fstat()
  errors when opening files.  This was a regression in 3.5a1, and stopped
  anonymous temporary files from working in special cases.

- bpo-24903: Fix regression in number of arguments compileall accepts when
  '-d' is specified.  The check on the number of arguments has been dropped
  completely as it never worked correctly anyway.

- bpo-25764: In the subprocess module, preserve any exception caused by
  fork() failure when preexec_fn is used.

- bpo-25771: Tweak the exception message for importlib.util.resolve_name()
  when 'package' isn't specified but necessary.

- bpo-6478: _strptime's regexp cache now is reset after changing timezone
  with time.tzset().

- bpo-14285: When executing a package with the "python -m package" option,
  and package initialization fails, a proper traceback is now reported.  The
  "runpy" module now lets exceptions from package initialization pass back
  to the caller, rather than raising ImportError.

- bpo-19771: Also in runpy and the "-m" option, omit the irrelevant message
  ". . . is a package and cannot be directly executed" if the package could
  not even be initialized (e.g. due to a bad ``*.pyc`` file).

- bpo-25177: Fixed problem with the mean of very small and very large
  numbers. As a side effect, statistics.mean and statistics.variance should
  be significantly faster.

- bpo-25718: Fixed copying object with state with boolean value is false.

- bpo-10131: Fixed deep copying of minidom documents.  Based on patch by
  Marian Ganisin.

- bpo-7990: dir() on ElementTree.Element now lists properties: "tag",
  "text", "tail" and "attrib".  Original patch by Santoso Wijaya.

- bpo-25725: Fixed a reference leak in pickle.loads() when unpickling
  invalid data including tuple instructions.

- bpo-25663: In the Readline completer, avoid listing duplicate global
  names, and search the global namespace before searching builtins.

- bpo-25688: Fixed file leak in ElementTree.iterparse() raising an error.

- bpo-23914: Fixed SystemError raised by unpickler on broken pickle data.

- bpo-25691: Fixed crash on deleting ElementTree.Element attributes.

- bpo-25624: ZipFile now always writes a ZIP_STORED header for directory
  entries.  Patch by Dingyuan Wang.

- bpo-25626: Change three zlib functions to accept sizes that fit in
  Py_ssize_t, but internally cap those sizes to UINT_MAX.  This resolves a
  regression in 3.5 where GzipFile.read() failed to read chunks larger than
  2 or 4 GiB.  The change affects the zlib.Decompress.decompress()
  max_length parameter, the zlib.decompress() bufsize parameter, and the
  zlib.Decompress.flush() length parameter.

- bpo-25583: Avoid incorrect errors raised by os.makedirs(exist_ok=True)
  when the OS gives priority to errors such as EACCES over EEXIST.

- bpo-25593: Change semantics of EventLoop.stop() in asyncio.

- bpo-6973: When we know a subprocess.Popen process has died, do not allow
  the send_signal(), terminate(), or kill() methods to do anything as they
  could potentially signal a different process.

- bpo-23883: Added missing APIs to __all__ to match the documented APIs for
  the following modules: calendar, csv, enum, fileinput, ftplib, logging,
  optparse, tarfile, threading and wave.  Also added a
  test.support.check__all__() helper. Patches by Jacek Kołodziej, Mauro S.
  M. Rodrigues and Joel Taddei.

- bpo-25590: In the Readline completer, only call getattr() once per
  attribute.  Also complete names of attributes such as properties and slots
  which are listed by dir() but not yet created on an instance.

- bpo-25498: Fix a crash when garbage-collecting ctypes objects created by
  wrapping a memoryview.  This was a regression made in 3.5a1.  Based on
  patch by Eryksun.

- bpo-25584: Added "escape" to the __all__ list in the glob module.

- bpo-25584: Fixed recursive glob() with patterns starting with ``**``.

- bpo-25446: Fix regression in smtplib's AUTH LOGIN support.

- bpo-18010: Fix the pydoc web server's module search function to handle
  exceptions from importing packages.

- bpo-25554: Got rid of circular references in regular expression parsing.

- bpo-18973: Command-line interface of the calendar module now uses argparse
  instead of optparse.

- bpo-25510: fileinput.FileInput.readline() now returns b'' instead of '' at
  the end if the FileInput was opened with binary mode. Patch by Ryosuke
  Ito.

- bpo-25503: Fixed inspect.getdoc() for inherited docstrings of properties.
  Original patch by John Mark Vandenberg.

- bpo-25515: Always use os.urandom as a source of randomness in uuid.uuid4.

- bpo-21827: Fixed textwrap.dedent() for the case when largest common
  whitespace is a substring of smallest leading whitespace. Based on patch
  by Robert Li.

- bpo-25447: The lru_cache() wrapper objects now can be copied and pickled
  (by returning the original object unchanged).

- bpo-25390: typing: Don't crash on Union[str, Pattern].

- bpo-25441: asyncio: Raise error from drain() when socket is closed.

- bpo-25410: Cleaned up and fixed minor bugs in C implementation of
  OrderedDict.

- bpo-25411: Improved Unicode support in SMTPHandler through better use of
  the email package. Thanks to user simon04 for the patch.

- Move the imp module from a PendingDeprecationWarning to
  DeprecationWarning.

- bpo-25407: Remove mentions of the formatter module being removed in Python
  3.6.

- bpo-25406: Fixed a bug in C implementation of OrderedDict.move_to_end()
  that caused segmentation fault or hang in iterating after moving several
  items to the start of ordered dict.

- bpo-25382: pickletools.dis() now outputs implicit memo index for the
  MEMOIZE opcode.

- bpo-25357: Add an optional newline paramer to binascii.b2a_base64().
  base64.b64encode() uses it to avoid a memory copy.

- bpo-24164: Objects that need calling ``__new__`` with keyword arguments,
  can now be pickled using pickle protocols older than protocol version 4.

- bpo-25364: zipfile now works in threads disabled builds.

- bpo-25328: smtpd's SMTPChannel now correctly raises a ValueError if both
  decode_data and enable_SMTPUTF8 are set to true.

- bpo-16099: RobotFileParser now supports Crawl-delay and Request-rate
  extensions.  Patch by Nikolay Bogoychev.

- bpo-25316: distutils raises OSError instead of DistutilsPlatformError when
  MSVC is not installed.

- bpo-25380: Fixed protocol for the STACK_GLOBAL opcode in
  pickletools.opcodes.

- bpo-23972: Updates asyncio datagram create method allowing reuseport and
  reuseaddr socket options to be set prior to binding the socket. Mirroring
  the existing asyncio create_server method the reuseaddr option for
  datagram sockets defaults to True if the O/S is 'posix' (except if the
  platform is Cygwin). Patch by Chris Laws.

- bpo-25304: Add asyncio.run_coroutine_threadsafe().  This lets you submit a
  coroutine to a loop from another thread, returning a
  concurrent.futures.Future.  By Vincent Michel.

- bpo-25232: Fix CGIRequestHandler to split the query from the URL at the
  first question mark (?) rather than the last. Patch from Xiang Zhang.

- bpo-24657: Prevent CGIRequestHandler from collapsing slashes in the query
  part of the URL as if it were a path. Patch from Xiang Zhang.

- bpo-25287: Don't add crypt.METHOD_CRYPT to crypt.methods if it's not
  supported. Check if it is supported, it may not be supported on OpenBSD
  for example.

- bpo-23600: Default implementation of tzinfo.fromutc() was returning wrong
  results in some cases.

- bpo-25203: Failed readline.set_completer_delims() no longer left the
  module in inconsistent state.

- bpo-25011: rlcompleter now omits private and special attribute names
  unless the prefix starts with underscores.

- bpo-25209: rlcompleter now can add a space or a colon after completed
  keyword.

- bpo-22241: timezone.utc name is now plain 'UTC', not 'UTC-00:00'.

- bpo-23517: fromtimestamp() and utcfromtimestamp() methods of
  datetime.datetime now round microseconds to nearest with ties going to
  nearest even integer (ROUND_HALF_EVEN), as round(float), instead of
  rounding towards -Infinity (ROUND_FLOOR).

- bpo-23552: Timeit now warns when there is substantial (4x) variance
  between best and worst times. Patch from Serhiy Storchaka.

- bpo-24633: site-packages/README -> README.txt.

- bpo-24879: help() and pydoc can now list named tuple fields in the order
  they were defined rather than alphabetically.  The ordering is determined
  by the _fields attribute if present.

- bpo-24874: Improve speed of itertools.cycle() and make its pickle more
  compact.

- Fix crash in itertools.cycle.__setstate__() when the first argument wasn't
  a list.

- bpo-20059: urllib.parse raises ValueError on all invalid ports. Patch by
  Martin Panter.

- bpo-24360: Improve __repr__ of argparse.Namespace() for invalid
  identifiers.  Patch by Matthias Bussonnier.

- bpo-23426: run_setup was broken in distutils. Patch from Alexander
  Belopolsky.

- bpo-13938: 2to3 converts StringTypes to a tuple. Patch from Mark Hammond.

- bpo-2091: open() accepted a 'U' mode string containing '+', but 'U' can
  only be used with 'r'. Patch from Jeff Balogh and John O'Connor.

- bpo-8585: improved tests for zipimporter2. Patch from Mark Lawrence.

- bpo-18622: unittest.mock.mock_open().reset_mock would recurse infinitely.
  Patch from Nicola Palumbo and Laurent De Buyst.

- bpo-24426: Fast searching optimization in regular expressions now works
  for patterns that starts with capturing groups.  Fast searching
  optimization now can't be disabled at compile time.

- bpo-23661: unittest.mock side_effects can now be exceptions again. This
  was a regression vs Python 3.4. Patch from Ignacio Rossi

- bpo-13248: Remove deprecated inspect.getmoduleinfo function.

- bpo-25578: Fix (another) memory leak in SSLSocket.getpeercer().

- bpo-25530: Disable the vulnerable SSLv3 protocol by default when creating
  ssl.SSLContext.

- bpo-25569: Fix memory leak in SSLSocket.getpeercert().

- bpo-25471: Sockets returned from accept() shouldn't appear to be
  nonblocking.

- bpo-25319: When threading.Event is reinitialized, the underlying condition
  should use a regular lock rather than a recursive lock.

- Skip getaddrinfo if host is already resolved. Patch by A. Jesse Jiryu
  Davis.

- bpo-26050: Add asyncio.StreamReader.readuntil() method. Patch by Марк
  Коренберг.

- bpo-25924: Avoid unnecessary serialization of getaddrinfo(3) calls on OS X
  versions 10.5 or higher.  Original patch by A. Jesse Jiryu Davis.

- bpo-26406: Avoid unnecessary serialization of getaddrinfo(3) calls on
  current versions of OpenBSD and NetBSD.  Patch by A. Jesse Jiryu Davis.

- bpo-26848: Fix asyncio/subprocess.communicate() to handle empty input.
  Patch by Jack O'Connor.

- bpo-27040: Add loop.get_exception_handler method

- bpo-27041: asyncio: Add loop.create_future method

IDLE
----

- bpo-20640: Add tests for idlelib.configHelpSourceEdit. Patch by Saimadhav
  Heblikar.

- In the 'IDLE-console differences' section of the IDLE doc, clarify how
  running with IDLE affects sys.modules and the standard streams.

- bpo-25507: fix incorrect change in IOBinding that prevented printing.
  Augment IOBinding htest to include all major IOBinding functions.

- bpo-25905: Revert unwanted conversion of ' to ’ RIGHT SINGLE QUOTATION
  MARK in README.txt and open this and NEWS.txt with 'ascii'. Re-encode
  CREDITS.txt to utf-8 and open it with 'utf-8'.

- bpo-15348: Stop the debugger engine (normally in a user process) before
  closing the debugger window (running in the IDLE process). This prevents
  the RuntimeErrors that were being caught and ignored.

- bpo-24455: Prevent IDLE from hanging when a) closing the shell while the
  debugger is active (15347); b) closing the debugger with the [X] button
  (15348); and c) activating the debugger when already active (24455). The
  patch by Mark Roseman does this by making two changes. 1. Suspend and
  resume the gui.interaction method with the tcl vwait mechanism intended
  for this purpose (instead of root.mainloop & .quit). 2. In gui.run, allow
  any existing interaction to terminate first.

- Change 'The program' to 'Your program' in an IDLE 'kill program?' message
  to make it clearer that the program referred to is the currently running
  user program, not IDLE itself.

- bpo-24750: Improve the appearance of the IDLE editor window status bar.
  Patch by Mark Roseman.

- bpo-25313: Change the handling of new built-in text color themes to better
  address the compatibility problem introduced by the addition of IDLE Dark.
  Consistently use the revised idleConf.CurrentTheme everywhere in idlelib.

- bpo-24782: Extension configuration is now a tab in the IDLE Preferences
  dialog rather than a separate dialog.  The former tabs are now a sorted
  list.  Patch by Mark Roseman.

- bpo-22726: Re-activate the config dialog help button with some content
  about the other buttons and the new IDLE Dark theme.

- bpo-24820: IDLE now has an 'IDLE Dark' built-in text color theme. It is
  more or less IDLE Classic inverted, with a cobalt blue background.
  Strings, comments, keywords, ... are still green, red, orange, ... . To
  use it with IDLEs released before November 2015, hit the 'Save as New
  Custom Theme' button and enter a new name, such as 'Custom Dark'.  The
  custom theme will work with any IDLE release, and can be modified.

- bpo-25224: README.txt is now an idlelib index for IDLE developers and
  curious users. The previous user content is now in the IDLE doc chapter.
  'IDLE' now means 'Integrated Development and Learning Environment'.

- bpo-24820: Users can now set breakpoint colors in Settings -> Custom
  Highlighting. Original patch by Mark Roseman.

- bpo-24972: Inactive selection background now matches active selection
  background, as configured by users, on all systems.  Found items are now
  always highlighted on Windows.  Initial patch by Mark Roseman.

- bpo-24570: Idle: make calltip and completion boxes appear on Macs affected
  by a tk regression.  Initial patch by Mark Roseman.

- bpo-24988: Idle ScrolledList context menus (used in debugger) now work on
  Mac Aqua. Patch by Mark Roseman.

- bpo-24801: Make right-click for context menu work on Mac Aqua. Patch by
  Mark Roseman.

- bpo-25173: Associate tkinter messageboxes with a specific widget. For Mac
  OSX, make them a 'sheet'.  Patch by Mark Roseman.

- bpo-25198: Enhance the initial html viewer now used for Idle Help. *
  Properly indent fixed-pitch text (patch by Mark Roseman). * Give code
  snippet a very Sphinx- like light blueish-gray background. * Re-use
  initial width and height set by users for shell and editor. * When the
  Table of Contents (TOC) menu is used, put the section header at the top of
  the screen.

- bpo-25225: Condense and rewrite Idle doc section on text colors.

- bpo-21995: Explain some differences between IDLE and console Python.

- bpo-22820: Explain need for *print* when running file from Idle editor.

- bpo-25224: Doc: augment Idle feature list and no-subprocess section.

- bpo-25219: Update doc for Idle command line options. Some were missing and
  notes were not correct.

- bpo-24861: Most of idlelib is private and subject to change. Use
  idleib.idle.* to start Idle. See idlelib.__init__.__doc__.

- bpo-25199: Idle: add synchronization comments for future maintainers.

- bpo-16893: Replace help.txt with help.html for Idle doc display. The new
  idlelib/help.html is rstripped Doc/build/html/library/idle.html. It looks
  better than help.txt and will better document Idle as released. The
  tkinter html viewer that works for this file was written by Rose Roseman.
  The now unused EditorWindow.HelpDialog class and helt.txt file are
  deprecated.

- bpo-24199: Deprecate unused idlelib.idlever with possible removal in 3.6.

- bpo-24790: Remove extraneous code (which also create 2 & 3 conflicts).

Documentation
-------------

- bpo-26736: Used HTTPS for external links in the documentation if possible.

- bpo-6953: Rework the Readline module documentation to group related
  functions together, and add more details such as what underlying Readline
  functions and variables are accessed.

- bpo-23606: Adds note to ctypes documentation regarding cdll.msvcrt.

- bpo-24952: Clarify the default size argument of stack_size() in the
  "threading" and "_thread" modules. Patch from Mattip.

- bpo-26014: Update 3.x packaging documentation: * "See also" links to the
  new docs are now provided in the legacy pages * links to setuptools
  documentation have been updated

Tests
-----

- bpo-21916: Added tests for the turtle module.  Patch by ingrid, Gregory
  Loyse and Jelle Zijlstra.

- bpo-26295: When using "python3 -m test --testdir=TESTDIR", regrtest
  doesn't add "test." prefix to test module names.

- bpo-26523: The multiprocessing thread pool (multiprocessing.dummy.Pool)
  was untested.

- bpo-26015: Added new tests for pickling iterators of mutable sequences.

- bpo-26325: Added test.support.check_no_resource_warning() to check that no
  ResourceWarning is emitted.

- bpo-25940: Changed test_ssl to use its internal local server more.  This
  avoids relying on svn.python.org, which recently changed root certificate.

- bpo-25616: Tests for OrderedDict are extracted from test_collections into
  separate file test_ordered_dict.

- bpo-25449: Added tests for OrderedDict subclasses.

- bpo-25188: Add -P/--pgo to test.regrtest to suppress error output when
  running the test suite for the purposes of a PGO build. Initial patch by
  Alecsandru Patrascu.

- bpo-22806: Add ``python -m test --list-tests`` command to list tests.

- bpo-18174: ``python -m test --huntrleaks ...`` now also checks for leak of
  file descriptors. Patch written by Richard Oudkerk.

- bpo-25260: Fix ``python -m test --coverage`` on Windows. Remove the list
  of ignored directories.

- ``PCbuild\rt.bat`` now accepts an unlimited number of arguments to pass
  along to regrtest.py.  Previously there was a limit of 9.

- bpo-26583: Skip test_timestamp_overflow in test_import if bytecode files
  cannot be written.

Build
-----

- bpo-21277: Don't try to link _ctypes with a ffi_convenience library.

- bpo-26884: Fix linking extension modules for cross builds. Patch by Xavier
  de Gaye.

- bpo-26932: Fixed support of RTLD_* constants defined as enum values, not
  via macros (in particular on Android).  Patch by Chi Hsuan Yen.

- bpo-22359: Disable the rules for running _freeze_importlib and pgen when
  cross- compiling.  The output of these programs is normally saved with the
  source code anyway, and is still regenerated when doing a native build.
  Patch by Xavier de Gaye.

- bpo-21668: Link audioop, _datetime, _ctypes_test modules to libm, except
  on Mac OS X. Patch written by Chi Hsuan Yen.

- bpo-25702: A --with-lto configure option has been added that will enable
  link time optimizations at build time during a make profile-opt. Some
  compilers and toolchains are known to not produce stable code when using
  LTO, be sure to test things thoroughly before relying on it. It can
  provide a few % speed up over profile-opt alone.

- bpo-26624: Adds validation of ucrtbase[d].dll version with warning for old
  versions.

- bpo-17603: Avoid error about nonexistant fileblocks.o file by using a
  lower-level check for st_blocks in struct stat.

- bpo-26079: Fixing the build output folder for tix-8.4.3.6. Patch by Bjoern
  Thiel.

- bpo-26465: Update Windows builds to use OpenSSL 1.0.2g.

- bpo-25348: Added ``--pgo`` and ``--pgo-job`` arguments to
  ``PCbuild\build.bat`` for building with Profile-Guided Optimization.  The
  old ``PCbuild\build_pgo.bat`` script is removed.

- bpo-25827: Add support for building with ICC to ``configure``, including a
  new ``--with-icc`` flag.

- bpo-25696: Fix installation of Python on UNIX with make -j9.

- bpo-24986: It is now possible to build Python on Windows without errors
  when external libraries are not available.

- bpo-24421: Compile Modules/_math.c once, before building extensions.
  Previously it could fail to compile properly if the math and cmath builds
  were concurrent.

- bpo-26465: Update OS X 10.5+ 32-bit-only installer to build and link with
  OpenSSL 1.0.2g.

- bpo-26268: Update Windows builds to use OpenSSL 1.0.2f.

- bpo-25136: Support Apple Xcode 7's new textual SDK stub libraries.

- bpo-24324: Do not enable unreachable code warnings when using gcc as the
  option does not work correctly in older versions of gcc and has been
  silently removed as of gcc-4.5.

Windows
-------

- bpo-27053: Updates make_zip.py to correctly generate library ZIP file.

- bpo-26268: Update the prepare_ssl.py script to handle OpenSSL releases
  that don't include the contents of the include directory (that is, 1.0.2e
  and later).

- bpo-26071: bdist_wininst created binaries fail to start and find 32bit
  Python

- bpo-26073: Update the list of magic numbers in launcher

- bpo-26065: Excludes venv from library when generating embeddable distro.

- bpo-25022: Removed very outdated PC/example_nt/ directory.

Tools/Demos
-----------

- bpo-26799: Fix python-gdb.py: don't get C types once when the Python code
  is loaded, but get C types on demand. The C types can change if python-
  gdb.py is loaded before the Python executable. Patch written by Thomas
  Ilsche.

- bpo-26271: Fix the Freeze tool to properly use flags passed through
  configure. Patch by Daniel Shaulov.

- bpo-26489: Add dictionary unpacking support to Tools/parser/unparse.py.
  Patch by Guo Ci Teo.

- bpo-26316: Fix variable name typo in Argument Clinic.

- bpo-25440: Fix output of python-config --extension-suffix.

- bpo-25154: The pyvenv script has been deprecated in favour of `python3 -m
  venv`.

C API
-----

- bpo-26312: SystemError is now raised in all programming bugs with using
  PyArg_ParseTupleAndKeywords().  RuntimeError did raised before in some
  programming bugs.

- bpo-26198: ValueError is now raised instead of TypeError on buffer
  overflow in parsing "es#" and "et#" format units.  SystemError is now
  raised instead of TypeError on programmical error in parsing format
  string.


What's New in Python 3.5.3 final?
=================================

*Release date: 2017-01-17*

There were no code changes between 3.5.3rc1 and 3.5.3 final.



What's New in Python 3.5.3 release candidate 1?
===============================================

*Release date: 2017-01-02*

Core and Builtins
-----------------

- bpo-29073: bytearray formatting no longer truncates on first null byte.

- bpo-28932: Do not include <sys/random.h> if it does not exist.

- bpo-28147: Fix a memory leak in split-table dictionaries: setattr() must
  not convert combined table into split table.

- bpo-25677: Correct the positioning of the syntax error caret for indented
  blocks. Based on patch by Michael Layzell.

- bpo-29000: Fixed bytes formatting of octals with zero padding in alternate
  form.

- bpo-28512: Fixed setting the offset attribute of SyntaxError by
  PyErr_SyntaxLocationEx() and PyErr_SyntaxLocationObject().

- bpo-28991: functools.lru_cache() was susceptible to an obscure reentrancy
  bug caused by a monkey-patched len() function.

- bpo-28648: Fixed crash in Py_DecodeLocale() in debug build on Mac OS X
  when decode astral characters.  Patch by Xiang Zhang.

- bpo-19398: Extra slash no longer added to sys.path components in case of
  empty compile- time PYTHONPATH components.

- bpo-28426: Fixed potential crash in PyUnicode_AsDecodedObject() in debug
  build.

- bpo-23782: Fixed possible memory leak in _PyTraceback_Add() and exception
  loss in PyTraceBack_Here().

- bpo-28379: Added sanity checks and tests for PyUnicode_CopyCharacters().
  Patch by Xiang Zhang.

- bpo-28376: The type of long range iterator is now registered as Iterator.
  Patch by Oren Milman.

- bpo-28376: The constructor of range_iterator now checks that step is not
  0. Patch by Oren Milman.

- bpo-26906: Resolving special methods of uninitialized type now causes
  implicit initialization of the type instead of a fail.

- bpo-18287: PyType_Ready() now checks that tp_name is not NULL. Original
  patch by Niklas Koep.

- bpo-24098: Fixed possible crash when AST is changed in process of
  compiling it.

- bpo-28350: String constants with null character no longer interned.

- bpo-26617: Fix crash when GC runs during weakref callbacks.

- bpo-27942: String constants now interned recursively in tuples and
  frozensets.

- bpo-21578: Fixed misleading error message when ImportError called with
  invalid keyword args.

- bpo-28203: Fix incorrect type in error message from ``complex(1.0,
  {2:3})``. Patch by Soumya Sharma.

- bpo-27955: Fallback on reading /dev/urandom device when the getrandom()
  syscall fails with EPERM, for example when blocked by SECCOMP.

- bpo-28131: Fix a regression in zipimport's compile_source().  zipimport
  should use the same optimization level as the interpreter.

- bpo-25221: Fix corrupted result from PyLong_FromLong(0) when Python is
  compiled with NSMALLPOSINTS = 0.

- bpo-25758: Prevents zipimport from unnecessarily encoding a filename
  (patch by Eryk Sun)

- bpo-28189: dictitems_contains no longer swallows compare errors. (Patch by
  Xiang Zhang)

- bpo-27812: Properly clear out a generator's frame's backreference to the
  generator to prevent crashes in frame.clear().

- bpo-27811: Fix a crash when a coroutine that has not been awaited is
  finalized with warnings-as-errors enabled.

- bpo-27587: Fix another issue found by PVS-Studio: Null pointer check after
  use of 'def' in _PyState_AddModule(). Initial patch by Christian Heimes.

- bpo-26020: set literal evaluation order did not match documented
  behaviour.

- bpo-27782: Multi-phase extension module import now correctly allows the
  ``m_methods`` field to be used to add module level functions to instances
  of non-module types returned from ``Py_create_mod``. Patch by Xiang Zhang.

- bpo-27936: The round() function accepted a second None argument for some
  types but not for others.  Fixed the inconsistency by accepting None for
  all numeric types.

- bpo-27487: Warn if a submodule argument to "python -m" or
  runpy.run_module() is found in sys.modules after parent packages are
  imported, but before the submodule is executed.

- bpo-27558: Fix a SystemError in the implementation of "raise" statement.
  In a brand new thread, raise a RuntimeError since there is no active
  exception to reraise. Patch written by Xiang Zhang.

- bpo-27419: Standard __import__() no longer look up "__import__" in globals
  or builtins for importing submodules or "from import".  Fixed handling an
  error of non- string package name.

- bpo-27083: Respect the PYTHONCASEOK environment variable under Windows.

- bpo-27514: Make having too many statically nested blocks a SyntaxError
  instead of SystemError.

- bpo-27473: Fixed possible integer overflow in bytes and bytearray
  concatenations. Patch by Xiang Zhang.

- bpo-27507: Add integer overflow check in bytearray.extend().  Patch by
  Xiang Zhang.

- bpo-27581: Don't rely on wrapping for overflow check in
  PySequence_Tuple().  Patch by Xiang Zhang.

- bpo-27443: __length_hint__() of bytearray iterators no longer return a
  negative integer for a resized bytearray.

- bpo-27942: Fix memory leak in codeobject.c

Library
-------

- bpo-15812: inspect.getframeinfo() now correctly shows the first line of a
  context. Patch by Sam Breese.

- bpo-29094: Offsets in a ZIP file created with extern file object and modes
  "w" and "x" now are relative to the start of the file.

- bpo-13051: Fixed recursion errors in large or resized
  curses.textpad.Textbox.  Based on patch by Tycho Andersen.

- bpo-29119: Fix weakrefs in the pure python version of
  collections.OrderedDict move_to_end() method. Contributed by Andra
  Bogildea.

- bpo-9770: curses.ascii predicates now work correctly with negative
  integers.

- bpo-28427: old keys should not remove new values from WeakValueDictionary
  when collecting from another thread.

- bpo-28923: Remove editor artifacts from Tix.py.

- bpo-28871: Fixed a crash when deallocate deep ElementTree.

- bpo-19542: Fix bugs in WeakValueDictionary.setdefault() and
  WeakValueDictionary.pop() when a GC collection happens in another thread.

- bpo-20191: Fixed a crash in resource.prlimit() when pass a sequence that
  doesn't own its elements as limits.

- bpo-28779: multiprocessing.set_forkserver_preload() would crash the
  forkserver process if a preloaded module instantiated some multiprocessing
  objects such as locks.

- bpo-28847: dbm.dumb now supports reading read-only files and no longer
  writes the index file when it is not changed.

- bpo-25659: In ctypes, prevent a crash calling the from_buffer() and
  from_buffer_copy() methods on abstract classes like Array.

- bpo-28732: Fix crash in os.spawnv() with no elements in args

- bpo-28485: Always raise ValueError for negative
  compileall.compile_dir(workers=...) parameter, even when multithreading is
  unavailable.

- bpo-28387: Fixed possible crash in _io.TextIOWrapper deallocator when the
  garbage collector is invoked in other thread.  Based on patch by Sebastian
  Cufre.

- bpo-27517: LZMA compressor and decompressor no longer raise exceptions if
  given empty data twice.  Patch by Benjamin Fogle.

- bpo-28549: Fixed segfault in curses's addch() with ncurses6.

- bpo-28449: tarfile.open() with mode "r" or "r:" now tries to open a tar
  file with compression before trying to open it without compression.
  Otherwise it had 50% chance failed with ignore_zeros=True.

- bpo-23262: The webbrowser module now supports Firefox 36+ and derived
  browsers.  Based on patch by Oleg Broytman.

- bpo-27939: Fixed bugs in tkinter.ttk.LabeledScale and tkinter.Scale caused
  by representing the scale as float value internally in Tk.  tkinter.IntVar
  now works if float value is set to underlying Tk variable.

- bpo-28255: calendar.TextCalendar().prmonth() no longer prints a space at
  the start of new line after printing a month's calendar.  Patch by Xiang
  Zhang.

- bpo-20491: The textwrap.TextWrapper class now honors non-breaking spaces.
  Based on patch by Kaarle Ritvanen.

- bpo-28353: os.fwalk() no longer fails on broken links.

- bpo-25464: Fixed HList.header_exists() in tkinter.tix module by addin a
  workaround to Tix library bug.

- bpo-28488: shutil.make_archive() no longer add entry "./" to ZIP archive.

- bpo-24452: Make webbrowser support Chrome on Mac OS X.

- bpo-20766: Fix references leaked by pdb in the handling of SIGINT
  handlers.

- bpo-26293: Fixed writing ZIP files that starts not from the start of the
  file.  Offsets in ZIP file now are relative to the start of the archive in
  conforming to the specification.

- bpo-28321: Fixed writing non-BMP characters with binary format in
  plistlib.

- bpo-28322: Fixed possible crashes when unpickle itertools objects from
  incorrect pickle data.  Based on patch by John Leitch.

- Fix possible integer overflows and crashes in the mmap module with unusual
  usage patterns.

- bpo-1703178: Fix the ability to pass the --link-objects option to the
  distutils build_ext command.

- bpo-28253: Fixed calendar functions for extreme months: 0001-01 and
  9999-12.

  Methods itermonthdays() and itermonthdays2() are reimplemented so that
  they don't call itermonthdates() which can cause datetime.date
  under/overflow.

- bpo-28275: Fixed possible use after free in the decompress() methods of
  the LZMADecompressor and BZ2Decompressor classes. Original patch by John
  Leitch.

- bpo-27897: Fixed possible crash in sqlite3.Connection.create_collation()
  if pass invalid string-like object as a name.  Patch by Xiang Zhang.

- bpo-18893: Fix invalid exception handling in Lib/ctypes/macholib/dyld.py.
  Patch by Madison May.

- bpo-27611: Fixed support of default root window in the tkinter.tix module.

- bpo-27348: In the traceback module, restore the formatting of exception
  messages like "Exception: None".  This fixes a regression introduced in
  3.5a2.

- bpo-25651: Allow falsy values to be used for msg parameter of subTest().

- bpo-27932: Prevent memory leak in win32_ver().

- Fix UnboundLocalError in socket._sendfile_use_sendfile.

- bpo-28075: Check for ERROR_ACCESS_DENIED in Windows implementation of
  os.stat().  Patch by Eryk Sun.

- bpo-25270: Prevent codecs.escape_encode() from raising SystemError when an
  empty bytestring is passed.

- bpo-28181: Get antigravity over HTTPS. Patch by Kaartic Sivaraam.

- bpo-25895: Enable WebSocket URL schemes in urllib.parse.urljoin. Patch by
  Gergely Imreh and Markus Holtermann.

- bpo-27599: Fixed buffer overrun in binascii.b2a_qp() and
  binascii.a2b_qp().

- bpo-19003: m email.generator now replaces only ``\r`` and/or ``\n`` line
  endings, per the RFC, instead of all unicode line endings.

- bpo-28019: itertools.count() no longer rounds non-integer step in range
  between 1.0 and 2.0 to 1.

- bpo-25969: Update the lib2to3 grammar to handle the unpacking
  generalizations added in 3.5.

- bpo-14977: mailcap now respects the order of the lines in the mailcap
  files ("first match"), as required by RFC 1542.  Patch by Michael Lazar.

- bpo-24594: Validates persist parameter when opening MSI database

- bpo-17582: xml.etree.ElementTree nows preserves whitespaces in attributes
  (Patch by Duane Griffin.  Reviewed and approved by Stefan Behnel.)

- bpo-28047: Fixed calculation of line length used for the base64 CTE in the
  new email policies.

- bpo-27445: Don't pass str(_charset) to MIMEText.set_payload(). Patch by
  Claude Paroz.

- bpo-22450: urllib now includes an ``Accept: */*`` header among the default
  headers. This makes the results of REST API requests more consistent and
  predictable especially when proxy servers are involved.

- lib2to3.pgen3.driver.load_grammar() now creates a stable cache file
  between runs given the same Grammar.txt input regardless of the hash
  randomization setting.

- bpo-27570: Avoid zero-length memcpy() etc calls with null source pointers
  in the "ctypes" and "array" modules.

- bpo-22233: Break email header lines *only* on the RFC specified CR and LF
  characters, not on arbitrary unicode line breaks.  This also fixes a bug
  in HTTP header parsing.

- bpo-27988: Fix email iter_attachments incorrect mutation of payload list.

- bpo-27691: Fix ssl module's parsing of GEN_RID subject alternative name
  fields in X.509 certs.

- bpo-27850: Remove 3DES from ssl module's default cipher list to counter
  measure sweet32 attack (CVE-2016-2183).

- bpo-27766: Add ChaCha20 Poly1305 to ssl module's default ciper list.
  (Required OpenSSL 1.1.0 or LibreSSL).

- bpo-26470: Port ssl and hashlib module to OpenSSL 1.1.0.

- Remove support for passing a file descriptor to os.access. It never worked
  but previously didn't raise.

- bpo-12885: Fix error when distutils encounters symlink.

- bpo-27881: Fixed possible bugs when setting
  sqlite3.Connection.isolation_level. Based on patch by Xiang Zhang.

- bpo-27861: Fixed a crash in sqlite3.Connection.cursor() when a factory
  creates not a cursor.  Patch by Xiang Zhang.

- bpo-19884: Avoid spurious output on OS X with Gnu Readline.

- bpo-27706: Restore deterministic behavior of random.Random().seed() for
  string seeds using seeding version 1.  Allows sequences of calls to
  random() to exactly match those obtained in Python 2. Patch by Nofar
  Schnider.

- bpo-10513: Fix a regression in Connection.commit().  Statements should not
  be reset after a commit.

- A new version of typing.py from https://github.com/python/typing: -
  Collection (only for 3.6) (Issue #27598) - Add FrozenSet to __all__
  (upstream #261) - fix crash in _get_type_vars() (upstream #259) - Remove
  the dict constraint in ForwardRef._eval_type (upstream #252)

- bpo-27539: Fix unnormalised ``Fraction.__pow__`` result in the case of
  negative exponent and negative base.

- bpo-21718: cursor.description is now available for queries using CTEs.

- bpo-2466: posixpath.ismount now correctly recognizes mount points which
  the user does not have permission to access.

- bpo-27773: Correct some memory management errors server_hostname in
  _ssl.wrap_socket().

- bpo-26750: unittest.mock.create_autospec() now works properly for
  subclasses of property() and other data descriptors.

- In the curses module, raise an error if window.getstr() or window.instr()
  is passed a negative value.

- bpo-27783: Fix possible usage of uninitialized memory in
  operator.methodcaller.

- bpo-27774: Fix possible Py_DECREF on unowned object in _sre.

- bpo-27760: Fix possible integer overflow in binascii.b2a_qp.

- bpo-27758: Fix possible integer overflow in the _csv module for large
  record lengths.

- bpo-27568: Prevent HTTPoxy attack (CVE-2016-1000110). Ignore the
  HTTP_PROXY variable when REQUEST_METHOD environment is set, which
  indicates that the script is in CGI mode.

- bpo-27656: Do not assume sched.h defines any SCHED_* constants.

- bpo-27130: In the "zlib" module, fix handling of large buffers (typically
  4 GiB) when compressing and decompressing.  Previously, inputs were
  limited to 4 GiB, and compression and decompression operations did not
  properly handle results of 4 GiB.

- bpo-27533: Release GIL in nt._isdir

- bpo-17711: Fixed unpickling by the persistent ID with protocol 0. Original
  patch by Alexandre Vassalotti.

- bpo-27522: Avoid an unintentional reference cycle in email.feedparser.

- bpo-26844: Fix error message for imp.find_module() to refer to 'path'
  instead of 'name'. Patch by Lev Maximov.

- bpo-23804: Fix SSL zero-length recv() calls to not block and not raise an
  error about unclean EOF.

- bpo-27466: Change time format returned by http.cookie.time2netscape,
  confirming the netscape cookie format and making it consistent with
  documentation.

- bpo-26664: Fix activate.fish by removing mis-use of ``$``.

- bpo-22115: Fixed tracing Tkinter variables: trace_vdelete() with wrong
  mode no longer break tracing, trace_vinfo() now always returns a list of
  pairs of strings, tracing in the "u" mode now works.

- Fix a scoping issue in importlib.util.LazyLoader which triggered an
  UnboundLocalError when lazy-loading a module that was already put into
  sys.modules.

- bpo-27079: Fixed curses.ascii functions isblank(), iscntrl() and
  ispunct().

- bpo-26754: Some functions (compile() etc) accepted a filename argument
  encoded as an iterable of integers. Now only strings and byte-like objects
  are accepted.

- bpo-27048: Prevents distutils failing on Windows when environment
  variables contain non-ASCII characters

- bpo-27330: Fixed possible leaks in the ctypes module.

- bpo-27238: Got rid of bare excepts in the turtle module.  Original patch
  by Jelle Zijlstra.

- bpo-27122: When an exception is raised within the context being managed by
  a contextlib.ExitStack() and one of the exit stack generators catches and
  raises it in a chain, do not re-raise the original exception when exiting,
  let the new chained one through.  This avoids the PEP 479 bug described in
  issue25782.

Security
--------

- bpo-27278: Fix os.urandom() implementation using getrandom() on Linux.
  Truncate size to INT_MAX and loop until we collected enough random bytes,
  instead of casting a directly Py_ssize_t to int.

Library
-------

- bpo-26386: Fixed ttk.TreeView selection operations with item id's
  containing spaces.

Security
--------

- bpo-22636: Avoid shell injection problems with ctypes.util.find_library().

Library
-------

- bpo-16182: Fix various functions in the "readline" module to use the
  locale encoding, and fix get_begidx() and get_endidx() to return code
  point indexes.

- bpo-27392: Add loop.connect_accepted_socket(). Patch by Jim Fulton.

- bpo-27930: Improved behaviour of logging.handlers.QueueListener. Thanks to
  Paulo Andrade and Petr Viktorin for the analysis and patch.

- bpo-21201: Improves readability of multiprocessing error message.  Thanks
  to Wojciech Walczak for patch.

- bpo-27456: asyncio: Set TCP_NODELAY by default.

- bpo-27906: Fix socket accept exhaustion during high TCP traffic. Patch by
  Kevin Conway.

- bpo-28174: Handle when SO_REUSEPORT isn't properly supported. Patch by
  Seth Michael Larson.

- bpo-26654: Inspect functools.partial in asyncio.Handle.__repr__. Patch by
  iceboy.

- bpo-26909: Fix slow pipes IO in asyncio. Patch by INADA Naoki.

- bpo-28176: Fix callbacks race in asyncio.SelectorLoop.sock_connect.

- bpo-27759: Fix selectors incorrectly retain invalid file descriptors.
  Patch by Mark Williams.

- bpo-28368: Refuse monitoring processes if the child watcher has no loop
  attached. Patch by Vincent Michel.

- bpo-28369: Raise RuntimeError when transport's FD is used with add_reader,
  add_writer, etc.

- bpo-28370: Speedup asyncio.StreamReader.readexactly. Patch by Коренберг
  Марк.

- bpo-28371: Deprecate passing asyncio.Handles to run_in_executor.

- bpo-28372: Fix asyncio to support formatting of non-python coroutines.

- bpo-28399: Remove UNIX socket from FS before binding. Patch by Коренберг
  Марк.

- bpo-27972: Prohibit Tasks to await on themselves.

- bpo-26923: Fix asyncio.Gather to refuse being cancelled once all children
  are done. Patch by Johannes Ebke.

- bpo-26796: Don't configure the number of workers for default threadpool
  executor. Initial patch by Hans Lawrenz.

- bpo-28600: Optimize loop.call_soon().

- bpo-28613: Fix get_event_loop() return the current loop if called from
  coroutines/callbacks.

- bpo-28639: Fix inspect.isawaitable to always return bool Patch by Justin
  Mayfield.

- bpo-28652: Make loop methods reject socket kinds they do not support.

- bpo-28653: Fix a refleak in functools.lru_cache.

- bpo-28703: Fix asyncio.iscoroutinefunction to handle Mock objects.

- bpo-24142: Reading a corrupt config file left the parser in an invalid
  state.  Original patch by Florian Höch.

- bpo-28990: Fix SSL hanging if connection is closed before handshake
  completed. (Patch by HoHo-Ho)

IDLE
----

- bpo-15308: Add 'interrupt execution' (^C) to Shell menu. Patch by Roger
  Serwy, updated by Bayard Randel.

- bpo-27922: Stop IDLE tests from 'flashing' gui widgets on the screen.

- Add version to title of IDLE help window.

- bpo-25564: In section on IDLE -- console differences, mention that using
  exec means that __builtins__ is defined for each statement.

- bpo-27714: text_textview and test_autocomplete now pass when re-run in the
  same process.  This occurs when test_idle fails when run with the -w
  option but without -jn.  Fix warning from test_config.

- bpo-25507: IDLE no longer runs buggy code because of its tkinter imports.
  Users must include the same imports required to run directly in Python.

- bpo-27452: add line counter and crc to IDLE configHandler test dump.

- bpo-27365: Allow non-ascii chars in IDLE NEWS.txt, for contributor names.

- bpo-27245: IDLE: Cleanly delete custom themes and key bindings.
  Previously, when IDLE was started from a console or by import, a cascade
  of warnings was emitted. Patch by Serhiy Storchaka.

C API
-----

- bpo-28808: PyUnicode_CompareWithASCIIString() now never raises exceptions.

- bpo-26754: PyUnicode_FSDecoder() accepted a filename argument encoded as
  an iterable of integers. Now only strings and bytes-like objects are
  accepted.

Documentation
-------------

- bpo-28513: Documented command-line interface of zipfile.

Tests
-----

- bpo-28950: Disallow -j0 to be combined with -T/-l/-M in regrtest command
  line arguments.

- bpo-28666: Now test.support.rmtree is able to remove unwritable or
  unreadable directories.

- bpo-23839: Various caches now are cleared before running every test file.

- bpo-28409: regrtest: fix the parser of command line arguments.

- bpo-27787: Call gc.collect() before checking each test for "dangling
  threads", since the dangling threads are weak references.

- bpo-27369: In test_pyexpat, avoid testing an error message detail that
  changed in Expat 2.2.0.

Tools/Demos
-----------

- bpo-27952: Get Tools/scripts/fixcid.py working with Python 3 and the
  current "re" module, avoid invalid Python backslash escapes, and fix a bug
  parsing escaped C quote signs.

- bpo-27332: Fixed the type of the first argument of module-level functions
  generated by Argument Clinic.  Patch by Petr Viktorin.

- bpo-27418: Fixed Tools/importbench/importbench.py.

Windows
-------

- bpo-28251: Improvements to help manuals on Windows.

- bpo-28110: launcher.msi has different product codes between 32-bit and
  64-bit

- bpo-25144: Ensures TargetDir is set before continuing with custom install.

- bpo-27469: Adds a shell extension to the launcher so that drag and drop
  works correctly.

- bpo-27309: Enabled proper Windows styles in python[w].exe manifest.

Build
-----

- bpo-29080: Removes hard dependency on hg.exe from PCBuild/build.bat

- bpo-23903: Added missed names to PC/python3.def.

- bpo-10656: Fix out-of-tree building on AIX.  Patch by Tristan Carel and
  Michael Haubenwallner.

- bpo-26359: Rename --with-optimiations to --enable-optimizations.

- bpo-28444: Fix missing extensions modules when cross compiling.

- bpo-28248: Update Windows build and OS X installers to use OpenSSL 1.0.2j.

- bpo-28258: Fixed build with Estonian locale (python-config and distclean
  targets in Makefile).  Patch by Arfrever Frehtes Taifersar Arahesis.

- bpo-26661: setup.py now detects system libffi with multiarch wrapper.

- bpo-28066: Fix the logic that searches build directories for generated
  include files when building outside the source tree.

- bpo-15819: Remove redundant include search directory option for building
  outside the source tree.

- bpo-27566: Fix clean target in freeze makefile (patch by Lisa Roach)

- bpo-27705: Update message in validate_ucrtbase.py

- bpo-27983: Cause lack of llvm-profdata tool when using clang as required
  for PGO linking to be a configure time error rather than make time when
  --with- optimizations is enabled.  Also improve our ability to find the
  llvm- profdata tool on MacOS and some Linuxes.

- bpo-26307: The profile-opt build now applies PGO to the built-in modules.

- bpo-26359: Add the --with-optimizations configure flag.

- bpo-27713: Suppress spurious build warnings when updating importlib's
  bootstrap files. Patch by Xiang Zhang

- bpo-25825: Correct the references to Modules/python.exp and ld_so_aix,
  which are required on AIX.  This updates references to an installation
  path that was changed in 3.2a4, and undoes changed references to the build
  tree that were made in 3.5.0a1.

- bpo-27453: CPP invocation in configure must use CPPFLAGS. Patch by Chi
  Hsuan Yen.

- bpo-27641: The configure script now inserts comments into the makefile to
  prevent the pgen and _freeze_importlib executables from being cross-
  compiled.

- bpo-26662: Set PYTHON_FOR_GEN in configure as the Python program to be
  used for file generation during the build.

- bpo-10910: Avoid C++ compilation errors on FreeBSD and OS X. Also update
  FreedBSD version checks for the original ctype UTF-8 workaround.

- bpo-28676: Prevent missing 'getentropy' declaration warning on macOS.
  Patch by Gareth Rees.


What's New in Python 3.5.2 final?
=================================

*Release date: 2016-06-26*

Core and Builtins
-----------------

- bpo-26930: Update Windows builds to use OpenSSL 1.0.2h.

Tests
-----

- bpo-26867: Ubuntu's openssl OP_NO_SSLv3 is forced on by default; fix test.

IDLE
----

- bpo-27365: Allow non-ascii in idlelib/NEWS.txt - minimal part for 3.5.2.


What's New in Python 3.5.2 release candidate 1?
===============================================

*Release date: 2016-06-12*

Core and Builtins
-----------------

- bpo-27066: Fixed SystemError if a custom opener (for open()) returns a
  negative number without setting an exception.

- bpo-20041: Fixed TypeError when frame.f_trace is set to None. Patch by
  Xavier de Gaye.

- bpo-26168: Fixed possible refleaks in failing Py_BuildValue() with the "N"
  format unit.

- bpo-26991: Fix possible refleak when creating a function with annotations.

- bpo-27039: Fixed bytearray.remove() for values greater than 127.  Patch by
  Joe Jevnik.

- bpo-23640: int.from_bytes() no longer bypasses constructors for
  subclasses.

- bpo-26811: gc.get_objects() no longer contains a broken tuple with NULL
  pointer.

- bpo-20120: Use RawConfigParser for .pypirc parsing, removing support for
  interpolation unintentionally added with move to Python 3. Behavior no
  longer does any interpolation in .pypirc files, matching behavior in
  Python 2.7 and Setuptools 19.0.

- bpo-26659: Make the builtin slice type support cycle collection.

- bpo-26718: super.__init__ no longer leaks memory if called multiple times.
  NOTE: A direct call of super.__init__ is not endorsed!

- bpo-25339: PYTHONIOENCODING now has priority over locale in setting the
  error handler for stdin and stdout.

- bpo-26494: Fixed crash on iterating exhausting iterators. Affected classes
  are generic sequence iterators, iterators of str, bytes, bytearray, list,
  tuple, set, frozenset, dict, OrderedDict, corresponding views and
  os.scandir() iterator.

- bpo-26581: If coding cookie is specified multiple times on a line in
  Python source code file, only the first one is taken to account.

- bpo-26464: Fix str.translate() when string is ASCII and first replacements
  removes character, but next replacement uses a non-ASCII character or a
  string longer than 1 character. Regression introduced in Python 3.5.0.

- bpo-22836: Ensure exception reports from PyErr_Display() and
  PyErr_WriteUnraisable() are sensible even when formatting them produces
  secondary errors.  This affects the reports produced by
  sys.__excepthook__() and when __del__() raises an exception.

- bpo-26302: Correct behavior to reject comma as a legal character for
  cookie names.

- bpo-4806: Avoid masking the original TypeError exception when using star
  (``*``) unpacking in function calls.  Based on patch by Hagen Fürstenau
  and Daniel Urban.

- bpo-27138: Fix the doc comment for FileFinder.find_spec().

- bpo-26154: Add a new private _PyThreadState_UncheckedGet() function to get
  the current Python thread state, but don't issue a fatal error if it is
  NULL. This new function must be used instead of accessing directly the
  _PyThreadState_Current variable.  The variable is no more exposed since
  Python 3.5.1 to hide the exact implementation of atomic C types, to avoid
  compiler issues.

- bpo-26194: Deque.insert() gave odd results for bounded deques that had
  reached their maximum size.  Now an IndexError will be raised when
  attempting to insert into a full deque.

- bpo-25843: When compiling code, don't merge constants if they are equal
  but have a different types. For example, ``f1, f2 = lambda: 1, lambda:
  1.0`` is now correctly compiled to two different functions: ``f1()``
  returns ``1`` (``int``) and ``f2()`` returns ``1.0`` (``int``), even if
  ``1`` and ``1.0`` are equal.

- bpo-22995: [UPDATE] Comment out the one of the pickleability tests in
  _PyObject_GetState() due to regressions observed in Cython-based projects.

- bpo-25961: Disallowed null characters in the type name.

- bpo-25973: Fix segfault when an invalid nonlocal statement binds a name
  starting with two underscores.

- bpo-22995: Instances of extension types with a state that aren't
  subclasses of list or dict and haven't implemented any pickle-related
  methods (__reduce__, __reduce_ex__, __getnewargs__, __getnewargs_ex__, or
  __getstate__), can no longer be pickled.  Including memoryview.

- bpo-20440: Massive replacing unsafe attribute setting code with special
  macro Py_SETREF.

- bpo-25766: Special method __bytes__() now works in str subclasses.

- bpo-25421: __sizeof__ methods of builtin types now use dynamic basic size.
  This allows sys.getsize() to work correctly with their subclasses with
  __slots__ defined.

- bpo-25709: Fixed problem with in-place string concatenation and utf-8
  cache.

- bpo-27147: Mention PEP 420 in the importlib docs.

- bpo-24097: Fixed crash in object.__reduce__() if slot name is freed inside
  __getattr__.

- bpo-24731: Fixed crash on converting objects with special methods
  __bytes__, __trunc__, and __float__ returning instances of subclasses of
  bytes, int, and float to subclasses of bytes, int, and float
  correspondingly.

- bpo-26478: Fix semantic bugs when using binary operators with dictionary
  views and tuples.

- bpo-26171: Fix possible integer overflow and heap corruption in
  zipimporter.get_data().

- bpo-25660: Fix TAB key behaviour in REPL with readline.

- bpo-25887: Raise a RuntimeError when a coroutine object is awaited more
  than once.

- bpo-27243: Update the __aiter__ protocol: instead of returning an
  awaitable that resolves to an asynchronous iterator, the asynchronous
  iterator should be returned directly.  Doing the former will trigger a
  PendingDeprecationWarning.

Security
--------

- bpo-26556: Update expat to 2.1.1, fixes CVE-2015-1283.

- Fix TLS stripping vulnerability in smtplib, CVE-2016-0772. Reported by
  Team Oststrom

Library
-------

- bpo-21386: Implement missing IPv4Address.is_global property.  It was
  documented since 07a5610bae9d.  Initial patch by Roger Luethi.

- bpo-20900: distutils register command now decodes HTTP responses
  correctly.  Initial patch by ingrid.

- A new version of typing.py provides several new classes and features:
  @overload outside stubs, DefaultDict, Text, ContextManager, Type[],
  NewType(), TYPE_CHECKING, and numerous bug fixes (note that some of the
  new features are not yet implemented in mypy or other static analyzers).
  Also classes for PEP 492 (Awaitable, AsyncIterable, AsyncIterator) have
  been added (in fact they made it into 3.5.1 but were never mentioned).

- bpo-25738: Stop http.server.BaseHTTPRequestHandler.send_error() from
  sending a message body for 205 Reset Content.  Also, don't send Content
  header fields in responses that don't have a body.  Patch by Susumu
  Koshiba.

- bpo-21313: Fix the "platform" module to tolerate when sys.version contains
  truncated build information.

Security
--------

- bpo-26839: On Linux, :func:`os.urandom` now calls ``getrandom()`` with
  ``GRND_NONBLOCK`` to fall back on reading ``/dev/urandom`` if the urandom
  entropy pool is not initialized yet. Patch written by Colm Buckley.

Library
-------

- bpo-27164: In the zlib module, allow decompressing raw Deflate streams
  with a predefined zdict.  Based on patch by Xiang Zhang.

- bpo-24291: Fix wsgiref.simple_server.WSGIRequestHandler to completely
  write data to the client.  Previously it could do partial writes and
  truncate data.  Also, wsgiref.handler.ServerHandler can now handle stdout
  doing partial writes, but this is deprecated.

- bpo-26809: Add ``__all__`` to :mod:`string`.  Patch by Emanuel Barry.

- bpo-26373: subprocess.Popen.communicate now correctly ignores
  BrokenPipeError when the child process dies before .communicate() is
  called in more/all circumstances.

- bpo-21776: distutils.upload now correctly handles HTTPError. Initial patch
  by Claudiu Popa.

- bpo-27114: Fix SSLContext._load_windows_store_certs fails with
  PermissionError

- bpo-18383: Avoid creating duplicate filters when using filterwarnings and
  simplefilter. Based on patch by Alex Shkop.

- bpo-27057: Fix os.set_inheritable() on Android, ioctl() is blocked by
  SELinux and fails with EACCESS. The function now falls back to fcntl().
  Patch written by Michał Bednarski.

- bpo-27014: Fix infinite recursion using typing.py.  Thanks to Kalle Tuure!

- bpo-14132: Fix urllib.request redirect handling when the target only has a
  query string.  Original fix by Ján Janech.

- bpo-17214: The "urllib.request" module now percent-encodes non-ASCII bytes
  found in redirect target URLs.  Some servers send Location header fields
  with non- ASCII bytes, but "http.client" requires the request target to be
  ASCII- encodable, otherwise a UnicodeEncodeError is raised.  Based on
  patch by Christian Heimes.

- bpo-26892: Honor debuglevel flag in urllib.request.HTTPHandler. Patch
  contributed by Chi Hsuan Yen.

- bpo-22274: In the subprocess module, allow stderr to be redirected to
  stdout even when stdout is not redirected.  Patch by Akira Li.

- bpo-26807: mock_open 'files' no longer error on readline at end of file.
  Patch from Yolanda Robla.

- bpo-25745: Fixed leaking a userptr in curses panel destructor.

- bpo-26977: Removed unnecessary, and ignored, call to sum of squares helper
  in statistics.pvariance.

- bpo-26881: The modulefinder module now supports extended opcode arguments.

- bpo-23815: Fixed crashes related to directly created instances of types in
  _tkinter and curses.panel modules.

- bpo-17765: weakref.ref() no longer silently ignores keyword arguments.
  Patch by Georg Brandl.

- bpo-26873: xmlrpc now raises ResponseError on unsupported type tags
  instead of silently return incorrect result.

- bpo-26711: Fixed the comparison of plistlib.Data with other types.

- bpo-24114: Fix an uninitialized variable in `ctypes.util`.

  The bug only occurs on SunOS when the ctypes implementation searches for
  the `crle` program.  Patch by Xiang Zhang.  Tested on SunOS by Kees Bos.

- bpo-26864: In urllib.request, change the proxy bypass host checking
  against no_proxy to be case-insensitive, and to not match unrelated host
  names that happen to have a bypassed hostname as a suffix.  Patch by Xiang
  Zhang.

- bpo-26634: recursive_repr() now sets __qualname__ of wrapper.  Patch by
  Xiang Zhang.

- bpo-26804: urllib.request will prefer lower_case proxy environment
  variables over UPPER_CASE or Mixed_Case ones. Patch contributed by Hans-
  Peter Jansen.

- bpo-26837: assertSequenceEqual() now correctly outputs non-stringified
  differing items (like bytes in the -b mode).  This affects
  assertListEqual() and assertTupleEqual().

- bpo-26041: Remove "will be removed in Python 3.7" from deprecation
  messages of platform.dist() and platform.linux_distribution(). Patch by
  Kumaripaba Miyurusara Athukorala.

- bpo-26822: itemgetter, attrgetter and methodcaller objects no longer
  silently ignore keyword arguments.

- bpo-26733: Disassembling a class now disassembles class and static
  methods. Patch by Xiang Zhang.

- bpo-26801: Fix error handling in :func:`shutil.get_terminal_size`, catch
  :exc:`AttributeError` instead of :exc:`NameError`. Patch written by
  Emanuel Barry.

- bpo-24838: tarfile's ustar and gnu formats now correctly calculate name
  and link field limits for multibyte character encodings like utf-8.

Security
--------

- bpo-26657: Fix directory traversal vulnerability with http.server on
  Windows.  This fixes a regression that was introduced in 3.3.4rc1 and
  3.4.0rc1.  Based on patch by Philipp Hagemeister.

Library
-------

- bpo-26717: Stop encoding Latin-1-ized WSGI paths with UTF-8.  Patch by
  Anthony Sottile.

- bpo-26735: Fix :func:`os.urandom` on Solaris 11.3 and newer when reading
  more than 1,024 bytes: call ``getrandom()`` multiple times with a limit of
  1024 bytes per call.

- bpo-16329: Add .webm to mimetypes.types_map.  Patch by Giampaolo Rodola'.

- bpo-13952: Add .csv to mimetypes.types_map.  Patch by Geoff Wilson.

- bpo-26709: Fixed Y2038 problem in loading binary PLists.

- bpo-23735: Handle terminal resizing with Readline 6.3+ by installing our
  own SIGWINCH handler.  Patch by Eric Price.

- bpo-26586: In http.server, respond with "413 Request header fields too
  large" if there are too many header fields to parse, rather than killing
  the connection and raising an unhandled exception.  Patch by Xiang Zhang.

- bpo-22854: Change BufferedReader.writable() and BufferedWriter.readable()
  to always return False.

- bpo-25195: Fix a regression in mock.MagicMock. _Call is a subclass of
  tuple (changeset 3603bae63c13 only works for classes) so we need to
  implement __ne__ ourselves.  Patch by Andrew Plummer.

- bpo-26644: Raise ValueError rather than SystemError when a negative length
  is passed to SSLSocket.recv() or read().

- bpo-23804: Fix SSL recv(0) and read(0) methods to return zero bytes
  instead of up to 1024.

- bpo-26616: Fixed a bug in datetime.astimezone() method.

- bpo-21925: :func:`warnings.formatwarning` now catches exceptions on
  ``linecache.getline(...)`` to be able to log :exc:`ResourceWarning`
  emitted late during the Python shutdown process.

- bpo-24266: Ctrl+C during Readline history search now cancels the search
  mode when compiled with Readline 7.

- bpo-26560: Avoid potential ValueError in BaseHandler.start_response.
  Initial patch by Peter Inglesby.

Security
--------

- bpo-26313: ssl.py _load_windows_store_certs fails if windows cert store is
  empty. Patch by Baji.

Library
-------

- bpo-26569: Fix :func:`pyclbr.readmodule` and :func:`pyclbr.readmodule_ex`
  to support importing packages.

- bpo-26499: Account for remaining Content-Length in HTTPResponse.readline()
  and read1(). Based on patch by Silent Ghost. Also document that
  HTTPResponse now supports these methods.

- bpo-25320: Handle sockets in directories unittest discovery is scanning.
  Patch from Victor van den Elzen.

- bpo-16181: cookiejar.http2time() now returns None if year is higher than
  datetime.MAXYEAR.

- bpo-26513: Fixes platform module detection of Windows Server

- bpo-23718: Fixed parsing time in week 0 before Jan 1.  Original patch by
  Tamás Bence Gedai.

- bpo-20589: Invoking Path.owner() and Path.group() on Windows now raise
  NotImplementedError instead of ImportError.

- bpo-26177: Fixed the keys() method for Canvas and Scrollbar widgets.

- bpo-15068: Got rid of excessive buffering in the fileinput module. The
  bufsize parameter is no longer used.

- bpo-2202: Fix UnboundLocalError in
  AbstractDigestAuthHandler.get_algorithm_impls. Initial patch by Mathieu
  Dupuy.

- bpo-25718: Fixed pickling and copying the accumulate() iterator with total
  is None.

- bpo-26475: Fixed debugging output for regular expressions with the (?x)
  flag.

- bpo-26457: Fixed the subnets() methods in IP network classes for the case
  when resulting prefix length is equal to maximal prefix length. Based on
  patch by Xiang Zhang.

- bpo-26385: Remove the file if the internal open() call in
  NamedTemporaryFile() fails. Patch by Silent Ghost.

- bpo-26402: Fix XML-RPC client to retry when the server shuts down a
  persistent connection.  This was a regression related to the new
  http.client.RemoteDisconnected exception in 3.5.0a4.

- bpo-25913: Leading ``<~`` is optional now in base64.a85decode() with
  adobe=True.  Patch by Swati Jaiswal.

- bpo-26186: Remove an invalid type check in importlib.util.LazyLoader.

- bpo-26367: importlib.__import__() raises SystemError like
  builtins.__import__() when ``level`` is specified but without an
  accompanying package specified.

- bpo-26309: In the "socketserver" module, shut down the request (closing
  the connected socket) when verify_request() returns false.  Patch by Aviv
  Palivoda.

Security
--------

- bpo-25939: On Windows open the cert store readonly in
  ssl.enum_certificates.

Library
-------

- bpo-25995: os.walk() no longer uses FDs proportional to the tree depth.

- bpo-26117: The os.scandir() iterator now closes file descriptor not only
  when the iteration is finished, but when it was failed with error.

- bpo-25911: Restored support of bytes paths in os.walk() on Windows.

- bpo-26045: Add UTF-8 suggestion to error message when posting a non-
  Latin-1 string with http.client.

- bpo-12923: Reset FancyURLopener's redirect counter even if there is an
  exception. Based on patches by Brian Brazil and Daniel Rocco.

- bpo-25945: Fixed a crash when unpickle the functools.partial object with
  wrong state. Fixed a leak in failed functools.partial constructor. "args"
  and "keywords" attributes of functools.partial have now always types tuple
  and dict correspondingly.

- bpo-26202: copy.deepcopy() now correctly copies range() objects with non-
  atomic attributes.

- bpo-23076: Path.glob() now raises a ValueError if it's called with an
  invalid pattern. Patch by Thomas Nyberg.

- bpo-19883: Fixed possible integer overflows in zipimport.

- bpo-26227: On Windows, getnameinfo(), gethostbyaddr() and
  gethostbyname_ex() functions of the socket module now decode the hostname
  from the ANSI code page rather than UTF-8.

- bpo-26147: xmlrpc now works with strings not encodable with used non-UTF-8
  encoding.

- bpo-25935: Garbage collector now breaks reference loops with OrderedDict.

- bpo-16620: Fixed AttributeError in msilib.Directory.glob().

- bpo-26013: Added compatibility with broken protocol 2 pickles created in
  old Python 3 versions (3.4.3 and lower).

- bpo-25850: Use cross-compilation by default for 64-bit Windows.

- bpo-17633: Improve zipimport's support for namespace packages.

- bpo-24705: Fix sysconfig._parse_makefile not expanding ${} vars appearing
  before $() vars.

- bpo-22138: Fix mock.patch behavior when patching descriptors. Restore
  original values after patching. Patch contributed by Sean McCully.

- bpo-25672: In the ssl module, enable the SSL_MODE_RELEASE_BUFFERS mode
  option if it is safe to do so.

- bpo-26012: Don't traverse into symlinks for ``**`` pattern in
  pathlib.Path.[r]glob().

- bpo-24120: Ignore PermissionError when traversing a tree with
  pathlib.Path.[r]glob(). Patch by Ulrich Petri.

- bpo-25447: fileinput now uses sys.stdin as-is if it does not have a buffer
  attribute (restores backward compatibility).

- bpo-25447: Copying the lru_cache() wrapper object now always works,
  independedly from the type of the wrapped object (by returning the
  original object unchanged).

- bpo-24103: Fixed possible use after free in ElementTree.XMLPullParser.

- bpo-25860: os.fwalk() no longer skips remaining directories when error
  occurs. Original patch by Samson Lee.

- bpo-25914: Fixed and simplified OrderedDict.__sizeof__.

- bpo-25902: Fixed various refcount issues in ElementTree iteration.

- bpo-25717: Restore the previous behaviour of tolerating most fstat()
  errors when opening files.  This was a regression in 3.5a1, and stopped
  anonymous temporary files from working in special cases.

- bpo-24903: Fix regression in number of arguments compileall accepts when
  '-d' is specified.  The check on the number of arguments has been dropped
  completely as it never worked correctly anyway.

- bpo-25764: In the subprocess module, preserve any exception caused by
  fork() failure when preexec_fn is used.

- bpo-6478: _strptime's regexp cache now is reset after changing timezone
  with time.tzset().

- bpo-14285: When executing a package with the "python -m package" option,
  and package initialization fails, a proper traceback is now reported.  The
  "runpy" module now lets exceptions from package initialization pass back
  to the caller, rather than raising ImportError.

- bpo-19771: Also in runpy and the "-m" option, omit the irrelevant message
  ". . . is a package and cannot be directly executed" if the package could
  not even be initialized (e.g. due to a bad ``*.pyc`` file).

- bpo-25177: Fixed problem with the mean of very small and very large
  numbers. As a side effect, statistics.mean and statistics.variance should
  be significantly faster.

- bpo-25718: Fixed copying object with state with boolean value is false.

- bpo-10131: Fixed deep copying of minidom documents.  Based on patch by
  Marian Ganisin.

- bpo-25725: Fixed a reference leak in pickle.loads() when unpickling
  invalid data including tuple instructions.

- bpo-25663: In the Readline completer, avoid listing duplicate global
  names, and search the global namespace before searching builtins.

- bpo-25688: Fixed file leak in ElementTree.iterparse() raising an error.

- bpo-23914: Fixed SystemError raised by unpickler on broken pickle data.

- bpo-25691: Fixed crash on deleting ElementTree.Element attributes.

- bpo-25624: ZipFile now always writes a ZIP_STORED header for directory
  entries.  Patch by Dingyuan Wang.

- Skip getaddrinfo if host is already resolved. Patch by A. Jesse Jiryu
  Davis.

- bpo-26050: Add asyncio.StreamReader.readuntil() method. Patch by Марк
  Коренберг.

- bpo-25924: Avoid unnecessary serialization of getaddrinfo(3) calls on OS X
  versions 10.5 or higher.  Original patch by A. Jesse Jiryu Davis.

- bpo-26406: Avoid unnecessary serialization of getaddrinfo(3) calls on
  current versions of OpenBSD and NetBSD.  Patch by A. Jesse Jiryu Davis.

- bpo-26848: Fix asyncio/subprocess.communicate() to handle empty input.
  Patch by Jack O'Connor.

- bpo-27040: Add loop.get_exception_handler method

- bpo-27041: asyncio: Add loop.create_future method

- bpo-27223: asyncio: Fix _read_ready and _write_ready to respect
  _conn_lost. Patch by Łukasz Langa.

- bpo-22970: asyncio: Fix inconsistency cancelling Condition.wait. Patch by
  David Coles.

IDLE
----

- bpo-5124: Paste with text selected now replaces the selection on X11. This
  matches how paste works on Windows, Mac, most modern Linux apps, and ttk
  widgets. Original patch by Serhiy Storchaka.

- bpo-24759: Make clear in idlelib.idle_test.__init__ that the directory is
  a private implementation of test.test_idle and tool for maintainers.

- bpo-27196: Stop 'ThemeChanged' warnings when running IDLE tests. These
  persisted after other warnings were suppressed in #20567. Apply Serhiy
  Storchaka's update_idletasks solution to four test files. Record this
  additional advice in idle_test/README.txt

- bpo-20567: Revise idle_test/README.txt with advice about avoiding tk
  warning messages from tests.  Apply advice to several IDLE tests.

- bpo-27117: Make colorizer htest and turtledemo work with dark themes. Move
  code for configuring text widget colors to a new function.

- bpo-26673: When tk reports font size as 0, change to size 10. Such fonts
  on Linux prevented the configuration dialog from opening.

- bpo-21939: Add test for IDLE's percolator. Original patch by Saimadhav
  Heblikar.

- bpo-21676: Add test for IDLE's replace dialog. Original patch by Saimadhav
  Heblikar.

- bpo-18410: Add test for IDLE's search dialog. Original patch by Westley
  Martínez.

- bpo-21703: Add test for IDLE's undo delegator. Original patch by Saimadhav
  Heblikar .

- bpo-27044: Add ConfigDialog.remove_var_callbacks to stop memory leaks.

- bpo-23977: Add more asserts to test_delegator.

- bpo-20640: Add tests for idlelib.configHelpSourceEdit. Patch by Saimadhav
  Heblikar.

- In the 'IDLE-console differences' section of the IDLE doc, clarify how
  running with IDLE affects sys.modules and the standard streams.

- bpo-25507: fix incorrect change in IOBinding that prevented printing.
  Augment IOBinding htest to include all major IOBinding functions.

- bpo-25905: Revert unwanted conversion of ' to ’ RIGHT SINGLE QUOTATION
  MARK in README.txt and open this and NEWS.txt with 'ascii'. Re-encode
  CREDITS.txt to utf-8 and open it with 'utf-8'.

Documentation
-------------

- bpo-19489: Moved the search box from the sidebar to the header and footer
  of each page. Patch by Ammar Askar.

- bpo-24136: Document the new PEP 448 unpacking syntax of 3.5.

- bpo-26736: Used HTTPS for external links in the documentation if possible.

- bpo-6953: Rework the Readline module documentation to group related
  functions together, and add more details such as what underlying Readline
  functions and variables are accessed.

- bpo-23606: Adds note to ctypes documentation regarding cdll.msvcrt.

- bpo-25500: Fix documentation to not claim that __import__ is searched for
  in the global scope.

- bpo-26014: Update 3.x packaging documentation: * "See also" links to the
  new docs are now provided in the legacy pages * links to setuptools
  documentation have been updated

Tests
-----

- bpo-21916: Added tests for the turtle module.  Patch by ingrid, Gregory
  Loyse and Jelle Zijlstra.

- bpo-26523: The multiprocessing thread pool (multiprocessing.dummy.Pool)
  was untested.

- bpo-26015: Added new tests for pickling iterators of mutable sequences.

- bpo-26325: Added test.support.check_no_resource_warning() to check that no
  ResourceWarning is emitted.

- bpo-25940: Changed test_ssl to use self-signed.pythontest.net.  This
  avoids relying on svn.python.org, which recently changed root certificate.

- bpo-25616: Tests for OrderedDict are extracted from test_collections into
  separate file test_ordered_dict.

- bpo-26583: Skip test_timestamp_overflow in test_import if bytecode files
  cannot be written.

Build
-----

- bpo-26884: Fix linking extension modules for cross builds. Patch by Xavier
  de Gaye.

- bpo-22359: Disable the rules for running _freeze_importlib and pgen when
  cross- compiling.  The output of these programs is normally saved with the
  source code anyway, and is still regenerated when doing a native build.
  Patch by Xavier de Gaye.

- bpo-27229: Fix the cross-compiling pgen rule for in-tree builds.  Patch by
  Xavier de Gaye.

- bpo-21668: Link audioop, _datetime, _ctypes_test modules to libm, except
  on Mac OS X. Patch written by Xavier de Gaye.

- bpo-25702: A --with-lto configure option has been added that will enable
  link time optimizations at build time during a make profile-opt. Some
  compilers and toolchains are known to not produce stable code when using
  LTO, be sure to test things thoroughly before relying on it. It can
  provide a few % speed up over profile-opt alone.

- bpo-26624: Adds validation of ucrtbase[d].dll version with warning for old
  versions.

- bpo-17603: Avoid error about nonexistant fileblocks.o file by using a
  lower-level check for st_blocks in struct stat.

- bpo-26079: Fixing the build output folder for tix-8.4.3.6. Patch by Bjoern
  Thiel.

- bpo-26465: Update Windows builds to use OpenSSL 1.0.2g.

- bpo-24421: Compile Modules/_math.c once, before building extensions.
  Previously it could fail to compile properly if the math and cmath builds
  were concurrent.

- bpo-25348: Added ``--pgo`` and ``--pgo-job`` arguments to
  ``PCbuild\build.bat`` for building with Profile-Guided Optimization.  The
  old ``PCbuild\build_pgo.bat`` script is now deprecated, and simply calls
  ``PCbuild\build.bat --pgo %*``.

- bpo-25827: Add support for building with ICC to ``configure``, including a
  new ``--with-icc`` flag.

- bpo-25696: Fix installation of Python on UNIX with make -j9.

- bpo-26930: Update OS X 10.5+ 32-bit-only installer to build and link with
  OpenSSL 1.0.2h.

- bpo-26268: Update Windows builds to use OpenSSL 1.0.2f.

- bpo-25136: Support Apple Xcode 7's new textual SDK stub libraries.

- bpo-24324: Do not enable unreachable code warnings when using gcc as the
  option does not work correctly in older versions of gcc and has been
  silently removed as of gcc-4.5.

Windows
-------

- bpo-27053: Updates make_zip.py to correctly generate library ZIP file.

- bpo-26268: Update the prepare_ssl.py script to handle OpenSSL releases
  that don't include the contents of the include directory (that is, 1.0.2e
  and later).

- bpo-26071: bdist_wininst created binaries fail to start and find 32bit
  Python

- bpo-26073: Update the list of magic numbers in launcher

- bpo-26065: Excludes venv from library when generating embeddable distro.

Tools/Demos
-----------

- bpo-26799: Fix python-gdb.py: don't get C types once when the Python code
  is loaded, but get C types on demand. The C types can change if python-
  gdb.py is loaded before the Python executable. Patch written by Thomas
  Ilsche.

- bpo-26271: Fix the Freeze tool to properly use flags passed through
  configure. Patch by Daniel Shaulov.

- bpo-26489: Add dictionary unpacking support to Tools/parser/unparse.py.
  Patch by Guo Ci Teo.

- bpo-26316: Fix variable name typo in Argument Clinic.

Windows
-------

- bpo-17500: Remove unused and outdated icons. (See also:
  https://github.com/python/pythondotorg/issues/945)


What's New in Python 3.5.1 final?
=================================

*Release date: 2015-12-06*

Core and Builtins
-----------------

- bpo-25709: Fixed problem with in-place string concatenation and utf-8
  cache.

Windows
-------

- bpo-25715: Python 3.5.1 installer shows wrong upgrade path and incorrect
  logic for launcher detection.


What's New in Python 3.5.1 release candidate 1?
===============================================

*Release date: 2015-11-22*

Core and Builtins
-----------------

- bpo-25630: Fix a possible segfault during argument parsing in functions
  that accept filesystem paths.

- bpo-23564: Fixed a partially broken sanity check in the _posixsubprocess
  internals regarding how fds_to_pass were passed to the child.  The bug had
  no actual impact as subprocess.py already avoided it.

- bpo-25388: Fixed tokenizer crash when processing undecodable source code
  with a null byte.

- bpo-25462: The hash of the key now is calculated only once in most
  operations in C implementation of OrderedDict.

- bpo-22995: Default implementation of __reduce__ and __reduce_ex__ now
  rejects builtin types with not defined __new__.

- bpo-25555: Fix parser and AST: fill lineno and col_offset of "arg" node
  when compiling AST from Python objects.

- bpo-24802: Avoid buffer overreads when int(), float(), compile(), exec()
  and eval() are passed bytes-like objects.  These objects are not
  necessarily terminated by a null byte, but the functions assumed they
  were.

- bpo-24726: Fixed a crash and leaking NULL in repr() of OrderedDict that
  was mutated by direct calls of dict methods.

- bpo-25449: Iterating OrderedDict with keys with unstable hash now raises
  KeyError in C implementations as well as in Python implementation.

- bpo-25395: Fixed crash when highly nested OrderedDict structures were
  garbage collected.

- bpo-25274: sys.setrecursionlimit() now raises a RecursionError if the new
  recursion limit is too low depending at the current recursion depth.
  Modify also the "lower-water mark" formula to make it monotonic. This mark
  is used to decide when the overflowed flag of the thread state is reset.

- bpo-24402: Fix input() to prompt to the redirected stdout when
  sys.stdout.fileno() fails.

- bpo-24806: Prevent builtin types that are not allowed to be subclassed
  from being subclassed through multiple inheritance.

- bpo-24848: Fixed a number of bugs in UTF-7 decoding of misformed data.

- bpo-25280: Import trace messages emitted in verbose (-v) mode are no
  longer formatted twice.

- bpo-25003: On Solaris 11.3 or newer, os.urandom() now uses the getrandom()
  function instead of the getentropy() function. The getentropy() function
  is blocking to generate very good quality entropy, os.urandom() doesn't
  need such high- quality entropy.

- bpo-25182: The stdprinter (used as sys.stderr before the io module is
  imported at startup) now uses the backslashreplace error handler.

- bpo-25131: Make the line number and column offset of set/dict literals and
  comprehensions correspond to the opening brace.

- bpo-25150: Hide the private _Py_atomic_xxx symbols from the public
  Python.h header to fix a compilation error with OpenMP.
  PyThreadState_GET() becomes an alias to PyThreadState_Get() to avoid ABI
  incompatibilies.

Library
-------

- bpo-25626: Change three zlib functions to accept sizes that fit in
  Py_ssize_t, but internally cap those sizes to UINT_MAX.  This resolves a
  regression in 3.5 where GzipFile.read() failed to read chunks larger than
  2 or 4 GiB.  The change affects the zlib.Decompress.decompress()
  max_length parameter, the zlib.decompress() bufsize parameter, and the
  zlib.Decompress.flush() length parameter.

- bpo-25583: Avoid incorrect errors raised by os.makedirs(exist_ok=True)
  when the OS gives priority to errors such as EACCES over EEXIST.

- bpo-25593: Change semantics of EventLoop.stop() in asyncio.

- bpo-6973: When we know a subprocess.Popen process has died, do not allow
  the send_signal(), terminate(), or kill() methods to do anything as they
  could potentially signal a different process.

- bpo-25590: In the Readline completer, only call getattr() once per
  attribute.

- bpo-25498: Fix a crash when garbage-collecting ctypes objects created by
  wrapping a memoryview.  This was a regression made in 3.5a1.  Based on
  patch by Eryksun.

- bpo-25584: Added "escape" to the __all__ list in the glob module.

- bpo-25584: Fixed recursive glob() with patterns starting with ``**``.

- bpo-25446: Fix regression in smtplib's AUTH LOGIN support.

- bpo-18010: Fix the pydoc web server's module search function to handle
  exceptions from importing packages.

- bpo-25554: Got rid of circular references in regular expression parsing.

- bpo-25510: fileinput.FileInput.readline() now returns b'' instead of '' at
  the end if the FileInput was opened with binary mode. Patch by Ryosuke
  Ito.

- bpo-25503: Fixed inspect.getdoc() for inherited docstrings of properties.
  Original patch by John Mark Vandenberg.

- bpo-25515: Always use os.urandom as a source of randomness in uuid.uuid4.

- bpo-21827: Fixed textwrap.dedent() for the case when largest common
  whitespace is a substring of smallest leading whitespace. Based on patch
  by Robert Li.

- bpo-25447: The lru_cache() wrapper objects now can be copied and pickled
  (by returning the original object unchanged).

- bpo-25390: typing: Don't crash on Union[str, Pattern].

- bpo-25441: asyncio: Raise error from drain() when socket is closed.

- bpo-25410: Cleaned up and fixed minor bugs in C implementation of
  OrderedDict.

- bpo-25411: Improved Unicode support in SMTPHandler through better use of
  the email package. Thanks to user simon04 for the patch.

- bpo-25407: Remove mentions of the formatter module being removed in Python
  3.6.

- bpo-25406: Fixed a bug in C implementation of OrderedDict.move_to_end()
  that caused segmentation fault or hang in iterating after moving several
  items to the start of ordered dict.

- bpo-25364: zipfile now works in threads disabled builds.

- bpo-25328: smtpd's SMTPChannel now correctly raises a ValueError if both
  decode_data and enable_SMTPUTF8 are set to true.

- bpo-25316: distutils raises OSError instead of DistutilsPlatformError when
  MSVC is not installed.

- bpo-25380: Fixed protocol for the STACK_GLOBAL opcode in
  pickletools.opcodes.

- bpo-23972: Updates asyncio datagram create method allowing reuseport and
  reuseaddr socket options to be set prior to binding the socket. Mirroring
  the existing asyncio create_server method the reuseaddr option for
  datagram sockets defaults to True if the O/S is 'posix' (except if the
  platform is Cygwin). Patch by Chris Laws.

- bpo-25304: Add asyncio.run_coroutine_threadsafe().  This lets you submit a
  coroutine to a loop from another thread, returning a
  concurrent.futures.Future.  By Vincent Michel.

- bpo-25232: Fix CGIRequestHandler to split the query from the URL at the
  first question mark (?) rather than the last. Patch from Xiang Zhang.

- bpo-24657: Prevent CGIRequestHandler from collapsing slashes in the query
  part of the URL as if it were a path. Patch from Xiang Zhang.

- bpo-24483: C implementation of functools.lru_cache() now calculates key's
  hash only once.

- bpo-22958: Constructor and update method of weakref.WeakValueDictionary
  now accept the self and the dict keyword arguments.

- bpo-22609: Constructor of collections.UserDict now accepts the self
  keyword argument.

- bpo-25111: Fixed comparison of traceback.FrameSummary.

- bpo-25262: Added support for BINBYTES8 opcode in Python implementation of
  unpickler. Highest 32 bits of 64-bit size for BINUNICODE8 and BINBYTES8
  opcodes no longer silently ignored on 32-bit platforms in C
  implementation.

- bpo-25034: Fix string.Formatter problem with auto-numbering and nested
  format_specs. Patch by Anthon van der Neut.

- bpo-25233: Rewrite the guts of asyncio.Queue and asyncio.Semaphore to be
  more understandable and correct.

- bpo-25203: Failed readline.set_completer_delims() no longer left the
  module in inconsistent state.

- bpo-23600: Default implementation of tzinfo.fromutc() was returning wrong
  results in some cases.

- bpo-23329: Allow the ssl module to be built with older versions of
  LibreSSL.

- Prevent overflow in _Unpickler_Read.

- bpo-25047: The XML encoding declaration written by Element Tree now
  respects the letter case given by the user. This restores the ability to
  write encoding names in uppercase like "UTF-8", which worked in Python 2.

- bpo-25135: Make deque_clear() safer by emptying the deque before clearing.
  This helps avoid possible reentrancy issues.

- bpo-19143: platform module now reads Windows version from kernel32.dll to
  avoid compatibility shims.

- bpo-25092: Fix datetime.strftime() failure when errno was already set to
  EINVAL.

- bpo-23517: Fix rounding in fromtimestamp() and utcfromtimestamp() methods
  of datetime.datetime: microseconds are now rounded to nearest with ties
  going to nearest even integer (ROUND_HALF_EVEN), instead of being rounding
  towards minus infinity (ROUND_FLOOR). It's important that these methods
  use the same rounding mode than datetime.timedelta to keep the property:
  (datetime(1970,1,1) + timedelta(seconds=t)) ==
  datetime.utcfromtimestamp(t). It also the rounding mode used by
  round(float) for example.

- bpo-25155: Fix datetime.datetime.now() and datetime.datetime.utcnow() on
  Windows to support date after year 2038. It was a regression introduced in
  Python 3.5.0.

- bpo-25108: Omitted internal frames in traceback functions print_stack(),
  format_stack(), and extract_stack() called without arguments.

- bpo-25118: Fix a regression of Python 3.5.0 in os.waitpid() on Windows.

- bpo-24684: socket.socket.getaddrinfo() now calls
  PyUnicode_AsEncodedString() instead of calling the encode() method of the
  host, to handle correctly custom string with an encode() method which
  doesn't return a byte string. The encoder of the IDNA codec is now called
  directly instead of calling the encode() method of the string.

- bpo-25060: Correctly compute stack usage of the BUILD_MAP opcode.

- bpo-24857: Comparing call_args to a long sequence now correctly returns a
  boolean result instead of raising an exception.  Patch by A Kaptur.

- bpo-23144: Make sure that HTMLParser.feed() returns all the data, even
  when convert_charrefs is True.

- bpo-24982: shutil.make_archive() with the "zip" format now adds entries
  for directories (including empty directories) in ZIP file.

- bpo-25019: Fixed a crash caused by setting non-string key of expat parser.
  Based on patch by John Leitch.

- bpo-16180: Exit pdb if file has syntax error, instead of trapping user in
  an infinite loop.  Patch by Xavier de Gaye.

- bpo-24891: Fix a race condition at Python startup if the file descriptor
  of stdin (0), stdout (1) or stderr (2) is closed while Python is creating
  sys.stdin, sys.stdout and sys.stderr objects. These attributes are now set
  to None if the creation of the object failed, instead of raising an
  OSError exception. Initial patch written by Marco Paolini.

- bpo-24992: Fix error handling and a race condition (related to garbage
  collection) in collections.OrderedDict constructor.

- bpo-24881: Fixed setting binary mode in Python implementation of FileIO on
  Windows and Cygwin.  Patch from Akira Li.

- bpo-25578: Fix (another) memory leak in SSLSocket.getpeercer().

- bpo-25530: Disable the vulnerable SSLv3 protocol by default when creating
  ssl.SSLContext.

- bpo-25569: Fix memory leak in SSLSocket.getpeercert().

- bpo-25471: Sockets returned from accept() shouldn't appear to be
  nonblocking.

- bpo-25319: When threading.Event is reinitialized, the underlying condition
  should use a regular lock rather than a recursive lock.

- bpo-21112: Fix regression in unittest.expectedFailure on subclasses. Patch
  from Berker Peksag.

- bpo-24764: cgi.FieldStorage.read_multi() now ignores the Content-Length
  header in part headers. Patch written by Peter Landry and reviewed by
  Pierre Quentel.

- bpo-24913: Fix overrun error in deque.index(). Found by John Leitch and
  Bryce Darling.

- bpo-24774: Fix docstring in http.server.test. Patch from Chiu-Hsiang Hsu.

- bpo-21159: Improve message in
  configparser.InterpolationMissingOptionError. Patch from Łukasz Langa.

- bpo-20362: Honour TestCase.longMessage correctly in assertRegex. Patch
  from Ilia Kurenkov.

- bpo-23572: Fixed functools.singledispatch on classes with falsy
  metaclasses.  Patch by Ethan Furman.

- asyncio: ensure_future() now accepts awaitable objects.

IDLE
----

- bpo-15348: Stop the debugger engine (normally in a user process) before
  closing the debugger window (running in the IDLE process). This prevents
  the RuntimeErrors that were being caught and ignored.

- bpo-24455: Prevent IDLE from hanging when a) closing the shell while the
  debugger is active (15347); b) closing the debugger with the [X] button
  (15348); and c) activating the debugger when already active (24455). The
  patch by Mark Roseman does this by making two changes. 1. Suspend and
  resume the gui.interaction method with the tcl vwait mechanism intended
  for this purpose (instead of root.mainloop & .quit). 2. In gui.run, allow
  any existing interaction to terminate first.

- Change 'The program' to 'Your program' in an IDLE 'kill program?' message
  to make it clearer that the program referred to is the currently running
  user program, not IDLE itself.

- bpo-24750: Improve the appearance of the IDLE editor window status bar.
  Patch by Mark Roseman.

- bpo-25313: Change the handling of new built-in text color themes to better
  address the compatibility problem introduced by the addition of IDLE Dark.
  Consistently use the revised idleConf.CurrentTheme everywhere in idlelib.

- bpo-24782: Extension configuration is now a tab in the IDLE Preferences
  dialog rather than a separate dialog.  The former tabs are now a sorted
  list.  Patch by Mark Roseman.

- bpo-22726: Re-activate the config dialog help button with some content
  about the other buttons and the new IDLE Dark theme.

- bpo-24820: IDLE now has an 'IDLE Dark' built-in text color theme. It is
  more or less IDLE Classic inverted, with a cobalt blue background.
  Strings, comments, keywords, ... are still green, red, orange, ... . To
  use it with IDLEs released before November 2015, hit the 'Save as New
  Custom Theme' button and enter a new name, such as 'Custom Dark'.  The
  custom theme will work with any IDLE release, and can be modified.

- bpo-25224: README.txt is now an idlelib index for IDLE developers and
  curious users. The previous user content is now in the IDLE doc chapter.
  'IDLE' now means 'Integrated Development and Learning Environment'.

- bpo-24820: Users can now set breakpoint colors in Settings -> Custom
  Highlighting. Original patch by Mark Roseman.

- bpo-24972: Inactive selection background now matches active selection
  background, as configured by users, on all systems.  Found items are now
  always highlighted on Windows.  Initial patch by Mark Roseman.

- bpo-24570: Idle: make calltip and completion boxes appear on Macs affected
  by a tk regression.  Initial patch by Mark Roseman.

- bpo-24988: Idle ScrolledList context menus (used in debugger) now work on
  Mac Aqua. Patch by Mark Roseman.

- bpo-24801: Make right-click for context menu work on Mac Aqua. Patch by
  Mark Roseman.

- bpo-25173: Associate tkinter messageboxes with a specific widget. For Mac
  OSX, make them a 'sheet'.  Patch by Mark Roseman.

- bpo-25198: Enhance the initial html viewer now used for Idle Help. *
  Properly indent fixed-pitch text (patch by Mark Roseman). * Give code
  snippet a very Sphinx- like light blueish-gray background. * Re-use
  initial width and height set by users for shell and editor. * When the
  Table of Contents (TOC) menu is used, put the section header at the top of
  the screen.

- bpo-25225: Condense and rewrite Idle doc section on text colors.

- bpo-21995: Explain some differences between IDLE and console Python.

- bpo-22820: Explain need for *print* when running file from Idle editor.

- bpo-25224: Doc: augment Idle feature list and no-subprocess section.

- bpo-25219: Update doc for Idle command line options. Some were missing and
  notes were not correct.

- bpo-24861: Most of idlelib is private and subject to change. Use
  idleib.idle.* to start Idle. See idlelib.__init__.__doc__.

- bpo-25199: Idle: add synchronization comments for future maintainers.

- bpo-16893: Replace help.txt with help.html for Idle doc display. The new
  idlelib/help.html is rstripped Doc/build/html/library/idle.html. It looks
  better than help.txt and will better document Idle as released. The
  tkinter html viewer that works for this file was written by Mark Roseman.
  The now unused EditorWindow.HelpDialog class and helt.txt file are
  deprecated.

- bpo-24199: Deprecate unused idlelib.idlever with possible removal in 3.6.

- bpo-24790: Remove extraneous code (which also create 2 & 3 conflicts).

Documentation
-------------

- bpo-22558: Add remaining doc links to source code for Python-coded
  modules. Patch by Yoni Lavi.

- bpo-12067: Rewrite Comparisons section in the Expressions chapter of the
  language reference. Some of the details of comparing mixed types were
  incorrect or ambiguous. NotImplemented is only relevant at a lower level
  than the Expressions chapter. Added details of comparing range() objects,
  and default behaviour and consistency suggestions for user-defined
  classes. Patch from Andy Maier.

- bpo-24952: Clarify the default size argument of stack_size() in the
  "threading" and "_thread" modules. Patch from Mattip.

- bpo-23725: Overhaul tempfile docs. Note deprecated status of mktemp. Patch
  from Zbigniew Jędrzejewski-Szmek.

- bpo-24808: Update the types of some PyTypeObject fields.  Patch by Joseph
  Weston.

- bpo-22812: Fix unittest discovery examples. Patch from Pam McA'Nulty.

Tests
-----

- bpo-25449: Added tests for OrderedDict subclasses.

- bpo-25099: Make test_compileall not fail when an entry on sys.path cannot
  be written to (commonly seen in administrative installs on Windows).

- bpo-23919: Prevents assert dialogs appearing in the test suite.

- ``PCbuild\rt.bat`` now accepts an unlimited number of arguments to pass
  along to regrtest.py.  Previously there was a limit of 9.

Build
-----

- bpo-24915: Add LLVM support for PGO builds and use the test suite to
  generate the profile data. Initial patch by Alecsandru Patrascu of Intel.

- bpo-24910: Windows MSIs now have unique display names.

- bpo-24986: It is now possible to build Python on Windows without errors
  when external libraries are not available.

Windows
-------

- bpo-25450: Updates shortcuts to start Python in installation directory.

- bpo-25164: Changes default all-users install directory to match per-user
  directory.

- bpo-25143: Improves installer error messages for unsupported platforms.

- bpo-25163: Display correct directory in installer when using non-default
  settings.

- bpo-25361: Disables use of SSE2 instructions in Windows 32-bit build

- bpo-25089: Adds logging to installer for case where launcher is not
  selected on upgrade.

- bpo-25165: Windows uninstallation should not remove launcher if other
  versions remain

- bpo-25112: py.exe launcher is missing icons

- bpo-25102: Windows installer does not precompile for -O or -OO.

- bpo-25081: Makes Back button in installer go back to upgrade page when
  upgrading.

- bpo-25091: Increases font size of the installer.

- bpo-25126: Clarifies that the non-web installer will download some
  components.

- bpo-25213: Restores requestedExecutionLevel to manifest to disable UAC
  virtualization.

- bpo-25022: Removed very outdated PC/example_nt/ directory.

Tools/Demos
-----------

- bpo-25440: Fix output of python-config --extension-suffix.


What's New in Python 3.5.0 final?
=================================

*Release date: 2015-09-13*

Build
-----

- bpo-25071: Windows installer should not require TargetDir parameter when
  installing quietly.


What's New in Python 3.5.0 release candidate 4?
===============================================

*Release date: 2015-09-09*

Library
-------

- bpo-25029: Fixes MemoryError in test_strptime.

Build
-----

- bpo-25027: Reverts partial-static build options and adds vcruntime140.dll
  to Windows installation.


What's New in Python 3.5.0 release candidate 3?
===============================================

*Release date: 2015-09-07*

Core and Builtins
-----------------

- bpo-24305: Prevent import subsystem stack frames from being counted by the
  warnings.warn(stacklevel=) parameter.

- bpo-24912: Prevent __class__ assignment to immutable built-in objects.

- bpo-24975: Fix AST compilation for PEP 448 syntax.

Library
-------

- bpo-24917: time_strftime() buffer over-read.

- bpo-24748: To resolve a compatibility problem found with py2exe and
  pywin32, imp.load_dynamic() once again ignores previously loaded modules
  to support Python modules replacing themselves with extension modules.
  Patch by Petr Viktorin.

- bpo-24635: Fixed a bug in typing.py where isinstance([], typing.Iterable)
  would return True once, then False on subsequent calls.

- bpo-24989: Fixed buffer overread in BytesIO.readline() if a position is
  set beyond size.  Based on patch by John Leitch.

- bpo-24913: Fix overrun error in deque.index(). Found by John Leitch and
  Bryce Darling.


What's New in Python 3.5.0 release candidate 2?
===============================================

*Release date: 2015-08-25*

Core and Builtins
-----------------

- bpo-24769: Interpreter now starts properly when dynamic loading is
  disabled.  Patch by Petr Viktorin.

- bpo-21167: NAN operations are now handled correctly when python is
  compiled with ICC even if -fp-model strict is not specified.

- bpo-24492: A "package" lacking a __name__ attribute when trying to perform
  a ``from .. import ...`` statement will trigger an ImportError instead of
  an AttributeError.

Library
-------

- bpo-24847: Removes vcruntime140.dll dependency from Tcl/Tk.

- bpo-24839: platform._syscmd_ver raises DeprecationWarning

- bpo-24867: Fix Task.get_stack() for 'async def' coroutines


What's New in Python 3.5.0 release candidate 1?
===============================================

*Release date: 2015-08-09*

Core and Builtins
-----------------

- bpo-24667: Resize odict in all cases that the underlying dict resizes.

Library
-------

- bpo-24824: Signatures of codecs.encode() and codecs.decode() now are
  compatible with pydoc.

- bpo-24634: Importing uuid should not try to load libc on Windows

- bpo-24798: _msvccompiler.py doesn't properly support manifests

- bpo-4395: Better testing and documentation of binary operators. Patch by
  Martin Panter.

- bpo-23973: Update typing.py from GitHub repo.

- bpo-23004: mock_open() now reads binary data correctly when the type of
  read_data is bytes.  Initial patch by Aaron Hill.

- bpo-23888: Handle fractional time in cookie expiry. Patch by ssh.

- bpo-23652: Make it possible to compile the select module against the libc
  headers from the Linux Standard Base, which do not include some EPOLL
  macros.  Patch by Matt Frank.

- bpo-22932: Fix timezones in email.utils.formatdate. Patch from Dmitry
  Shachnev.

- bpo-23779: imaplib raises TypeError if authenticator tries to abort. Patch
  from Craig Holmquist.

- bpo-23319: Fix ctypes.BigEndianStructure, swap correctly bytes. Patch
  written by Matthieu Gautier.

- bpo-23254: Document how to close the TCPServer listening socket. Patch
  from Martin Panter.

- bpo-19450: Update Windows and OS X installer builds to use SQLite 3.8.11.

- bpo-17527: Add PATCH to wsgiref.validator. Patch from Luca Sbardella.

- bpo-24791: Fix grammar regression for call syntax: 'g(\*a or b)'.

IDLE
----

- bpo-23672: Allow Idle to edit and run files with astral chars in name.
  Patch by Mohd Sanad Zaki Rizvi.

- bpo-24745: Idle editor default font. Switch from Courier to platform-
  sensitive TkFixedFont.  This should not affect current customized font
  selections.  If there is a problem, edit $HOME/.idlerc/config-main.cfg and
  remove 'fontxxx' entries from [Editor Window].  Patch by Mark Roseman.

- bpo-21192: Idle editor. When a file is run, put its name in the restart
  bar. Do not print false prompts. Original patch by Adnan Umer.

- bpo-13884: Idle menus. Remove tearoff lines. Patch by Roger Serwy.

Documentation
-------------

- bpo-24129: Clarify the reference documentation for name resolution. This
  includes removing the assumption that readers will be familiar with the
  name resolution scheme Python used prior to the introduction of lexical
  scoping for function namespaces. Patch by Ivan Levkivskyi.

- bpo-20769: Improve reload() docs. Patch by Dorian Pula.

- bpo-23589: Remove duplicate sentence from the FAQ.  Patch by Yongzhi Pan.

- bpo-24729: Correct IO tutorial to match implementation regarding encoding
  parameter to open function.

Tests
-----

- bpo-24751: When running regrtest with the ``-w`` command line option, a
  test run is no longer marked as a failure if all tests succeed when re-
  run.


What's New in Python 3.5.0 beta 4?
==================================

*Release date: 2015-07-26*

Core and Builtins
-----------------

- bpo-23573: Restored optimization of bytes.rfind() and bytearray.rfind()
  for single-byte argument on Linux.

- bpo-24569: Make PEP 448 dictionary evaluation more consistent.

- bpo-24583: Fix crash when set is mutated while being updated.

- bpo-24407: Fix crash when dict is mutated while being updated.

- bpo-24619: New approach for tokenizing async/await. As a consequence, it
  is now possible to have one-line 'async def foo(): await ..' functions.

- bpo-24687: Plug refleak on SyntaxError in function parameters annotations.

- bpo-15944: memoryview: Allow arbitrary formats when casting to bytes.
  Patch by Martin Panter.

Library
-------

- bpo-23441: rcompleter now prints a tab character instead of displaying
  possible completions for an empty word.  Initial patch by Martin Sekera.

- bpo-24683: Fixed crashes in _json functions called with arguments of
  inappropriate type.

- bpo-21697: shutil.copytree() now correctly handles symbolic links that
  point to directories.  Patch by Eduardo Seabra and Thomas Kluyver.

- bpo-14373: Fixed segmentation fault when gc.collect() is called during
  constructing lru_cache (C implementation).

- bpo-24695: Fix a regression in traceback.print_exception().  If
  exc_traceback is None we shouldn't print a traceback header like described
  in the documentation.

- bpo-24620: Random.setstate() now validates the value of state last
  element.

- bpo-22485: Fixed an issue that caused `inspect.getsource` to return
  incorrect results on nested functions.

- bpo-22153: Improve unittest docs. Patch from Martin Panter and evilzero.

- bpo-24580: Symbolic group references to open group in re patterns now are
  explicitly forbidden as well as numeric group references.

- bpo-24206: Fixed __eq__ and __ne__ methods of inspect classes.

- bpo-24631: Fixed regression in the timeit module with multiline setup.

- bpo-18622: unittest.mock.mock_open().reset_mock would recurse infinitely.
  Patch from Nicola Palumbo and Laurent De Buyst.

- bpo-23661: unittest.mock side_effects can now be exceptions again. This
  was a regression vs Python 3.4. Patch from Ignacio Rossi

- bpo-24608: chunk.Chunk.read() now always returns bytes, not str.

- bpo-18684: Fixed reading out of the buffer in the re module.

- bpo-24259: tarfile now raises a ReadError if an archive is truncated
  inside a data segment.

- bpo-15014: SMTP.auth() and SMTP.login() now support RFC 4954's optional
  initial- response argument to the SMTP AUTH command.

- bpo-24669: Fix inspect.getsource() for 'async def' functions. Patch by Kai
  Groner.

- bpo-24688: ast.get_docstring() for 'async def' functions.

Build
-----

- bpo-24603: Update Windows builds and OS X 10.5 installer to use OpenSSL
  1.0.2d.


What's New in Python 3.5.0 beta 3?
==================================

*Release date: 2015-07-05*

Core and Builtins
-----------------

- bpo-24467: Fixed possible buffer over-read in bytearray. The bytearray
  object now always allocates place for trailing null byte and it's buffer
  now is always null-terminated.

- Upgrade to Unicode 8.0.0.

- bpo-24345: Add Py_tp_finalize slot for the stable ABI.

- bpo-24400: Introduce a distinct type for PEP 492 coroutines; add
  types.CoroutineType, inspect.getcoroutinestate,
  inspect.getcoroutinelocals; coroutines no longer use CO_GENERATOR flag;
  sys.set_coroutine_wrapper works only for 'async def' coroutines;
  inspect.iscoroutine no longer uses collections.abc.Coroutine, it's
  intended to test for pure 'async def' coroutines only; add new opcode:
  GET_YIELD_FROM_ITER; fix generators wrapper used in types.coroutine to be
  instance of collections.abc.Generator; collections.abc.Awaitable and
  collections.abc.Coroutine can no longer be used to detect generator-based
  coroutines--use inspect.isawaitable instead.

- bpo-24450: Add gi_yieldfrom to generators and cr_await to coroutines.
  Contributed by Benno Leslie and Yury Selivanov.

- bpo-19235: Add new RecursionError exception. Patch by Georg Brandl.

Library
-------

- bpo-21750: mock_open.read_data can now be read from each instance, as it
  could in Python 3.3.

- bpo-24552: Fix use after free in an error case of the _pickle module.

- bpo-24514: tarfile now tolerates number fields consisting of only
  whitespace.

- bpo-19176: Fixed doctype() related bugs in C implementation of
  ElementTree. A deprecation warning no longer issued by XMLParser subclass
  with default doctype() method.  Direct call of doctype() now issues a
  warning.  Parser's doctype() now is not called if target's doctype() is
  called.  Based on patch by Martin Panter.

- bpo-20387: Restore semantic round-trip correctness in tokenize/untokenize
  for tab- indented blocks.

- bpo-24456: Fixed possible buffer over-read in adpcm2lin() and lin2adpcm()
  functions of the audioop module.

- bpo-24336: The contextmanager decorator now works with functions with
  keyword arguments called "func" and "self".  Patch by Martin Panter.

- bpo-24522: Fix possible integer overflow in json accelerator module.

- bpo-24489: ensure a previously set C errno doesn't disturb cmath.polar().

- bpo-24408: Fixed AttributeError in measure() and metrics() methods of
  tkinter.Font.

- bpo-14373: C implementation of functools.lru_cache() now can be used with
  methods.

- bpo-24347: Set KeyError if PyDict_GetItemWithError returns NULL.

- bpo-24348: Drop superfluous incref/decref.

- bpo-24359: Check for changed OrderedDict size during iteration.

- bpo-24368: Support keyword arguments in OrderedDict methods.

- bpo-24362: Simplify the C OrderedDict fast nodes resize logic.

- bpo-24377: Fix a ref leak in OrderedDict.__repr__.

- bpo-24369: Defend against key-changes during iteration.

Tests
-----

- bpo-24373: _testmultiphase and xxlimited now use tp_traverse and
  tp_finalize to avoid reference leaks encountered when combining tp_dealloc
  with PyType_FromSpec (see issue #16690 for details)

Documentation
-------------

- bpo-24458: Update documentation to cover multi-phase initialization for
  extension modules (PEP 489). Patch by Petr Viktorin.

- bpo-24351: Clarify what is meant by "identifier" in the context of
  string.Template instances.

Build
-----

- bpo-24432: Update Windows builds and OS X 10.5 installer to use OpenSSL
  1.0.2c.


What's New in Python 3.5.0 beta 2?
==================================

*Release date: 2015-05-31*

Core and Builtins
-----------------

- bpo-24284: The startswith and endswith methods of the str class no longer
  return True when finding the empty string and the indexes are completely
  out of range.

- bpo-24115: Update uses of PyObject_IsTrue(), PyObject_Not(),
  PyObject_IsInstance(), PyObject_RichCompareBool() and _PyDict_Contains()
  to check for and handle errors correctly.

- bpo-24328: Fix importing one character extension modules.

- bpo-11205: In dictionary displays, evaluate the key before the value.

- bpo-24285: Fixed regression that prevented importing extension modules
  from inside packages. Patch by Petr Viktorin.

Library
-------

- bpo-23247: Fix a crash in the StreamWriter.reset() of CJK codecs.

- bpo-24270: Add math.isclose() and cmath.isclose() functions as per PEP
  485. Contributed by Chris Barker and Tal Einat.

- bpo-5633: Fixed timeit when the statement is a string and the setup is
  not.

- bpo-24326: Fixed audioop.ratecv() with non-default weightB argument.
  Original patch by David Moore.

- bpo-16991: Add a C implementation of OrderedDict.

- bpo-23934: Fix inspect.signature to fail correctly for builtin types
  lacking signature information.  Initial patch by James Powell.


What's New in Python 3.5.0 beta 1?
==================================

*Release date: 2015-05-24*

Core and Builtins
-----------------

- bpo-24276: Fixed optimization of property descriptor getter.

- bpo-24268: PEP 489: Multi-phase extension module initialization. Patch by
  Petr Viktorin.

- bpo-23955: Add pyvenv.cfg option to suppress registry/environment lookup
  for generating sys.path on Windows.

- bpo-24257: Fixed system error in the comparison of faked
  types.SimpleNamespace.

- bpo-22939: Fixed integer overflow in iterator object.  Patch by Clement
  Rouault.

- bpo-23985: Fix a possible buffer overrun when deleting a slice from the
  front of a bytearray and then appending some other bytes data.

- bpo-24102: Fixed exception type checking in standard error handlers.

- bpo-15027: The UTF-32 encoder is now 3x to 7x faster.

- bpo-23290: Optimize set_merge() for cases where the target is empty.
  (Contributed by Serhiy Storchaka.)

- bpo-2292: PEP 448: Additional Unpacking Generalizations.

- bpo-24096: Make warnings.warn_explicit more robust against mutation of the
  warnings.filters list.

- bpo-23996: Avoid a crash when a delegated generator raises an unnormalized
  StopIteration exception.  Patch by Stefan Behnel.

- bpo-23910: Optimize property() getter calls.  Patch by Joe Jevnik.

- bpo-23911: Move path-based importlib bootstrap code to a separate frozen
  module.

- bpo-24192: Fix namespace package imports.

- bpo-24022: Fix tokenizer crash when processing undecodable source code.

- bpo-9951: Added a hex() method to bytes, bytearray, and memoryview.

- bpo-22906: PEP 479: Change StopIteration handling inside generators.

- bpo-24017: PEP 492: Coroutines with async and await syntax.

Library
-------

- bpo-14373: Added C implementation of functools.lru_cache().  Based on
  patches by Matt Joiner and Alexey Kachayev.

- bpo-24230: The tempfile module now accepts bytes for prefix, suffix and
  dir parameters and returns bytes in such situations (matching the os
  module APIs).

- bpo-22189: collections.UserString now supports __getnewargs__(),
  __rmod__(), casefold(), format_map(), isprintable(), and maketrans().
  Patch by Joe Jevnik.

- bpo-24244: Prevents termination when an invalid format string is
  encountered on Windows in strftime.

- bpo-23973: PEP 484: Add the typing module.

- bpo-23086: The collections.abc.Sequence() abstract base class added
  *start* and *stop* parameters to the index() mixin. Patch by Devin
  Jeanpierre.

- bpo-20035: Replaced the ``tkinter._fix`` module used for setting up the
  Tcl/Tk environment on Windows with a private function in the ``_tkinter``
  module that makes no permanent changes to the environment.

- bpo-24257: Fixed segmentation fault in sqlite3.Row constructor with faked
  cursor type.

- bpo-15836: assertRaises(), assertRaisesRegex(), assertWarns() and
  assertWarnsRegex() assertments now check the type of the first argument to
  prevent possible user error.  Based on patch by Daniel Wagner-Hall.

- bpo-9858: Add missing method stubs to _io.RawIOBase.  Patch by Laura
  Rupprecht.

- bpo-22955: attrgetter, itemgetter and methodcaller objects in the operator
  module now support pickling.  Added readable and evaluable repr for these
  objects. Based on patch by Josh Rosenberg.

- bpo-22107: tempfile.gettempdir() and tempfile.mkdtemp() now try again when
  a directory with the chosen name already exists on Windows as well as on
  Unix. tempfile.mkstemp() now fails early if parent directory is not valid
  (not exists or is a file) on Windows.

- bpo-23780: Improved error message in os.path.join() with single argument.

- bpo-6598: Increased time precision and random number range in
  email.utils.make_msgid() to strengthen the uniqueness of the message ID.

- bpo-24091: Fixed various crashes in corner cases in C implementation of
  ElementTree.

- bpo-21931: msilib.FCICreate() now raises TypeError in the case of a bad
  argument instead of a ValueError with a bogus FCI error number. Patch by
  Jeffrey Armstrong.

- bpo-13866: *quote_via* argument added to urllib.parse.urlencode.

- bpo-20098: New mangle_from policy option for email, default True for
  compat32, but False for all other policies.

- bpo-24211: The email library now supports RFC 6532: it can generate
  headers using utf-8 instead of encoded words.

- bpo-16314: Added support for the LZMA compression in distutils.

- bpo-21804: poplib now supports RFC 6856 (UTF8).

- bpo-18682: Optimized pprint functions for builtin scalar types.

- bpo-22027: smtplib now supports RFC 6531 (SMTPUTF8).

- bpo-23488: Random generator objects now consume 2x less memory on 64-bit.

- bpo-1322: platform.dist() and platform.linux_distribution() functions are
  now deprecated.  Initial patch by Vajrasky Kok.

- bpo-22486: Added the math.gcd() function.  The fractions.gcd() function
  now is deprecated.  Based on patch by Mark Dickinson.

- bpo-24064: Property() docstrings are now writeable. (Patch by Berker
  Peksag.)

- bpo-22681: Added support for the koi8_t encoding.

- bpo-22682: Added support for the kz1048 encoding.

- bpo-23796: peek and read1 methods of BufferedReader now raise ValueError
  if they called on a closed object. Patch by John Hergenroeder.

- bpo-21795: smtpd now supports the 8BITMIME extension whenever the new
  *decode_data* constructor argument is set to False.

- bpo-24155: optimize heapq.heapify() for better cache performance when
  heapifying large lists.

- bpo-21800: imaplib now supports RFC 5161 (enable), RFC 6855
  (utf8/internationalized email) and automatically encodes non-ASCII
  usernames and passwords to UTF8.

- bpo-20274: When calling a _sqlite.Connection, it now complains if passed
  any keyword arguments.  Previously it silently ignored them.

- bpo-20274: Remove ignored and erroneous "kwargs" parameters from three
  METH_VARARGS methods on _sqlite.Connection.

- bpo-24134: assertRaises(), assertRaisesRegex(), assertWarns() and
  assertWarnsRegex() checks now emits a deprecation warning when callable is
  None or keyword arguments except msg is passed in the context manager
  mode.

- bpo-24018: Add a collections.abc.Generator abstract base class.
  Contributed by Stefan Behnel.

- bpo-23880: Tkinter's getint() and getdouble() now support Tcl_Obj.
  Tkinter's getdouble() now supports any numbers (in particular int).

- bpo-22619: Added negative limit support in the traceback module. Based on
  patch by Dmitry Kazakov.

- bpo-24094: Fix possible crash in json.encode with poorly behaved dict
  subclasses.

- bpo-9246: On POSIX, os.getcwd() now supports paths longer than 1025 bytes.
  Patch written by William Orr.

- bpo-17445: add difflib.diff_bytes() to support comparison of byte strings
  (fixes a regression from Python 2).

- bpo-23917: Fall back to sequential compilation when ProcessPoolExecutor
  doesn't exist. Patch by Claudiu Popa.

- bpo-23008: Fixed resolving attributes with boolean value is False in
  pydoc.

- Fix asyncio issue 235: LifoQueue and PriorityQueue's put didn't increment
  unfinished tasks (this bug was introduced when JoinableQueue was merged
  with Queue).

- bpo-23908: os functions now reject paths with embedded null character on
  Windows instead of silently truncating them.

- bpo-23728: binascii.crc_hqx() could return an integer outside of the range
  0-0xffff for empty data.

- bpo-23887: urllib.error.HTTPError now has a proper repr() representation.
  Patch by Berker Peksag.

- asyncio: New event loop APIs: set_task_factory() and get_task_factory().

- asyncio: async() function is deprecated in favour of ensure_future().

- bpo-24178: asyncio.Lock, Condition, Semaphore, and BoundedSemaphore
  support new 'async with' syntax.  Contributed by Yury Selivanov.

- bpo-24179: Support 'async for' for asyncio.StreamReader. Contributed by
  Yury Selivanov.

- bpo-24184: Add AsyncIterator and AsyncIterable ABCs to collections.abc.
  Contributed by Yury Selivanov.

- bpo-22547: Implement informative __repr__ for inspect.BoundArguments.
  Contributed by Yury Selivanov.

- bpo-24190: Implement inspect.BoundArgument.apply_defaults() method.
  Contributed by Yury Selivanov.

- bpo-20691: Add 'follow_wrapped' argument to
  inspect.Signature.from_callable() and inspect.signature(). Contributed by
  Yury Selivanov.

- bpo-24248: Deprecate inspect.Signature.from_function() and
  inspect.Signature.from_builtin().

- bpo-23898: Fix inspect.classify_class_attrs() to support attributes with
  overloaded __eq__ and __bool__.  Patch by Mike Bayer.

- bpo-24298: Fix inspect.signature() to correctly unwrap wrappers around
  bound methods.

IDLE
----

- bpo-23184: remove unused names and imports in idlelib. Initial patch by Al
  Sweigart.

Tests
-----

- bpo-21520: test_zipfile no longer fails if the word 'bad' appears anywhere
  in the name of the current directory.

- bpo-9517: Move script_helper into the support package. Patch by Christie
  Wilson.

Documentation
-------------

- bpo-22155: Add File Handlers subsection with createfilehandler to tkinter
  doc.  Remove obsolete example from FAQ.  Patch by Martin Panter.

- bpo-24029: Document the name binding behavior for submodule imports.

- bpo-24077: Fix typo in man page for -I command option: -s, not -S

Tools/Demos
-----------

- bpo-24000: Improved Argument Clinic's mapping of converters to legacy
  "format units". Updated the documentation to match.

- bpo-24001: Argument Clinic converters now use accept={type} instead of
  types={'type'} to specify the types the converter accepts.

- bpo-23330: h2py now supports arbitrary filenames in #include.

- bpo-24031: make patchcheck now supports git checkouts, too.


What's New in Python 3.5.0 alpha 4?
===================================

*Release date: 2015-04-19*

Core and Builtins
-----------------

- bpo-22980: Under Linux, GNU/KFreeBSD and the Hurd, C extensions now
  include the architecture triplet in the extension name, to make it easy to
  test builds for different ABIs in the same working tree.  Under OS X, the
  extension name now includes PEP 3149-style information.

- bpo-22631: Added Linux-specific socket constant CAN_RAW_FD_FRAMES. Patch
  courtesy of Joe Jevnik.

- bpo-23731: Implement PEP 488: removal of .pyo files.

- bpo-23726: Don't enable GC for user subclasses of non-GC types that don't
  add any new fields.  Patch by Eugene Toder.

- bpo-23309: Avoid a deadlock at shutdown if a daemon thread is aborted
  while it is holding a lock to a buffered I/O object, and the main thread
  tries to use the same I/O object (typically stdout or stderr).  A fatal
  error is emitted instead.

- bpo-22977: Fixed formatting Windows error messages on Wine. Patch by
  Martin Panter.

- bpo-23466: %c, %o, %x, and %X in bytes formatting now raise TypeError on
  non-integer input.

- bpo-24044: Fix possible null pointer dereference in list.sort in out of
  memory conditions.

- bpo-21354: PyCFunction_New function is exposed by python DLL again.

Library
-------

- bpo-23840: tokenize.open() now closes the temporary binary file on error
  to fix a resource warning.

- bpo-16914: new debuglevel 2 in smtplib adds timestamps to debug output.

- bpo-7159: urllib.request now supports sending auth credentials
  automatically after the first 401.  This enhancement is a superset of the
  enhancement from issue #19494 and supersedes that change.

- bpo-23703: Fix a regression in urljoin() introduced in 901e4e52b20a. Patch
  by Demian Brecht.

- bpo-4254: Adds _curses.update_lines_cols().  Patch by Arnon Yaari

- bpo-19933: Provide default argument for ndigits in round. Patch by
  Vajrasky Kok.

- bpo-23193: Add a numeric_owner parameter to tarfile.TarFile.extract and
  tarfile.TarFile.extractall. Patch by Michael Vogt and Eric Smith.

- bpo-23342: Add a subprocess.run() function than returns a CalledProcess
  instance for a more consistent API than the existing call* functions.

- bpo-21217: inspect.getsourcelines() now tries to compute the start and end
  lines from the code object, fixing an issue when a lambda function is used
  as decorator argument. Patch by Thomas Ballinger and Allison Kaptur.

- bpo-24521: Fix possible integer overflows in the pickle module.

- bpo-22931: Allow '[' and ']' in cookie values.

- The keywords attribute of functools.partial is now always a dictionary.

- bpo-23811: Add missing newline to the PyCompileError error message. Patch
  by Alex Shkop.

- bpo-21116: Avoid blowing memory when allocating a multiprocessing shared
  array that's larger than 50% of the available RAM.  Patch by Médéric
  Boquien.

- bpo-22982: Improve BOM handling when seeking to multiple positions of a
  writable text file.

- bpo-23464: Removed deprecated asyncio JoinableQueue.

- bpo-23529: Limit the size of decompressed data when reading from GzipFile,
  BZ2File or LZMAFile.  This defeats denial of service attacks using
  compressed bombs (i.e. compressed payloads which decompress to a huge
  size).  Patch by Martin Panter and Nikolaus Rath.

- bpo-21859: Added Python implementation of io.FileIO.

- bpo-23865: close() methods in multiple modules now are idempotent and more
  robust at shutdown. If they need to release multiple resources, all are
  released even if errors occur.

- bpo-23400: Raise same exception on both Python 2 and 3 if sem_open is not
  available. Patch by Davin Potts.

- bpo-10838: The subprocess now module includes SubprocessError and
  TimeoutError in its list of exported names for the users wild enough to
  use ``from subprocess import *``.

- bpo-23411: Added DefragResult, ParseResult, SplitResult,
  DefragResultBytes, ParseResultBytes, and SplitResultBytes to
  urllib.parse.__all__. Patch by Martin Panter.

- bpo-23881: urllib.request.ftpwrapper constructor now closes the socket if
  the FTP connection failed to fix a ResourceWarning.

- bpo-23853: :meth:`socket.socket.sendall` does no more reset the socket
  timeout each time data is sent successfully. The socket timeout is now the
  maximum total duration to send all data.

- bpo-22721: An order of multiline pprint output of set or dict containing
  orderable and non-orderable elements no longer depends on iteration order
  of set or dict.

- bpo-15133: _tkinter.tkapp.getboolean() now supports Tcl_Obj and always
  returns bool. tkinter.BooleanVar now validates input values (accepted
  bool, int, str, and Tcl_Obj).  tkinter.BooleanVar.get() now always returns
  bool.

- bpo-10590: xml.sax.parseString() now supports string argument.

- bpo-23338: Fixed formatting ctypes error messages on Cygwin. Patch by
  Makoto Kato.

- bpo-15582: inspect.getdoc() now follows inheritance chains.

- bpo-2175: SAX parsers now support a character stream of InputSource
  object.

- bpo-16840: Tkinter now supports 64-bit integers added in Tcl 8.4 and
  arbitrary precision integers added in Tcl 8.5.

- bpo-23834: Fix socket.sendto(), use the C Py_ssize_t type to store the
  result of sendto() instead of the C int type.

- bpo-23618: :meth:`socket.socket.connect` now waits until the connection
  completes instead of raising :exc:`InterruptedError` if the connection is
  interrupted by signals, signal handlers don't raise an exception and the
  socket is blocking or has a timeout. :meth:`socket.socket.connect` still
  raise :exc:`InterruptedError` for non-blocking sockets.

- bpo-21526: Tkinter now supports new boolean type in Tcl 8.5.

- bpo-23836: Fix the faulthandler module to handle reentrant calls to its
  signal handlers.

- bpo-23838: linecache now clears the cache and returns an empty result on
  MemoryError.

- bpo-10395: Added os.path.commonpath(). Implemented in posixpath and
  ntpath. Based on patch by Rafik Draoui.

- bpo-23611: Serializing more "lookupable" objects (such as unbound methods
  or nested classes) now are supported with pickle protocols < 4.

- bpo-13583: sqlite3.Row now supports slice indexing.

- bpo-18473: Fixed 2to3 and 3to2 compatible pickle mappings.  Fixed
  ambigious reverse mappings.  Added many new mappings.  Import mapping is
  no longer applied to modules already mapped with full name mapping.

- bpo-23485: select.select() is now retried automatically with the
  recomputed timeout when interrupted by a signal, except if the signal
  handler raises an exception. This change is part of the PEP 475.

- bpo-23752: When built from an existing file descriptor, io.FileIO() now
  only calls fstat() once. Before fstat() was called twice, which was not
  necessary.

- bpo-23704: collections.deque() objects now support __add__, __mul__, and
  __imul__().

- bpo-23171: csv.Writer.writerow() now supports arbitrary iterables.

- bpo-23745: The new email header parser now handles duplicate MIME
  parameter names without error, similar to how get_param behaves.

- bpo-22117: Fix os.utime(), it now rounds the timestamp towards minus
  infinity (-inf) instead of rounding towards zero.

- bpo-23310: Fix MagicMock's initializer to work with __methods__, just like
  configure_mock().  Patch by Kasia Jachim.

Build
-----

- bpo-23817: FreeBSD now uses "1.0" in the SOVERSION as other operating
  systems, instead of just "1".

- bpo-23501: Argument Clinic now generates code into separate files by
  default.

Tests
-----

- bpo-23799: Added test.support.start_threads() for running and cleaning up
  multiple threads.

- bpo-22390: test.regrtest now emits a warning if temporary files or
  directories are left after running a test.

Tools/Demos
-----------

- bpo-18128: pygettext now uses standard +NNNN format in the POT-Creation-
  Date header.

- bpo-23935: Argument Clinic's understanding of format units accepting
  bytes, bytearrays, and buffers is now consistent with both the
  documentation and the implementation.

- bpo-23944: Argument Clinic now wraps long impl prototypes at column 78.

- bpo-20586: Argument Clinic now ensures that functions without docstrings
  have signatures.

- bpo-23492: Argument Clinic now generates argument parsing code with
  PyArg_Parse instead of PyArg_ParseTuple if possible.

- bpo-23500: Argument Clinic is now smarter about generating the "#ifndef"
  (empty) definition of the methoddef macro: it's only generated once, even
  if Argument Clinic processes the same symbol multiple times, and it's
  emitted at the end of all processing rather than immediately after the
  first use.

C API
-----

- bpo-23998: PyImport_ReInitLock() now checks for lock allocation error


What's New in Python 3.5.0 alpha 3?
===================================

*Release date: 2015-03-28*

Core and Builtins
-----------------

- bpo-23573: Increased performance of string search operations (str.find,
  str.index, str.count, the in operator, str.split, str.partition) with
  arguments of different kinds (UCS1, UCS2, UCS4).

- bpo-23753: Python doesn't support anymore platforms without stat() or
  fstat(), these functions are always required.

- bpo-23681: The -b option now affects comparisons of bytes with int.

- bpo-23632: Memoryviews now allow tuple indexing (including for multi-
  dimensional memoryviews).

- bpo-23192: Fixed generator lambdas.  Patch by Bruno Cauet.

- bpo-23629: Fix the default __sizeof__ implementation for variable-sized
  objects.

Library
-------

- bpo-14260: The groupindex attribute of regular expression pattern object
  now is non- modifiable mapping.

- bpo-23792: Ignore KeyboardInterrupt when the pydoc pager is active. This
  mimics the behavior of the standard unix pagers, and prevents pipepager
  from shutting down while the pager itself is still running.

- bpo-23775: pprint() of OrderedDict now outputs the same representation as
  repr().

- bpo-23765: Removed IsBadStringPtr calls in ctypes

- bpo-22364: Improved some re error messages using regex for hints.

- bpo-23742: ntpath.expandvars() no longer loses unbalanced single quotes.

- bpo-21717: The zipfile.ZipFile.open function now supports 'x' (exclusive
  creation) mode.

- bpo-21802: The reader in BufferedRWPair now is closed even when closing
  writer failed in BufferedRWPair.close().

- bpo-23622: Unknown escapes in regular expressions that consist of ``'\'``
  and ASCII letter now raise a deprecation warning and will be forbidden in
  Python 3.6.

- bpo-23671: string.Template now allows specifying the "self" parameter as a
  keyword argument.  string.Formatter now allows specifying the "self" and
  the "format_string" parameters as keyword arguments.

- bpo-23502: The pprint module now supports mapping proxies.

- bpo-17530: pprint now wraps long bytes objects and bytearrays.

- bpo-22687: Fixed some corner cases in breaking words in tetxtwrap. Got rid
  of quadratic complexity in breaking long words.

- bpo-4727: The copy module now uses pickle protocol 4 (PEP 3154) and
  supports copying of instances of classes whose __new__ method takes
  keyword-only arguments.

- bpo-23491: Added a zipapp module to support creating executable zip file
  archives of Python code. Registered ".pyz" and ".pyzw" extensions on
  Windows for these archives (PEP 441).

- bpo-23657: Avoid explicit checks for str in zipapp, adding support for
  pathlib.Path objects as arguments.

- bpo-23688: Added support of arbitrary bytes-like objects and avoided
  unnecessary copying of memoryview in gzip.GzipFile.write(). Original patch
  by Wolfgang Maier.

- bpo-23252: Added support for writing ZIP files to unseekable streams.

- bpo-23647: Increase impalib's MAXLINE to accommodate modern mailbox sizes.

- bpo-23539: If body is None, http.client.HTTPConnection.request now sets
  Content-Length to 0 for PUT, POST, and PATCH headers to avoid 411 errors
  from some web servers.

- bpo-22351: The nntplib.NNTP constructor no longer leaves the connection
  and socket open until the garbage collector cleans them up.  Patch by
  Martin Panter.

- bpo-23704: collections.deque() objects now support methods for index(),
  insert(), and copy().  This allows deques to be registered as a
  MutableSequence and it improves their substitutability for lists.

- bpo-23715: :func:`signal.sigwaitinfo` and :func:`signal.sigtimedwait` are
  now retried when interrupted by a signal not in the *sigset* parameter, if
  the signal handler does not raise an exception. signal.sigtimedwait()
  recomputes the timeout with a monotonic clock when it is retried.

- bpo-23001: Few functions in modules mmap, ossaudiodev, socket, ssl, and
  codecs, that accepted only read-only bytes-like object now accept writable
  bytes-like object too.

- bpo-23646: If time.sleep() is interrupted by a signal, the sleep is now
  retried with the recomputed delay, except if the signal handler raises an
  exception (PEP 475).

- bpo-23136: _strptime now uniformly handles all days in week 0, including
  Dec 30 of previous year.  Based on patch by Jim Carroll.

- bpo-23700: Iterator of NamedTemporaryFile now keeps a reference to
  NamedTemporaryFile instance.  Patch by Bohuslav Kabrda.

- bpo-22903: The fake test case created by unittest.loader when it fails
  importing a test module is now picklable.

- bpo-22181: On Linux, os.urandom() now uses the new getrandom() syscall if
  available, syscall introduced in the Linux kernel 3.17. It is more
  reliable and more secure, because it avoids the need of a file descriptor
  and waits until the kernel has enough entropy.

- bpo-2211: Updated the implementation of the http.cookies.Morsel class.
  Setting attributes key, value and coded_value directly now is deprecated.
  update() and setdefault() now transform and check keys.  Comparing for
  equality now takes into account attributes key, value and coded_value.
  copy() now returns a Morsel, not a dict.  repr() now contains all
  attributes. Optimized checking keys and quoting values.  Added new tests.
  Original patch by Demian Brecht.

- bpo-18983: Allow selection of output units in timeit. Patch by Julian
  Gindi.

- bpo-23631: Fix traceback.format_list when a traceback has been mutated.

- bpo-23568: Add rdivmod support to MagicMock() objects. Patch by Håkan
  Lövdahl.

- bpo-2052: Add charset parameter to HtmlDiff.make_file().

- bpo-23668: Support os.truncate and os.ftruncate on Windows.

- bpo-23138: Fixed parsing cookies with absent keys or values in cookiejar.
  Patch by Demian Brecht.

- bpo-23051: multiprocessing.Pool methods imap() and imap_unordered() now
  handle exceptions raised by an iterator.  Patch by Alon Diamant and Davin
  Potts.

- bpo-23581: Add matmul support to MagicMock. Patch by Håkan Lövdahl.

- bpo-23566: enable(), register(), dump_traceback() and
  dump_traceback_later() functions of faulthandler now accept file
  descriptors. Patch by Wei Wu.

- bpo-22928: Disabled HTTP header injections in http.client. Original patch
  by Demian Brecht.

- bpo-23615: Modules bz2, tarfile and tokenize now can be reloaded with
  imp.reload(). Patch by Thomas Kluyver.

- bpo-23605: os.walk() now calls os.scandir() instead of os.listdir(). The
  usage of os.scandir() reduces the number of calls to os.stat(). Initial
  patch written by Ben Hoyt.

Build
-----

- bpo-23585: make patchcheck will ensure the interpreter is built.

Tests
-----

- bpo-23583: Added tests for standard IO streams in IDLE.

- bpo-22289: Prevent test_urllib2net failures due to ftp connection timeout.

Tools/Demos
-----------

- bpo-22826: The result of open() in Tools/freeze/bkfile.py is now better
  compatible with regular files (in particular it now supports the context
  management protocol).


What's New in Python 3.5.0 alpha 2?
===================================

*Release date: 2015-03-09*

Core and Builtins
-----------------

- bpo-23571: PyObject_Call() and PyCFunction_Call() now raise a SystemError
  if a function returns a result and raises an exception. The SystemError is
  chained to the previous exception.

Library
-------

- bpo-22524: New os.scandir() function, part of the PEP 471: "os.scandir()
  function -- a better and faster directory iterator". Patch written by Ben
  Hoyt.

- bpo-23103: Reduced the memory consumption of IPv4Address and IPv6Address.

- bpo-21793: BaseHTTPRequestHandler again logs response code as numeric, not
  as stringified enum.  Patch by Demian Brecht.

- bpo-23476: In the ssl module, enable OpenSSL's X509_V_FLAG_TRUSTED_FIRST
  flag on certificate stores when it is available.

- bpo-23576: Avoid stalling in SSL reads when EOF has been reached in the
  SSL layer but the underlying connection hasn't been closed.

- bpo-23504: Added an __all__ to the types module.

- bpo-23563: Optimized utility functions in urllib.parse.

- bpo-7830: Flatten nested functools.partial.

- bpo-20204: Added the __module__ attribute to _tkinter classes.

- bpo-19980: Improved help() for non-recognized strings.  help('') now shows
  the help on str.  help('help') now shows the help on help(). Original
  patch by Mark Lawrence.

- bpo-23521: Corrected pure python implementation of timedelta division.

  Eliminated OverflowError from ``timedelta * float`` for some floats;
  Corrected rounding in timedlta true division.

- bpo-21619: Popen objects no longer leave a zombie after exit in the with
  statement if the pipe was broken.  Patch by Martin Panter.

- bpo-22936: Make it possible to show local variables in tracebacks for both
  the traceback module and unittest.

- bpo-15955: Add an option to limit the output size in bz2.decompress().
  Patch by Nikolaus Rath.

- bpo-6639: Module-level turtle functions no longer raise TclError after
  closing the window.

- bpo-814253: Group references and conditional group references now work in
  lookbehind assertions in regular expressions. (See also: bpo-9179)

- bpo-23215: Multibyte codecs with custom error handlers that ignores errors
  consumed too much memory and raised SystemError or MemoryError. Original
  patch by Aleksi Torhamo.

- bpo-5700: io.FileIO() called flush() after closing the file. flush() was
  not called in close() if closefd=False.

- bpo-23374: Fixed pydoc failure with non-ASCII files when stdout encoding
  differs from file system encoding (e.g. on Mac OS).

- bpo-23481: Remove RC4 from the SSL module's default cipher list.

- bpo-21548: Fix pydoc.synopsis() and pydoc.apropos() on modules with empty
  docstrings.

- bpo-22885: Fixed arbitrary code execution vulnerability in the dbm.dumb
  module. Original patch by Claudiu Popa.

- bpo-23239: ssl.match_hostname() now supports matching of IP addresses.

- bpo-23146: Fix mishandling of absolute Windows paths with forward slashes
  in pathlib.

- bpo-23096: Pickle representation of floats with protocol 0 now is the same
  for both Python and C implementations.

- bpo-19105: pprint now more efficiently uses free space at the right.

- bpo-14910: Add allow_abbrev parameter to argparse.ArgumentParser. Patch by
  Jonathan Paugh, Steven Bethard, paul j3 and Daniel Eriksson.

- bpo-21717: tarfile.open() now supports 'x' (exclusive creation) mode.

- bpo-23344: marshal.dumps() is now 20-25% faster on average.

- bpo-20416: marshal.dumps() with protocols 3 and 4 is now 40-50% faster on
  average.

- bpo-23421: Fixed compression in tarfile CLI.  Patch by wdv4758h.

- bpo-23367: Fix possible overflows in the unicodedata module.

- bpo-23361: Fix possible overflow in Windows subprocess creation code.

- logging.handlers.QueueListener now takes a respect_handler_level keyword
  argument which, if set to True, will pass messages to handlers taking
  handler levels into account.

- bpo-19705: turtledemo now has a visual sorting algorithm demo.  Original
  patch from Jason Yeo.

- bpo-23801: Fix issue where cgi.FieldStorage did not always ignore the
  entire preamble to a multipart body.

Build
-----

- bpo-23445: pydebug builds now use "gcc -Og" where possible, to make the
  resulting executable faster.

- bpo-23686: Update OS X 10.5 installer build to use OpenSSL 1.0.2a.

C API
-----

- bpo-20204: Deprecation warning is now raised for builtin types without the
  __module__ attribute.

Windows
-------

- bpo-23465: Implement PEP 486 - Make the Python Launcher aware of virtual
  environments. Patch by Paul Moore.

- bpo-23437: Make user scripts directory versioned on Windows. Patch by Paul
  Moore.


What's New in Python 3.5.0 alpha 1?
===================================

*Release date: 2015-02-08*

Core and Builtins
-----------------

- bpo-23285: PEP 475 - EINTR handling.

- bpo-22735: Fix many edge cases (including crashes) involving custom mro()
  implementations.

- bpo-22896: Avoid using PyObject_AsCharBuffer(), PyObject_AsReadBuffer()
  and PyObject_AsWriteBuffer().

- bpo-21295: Revert some changes (issue #16795) to AST line numbers and
  column offsets that constituted a regression.

- bpo-22986: Allow changing an object's __class__ between a dynamic type and
  static type in some cases.

- bpo-15859: PyUnicode_EncodeFSDefault(), PyUnicode_EncodeMBCS() and
  PyUnicode_EncodeCodePage() now raise an exception if the object is not a
  Unicode object. For PyUnicode_EncodeFSDefault(), it was already the case
  on platforms other than Windows. Patch written by Campbell Barton.

- bpo-21408: The default __ne__() now returns NotImplemented if __eq__()
  returned NotImplemented.  Original patch by Martin Panter.

- bpo-23321: Fixed a crash in str.decode() when error handler returned
  replacment string longer than mailformed input data.

- bpo-22286: The "backslashreplace" error handlers now works with decoding
  and translating.

- bpo-23253: Delay-load ShellExecute[AW] in os.startfile for reduced startup
  overhead on Windows.

- bpo-22038: pyatomic.h now uses stdatomic.h or GCC built-in functions for
  atomic memory access if available. Patch written by Vitor de Lima and
  Gustavo Temple.

- bpo-20284: %-interpolation (aka printf) formatting added for bytes and
  bytearray.

- bpo-23048: Fix jumping out of an infinite while loop in the pdb.

- bpo-20335: bytes constructor now raises TypeError when encoding or errors
  is specified with non-string argument.  Based on patch by Renaud Blanch.

- bpo-22834: If the current working directory ends up being set to a non-
  existent directory then import will no longer raise FileNotFoundError.

- bpo-22869: Move the interpreter startup & shutdown code to a new dedicated
  pylifecycle.c module

- bpo-22847: Improve method cache efficiency.

- bpo-22335: Fix crash when trying to enlarge a bytearray to 0x7fffffff
  bytes on a 32-bit platform.

- bpo-22653: Fix an assertion failure in debug mode when doing a reentrant
  dict insertion in debug mode.

- bpo-22643: Fix integer overflow in Unicode case operations (upper, lower,
  title, swapcase, casefold).

- bpo-17636: Circular imports involving relative imports are now supported.

- bpo-22604: Fix assertion error in debug mode when dividing a complex
  number by (nan+0j).

- bpo-21052: Do not raise ImportWarning when sys.path_hooks or sys.meta_path
  are set to None.

- bpo-16518: Use 'bytes-like object required' in error messages that
  previously used the far more cryptic "'x' does not support the buffer
  protocol.

- bpo-22470: Fixed integer overflow issues in "backslashreplace",
  "xmlcharrefreplace", and "surrogatepass" error handlers.

- bpo-22540: speed up `PyObject_IsInstance` and `PyObject_IsSubclass` in the
  common case that the second argument has metaclass `type`.

- bpo-18711: Add a new `PyErr_FormatV` function, similar to `PyErr_Format`
  but accepting a `va_list` argument.

- bpo-22520: Fix overflow checking when generating the repr of a unicode
  object.

- bpo-22519: Fix overflow checking in PyBytes_Repr.

- bpo-22518: Fix integer overflow issues in latin-1 encoding.

- bpo-16324: _charset parameter of MIMEText now also accepts
  email.charset.Charset instances. Initial patch by Claude Paroz.

- bpo-1764286: Fix inspect.getsource() to support decorated functions. Patch
  by Claudiu Popa.

- bpo-18554: os.__all__ includes posix functions.

- bpo-21391: Use os.path.abspath in the shutil module.

- bpo-11471: avoid generating a JUMP_FORWARD instruction at the end of an
  if-block if there is no else-clause.  Original patch by Eugene Toder.

- bpo-22215: Now ValueError is raised instead of TypeError when str or bytes
  argument contains not permitted null character or byte.

- bpo-22258: Fix the internal function set_inheritable() on Illumos. This
  platform exposes the function ``ioctl(FIOCLEX)``, but calling it fails
  with errno is ENOTTY: "Inappropriate ioctl for device". set_inheritable()
  now falls back to the slower ``fcntl()`` (``F_GETFD`` and then
  ``F_SETFD``).

- bpo-21389: Displaying the __qualname__ of the underlying function in the
  repr of a bound method.

- bpo-22206: Using pthread, PyThread_create_key() now sets errno to ENOMEM
  and returns -1 (error) on integer overflow.

- bpo-20184: Argument Clinic based signature introspection added for 30 of
  the builtin functions.

- bpo-22116: C functions and methods (of the 'builtin_function_or_method'
  type) can now be weakref'ed.  Patch by Wei Wu.

- bpo-22077: Improve index error messages for bytearrays, bytes, lists, and
  tuples by adding 'or slices'. Added ', not <typename>' for bytearrays.
  Original patch by Claudiu Popa.

- bpo-20179: Apply Argument Clinic to bytes and bytearray. Patch by Tal
  Einat.

- bpo-22082: Clear interned strings in slotdefs.

- Upgrade Unicode database to Unicode 7.0.0.

- bpo-21897: Fix a crash with the f_locals attribute with closure variables
  when frame.clear() has been called.

- bpo-21205: Add a new ``__qualname__`` attribute to generator, the
  qualified name, and use it in the representation of a generator
  (``repr(gen)``). The default name of the generator (``__name__``
  attribute) is now get from the function instead of the code. Use
  ``gen.gi_code.co_name`` to get the name of the code.

- bpo-21669: With the aid of heuristics in SyntaxError.__init__, the parser
  now attempts to generate more meaningful (or at least more search engine
  friendly) error messages when "exec" and "print" are used as statements.

- bpo-21642: In the conditional if-else expression, allow an integer written
  with no space between itself and the ``else`` keyword (e.g. ``True if
  42else False``) to be valid syntax.

- bpo-21523: Fix over-pessimistic computation of the stack effect of some
  opcodes in the compiler.  This also fixes a quadratic compilation time
  issue noticeable when compiling code with a large number of "and" and "or"
  operators.

- bpo-21418: Fix a crash in the builtin function super() when called without
  argument and without current frame (ex: embedded Python).

- bpo-21425: Fix flushing of standard streams in the interactive
  interpreter.

- bpo-21435: In rare cases, when running finalizers on objects in cyclic
  trash a bad pointer dereference could occur due to a subtle flaw in
  internal iteration logic.

- bpo-21377: PyBytes_Concat() now tries to concatenate in-place when the
  first argument has a reference count of 1.  Patch by Nikolaus Rath.

- bpo-20355: -W command line options now have higher priority than the
  PYTHONWARNINGS environment variable.  Patch by Arfrever.

- bpo-21274: Define PATH_MAX for GNU/Hurd in Python/pythonrun.c.

- bpo-20904: Support setting FPU precision on m68k.

- bpo-21209: Fix sending tuples to custom generator objects with the yield
  from syntax.

- bpo-21193: pow(a, b, c) now raises ValueError rather than TypeError when b
  is negative. Patch by Josh Rosenberg.

- bpo-21176: PEP 465: Add the '@' operator for matrix multiplication.

- bpo-21134: Fix segfault when str is called on an uninitialized
  UnicodeEncodeError, UnicodeDecodeError, or UnicodeTranslateError object.

- bpo-19537: Fix PyUnicode_DATA() alignment under m68k.  Patch by Andreas
  Schwab.

- bpo-20929: Add a type cast to avoid shifting a negative number.

- bpo-20731: Properly position in source code files even if they are opened
  in text mode. Patch by Serhiy Storchaka.

- bpo-20637: Key-sharing now also works for instance dictionaries of
  subclasses.  Patch by Peter Ingebretson.

- bpo-8297: Attributes missing from modules now include the module name in
  the error text.  Original patch by ysj.ray.

- bpo-19995: %c, %o, %x, and %X now raise TypeError on non-integer input.

- bpo-19655: The ASDL parser - used by the build process to generate code
  for managing the Python AST in C - was rewritten. The new parser is self
  contained and does not require to carry long the spark.py parser-generator
  library; spark.py was removed from the source base.

- bpo-12546: Allow ``\x00`` to be used as a fill character when using str,
  int, float, and complex __format__ methods.

- bpo-20480: Add ipaddress.reverse_pointer. Patch by Leon Weber.

- bpo-13598: Modify string.Formatter to support auto-numbering of
  replacement fields. It now matches the behavior of str.format() in this
  regard. Patches by Phil Elson and Ramchandra Apte.

- bpo-8931: Make alternate formatting ('#') for type 'c' raise an exception.
  In versions prior to 3.5, '#' with 'c' had no effect. Now specifying it is
  an error. Patch by Torsten Landschoff.

- bpo-23165: Perform overflow checks before allocating memory in the
  _Py_char2wchar function.

Library
-------

- bpo-23399: pyvenv creates relative symlinks where possible.

- bpo-20289: cgi.FieldStorage() now supports the context management
  protocol.

- bpo-13128: Print response headers for CONNECT requests when debuglevel >
  0. Patch by Demian Brecht.

- bpo-15381: Optimized io.BytesIO to make less allocations and copyings.

- bpo-22818: Splitting on a pattern that could match an empty string now
  raises a warning.  Patterns that can only match empty strings are now
  rejected.

- bpo-23099: Closing io.BytesIO with exported buffer is rejected now to
  prevent corrupting exported buffer.

- bpo-23326: Removed __ne__ implementations.  Since fixing default __ne__
  implementation in issue #21408 they are redundant.

- bpo-23363: Fix possible overflow in itertools.permutations.

- bpo-23364: Fix possible overflow in itertools.product.

- bpo-23366: Fixed possible integer overflow in itertools.combinations.

- bpo-23369: Fixed possible integer overflow in
  _json.encode_basestring_ascii.

- bpo-23353: Fix the exception handling of generators in
  PyEval_EvalFrameEx(). At entry, save or swap the exception state even if
  PyEval_EvalFrameEx() is called with throwflag=0. At exit, the exception
  state is now always restored or swapped, not only if why is WHY_YIELD or
  WHY_RETURN. Patch co-written with Antoine Pitrou.

- bpo-14099: Restored support of writing ZIP files to tellable but non-
  seekable streams.

- bpo-14099: Writing to ZipFile and reading multiple ZipExtFiles is
  threadsafe now.

- bpo-19361: JSON decoder now raises JSONDecodeError instead of ValueError.

- bpo-18518: timeit now rejects statements which can't be compiled outside a
  function or a loop (e.g. "return" or "break").

- bpo-23094: Fixed readline with frames in Python implementation of pickle.

- bpo-23268: Fixed bugs in the comparison of ipaddress classes.

- bpo-21408: Removed incorrect implementations of __ne__() which didn't
  returned NotImplemented if __eq__() returned NotImplemented.  The default
  __ne__() now works correctly.

- bpo-19996: :class:`email.feedparser.FeedParser` now handles (malformed)
  headers with no key rather than assuming the body has started.

- bpo-20188: Support Application-Layer Protocol Negotiation (ALPN) in the
  ssl module.

- bpo-23133: Pickling of ipaddress objects now produces more compact and
  portable representation.

- bpo-23248: Update ssl error codes from latest OpenSSL git master.

- bpo-23266: Much faster implementation of ipaddress.collapse_addresses()
  when there are many non-consecutive addresses.

- bpo-23098: 64-bit dev_t is now supported in the os module.

- bpo-21817: When an exception is raised in a task submitted to a
  ProcessPoolExecutor, the remote traceback is now displayed in the parent
  process.  Patch by Claudiu Popa.

- bpo-15955: Add an option to limit output size when decompressing LZMA
  data.  Patch by Nikolaus Rath and Martin Panter.

- bpo-23250: In the http.cookies module, capitalize "HttpOnly" and "Secure"
  as they are written in the standard.

- bpo-23063: In the disutils' check command, fix parsing of reST with code
  or code-block directives.

- bpo-23209: selectors.BaseSelector.get_key() now raises a RuntimeError if
  the selector is closed. And selectors.BaseSelector.close() now clears its
  internal reference to the selector mapping to break a reference cycle.
  Initial patch written by Martin Richard. (See also: bpo-23225)

- bpo-17911: Provide a way to seed the linecache for a PEP-302 module
  without actually loading the code.

- bpo-17911: Provide a new object API for traceback, including the ability
  to not lookup lines at all until the traceback is actually rendered,
  without any trace of the original objects being kept alive.

- bpo-19777: Provide a home() classmethod on Path objects.  Contributed by
  Victor Salgado and Mayank Tripathi.

- bpo-23206: Make ``json.dumps(..., ensure_ascii=False)`` as fast as the
  default case of ``ensure_ascii=True``.  Patch by Naoki Inada.

- bpo-23185: Add math.inf and math.nan constants.

- bpo-23186: Add ssl.SSLObject.shared_ciphers() and
  ssl.SSLSocket.shared_ciphers() to fetch the client's list ciphers sent at
  handshake.

- bpo-23143: Remove compatibility with OpenSSLs older than 0.9.8.

- bpo-23132: Improve performance and introspection support of comparison
  methods created by functool.total_ordering.

- bpo-19776: Add an expanduser() method on Path objects.

- bpo-23112: Fix SimpleHTTPServer to correctly carry the query string and
  fragment when it redirects to add a trailing slash.

- bpo-21793: Added http.HTTPStatus enums (i.e. HTTPStatus.OK,
  HTTPStatus.NOT_FOUND). Patch by Demian Brecht.

- bpo-23093: In the io, module allow more operations to work on detached
  streams.

- bpo-23111: In the ftplib, make ssl.PROTOCOL_SSLv23 the default protocol
  version.

- bpo-22585: On OpenBSD 5.6 and newer, os.urandom() now calls getentropy(),
  instead of reading /dev/urandom, to get pseudo-random bytes.

- bpo-19104: pprint now produces evaluable output for wrapped strings.

- bpo-23071: Added missing names to codecs.__all__.  Patch by Martin Panter.

- bpo-22783: Pickling now uses the NEWOBJ opcode instead of the NEWOBJ_EX
  opcode if possible.

- bpo-15513: Added a __sizeof__ implementation for pickle classes.

- bpo-19858: pickletools.optimize() now aware of the MEMOIZE opcode, can
  produce more compact result and no longer produces invalid output if input
  data contains MEMOIZE opcodes together with PUT or BINPUT opcodes.

- bpo-22095: Fixed HTTPConnection.set_tunnel with default port.  The port
  value in the host header was set to "None".  Patch by Demian Brecht.

- bpo-23016: A warning no longer produces an AttributeError when the program
  is run with pythonw.exe.

- bpo-21775: shutil.copytree(): fix crash when copying to VFAT. An exception
  handler assumed that OSError objects always have a 'winerror' attribute.
  That is not the case, so the exception handler itself raised
  AttributeError when run on Linux (and, presumably, any other non-Windows
  OS). Patch by Greg Ward.

- bpo-1218234: Fix inspect.getsource() to load updated source of reloaded
  module. Initial patch by Berker Peksag.

- bpo-21740: Support wrapped callables in doctest. Patch by Claudiu Popa.

- bpo-23009: Make sure selectors.EpollSelecrtor.select() works when no FD is
  registered.

- bpo-22959: In the constructor of http.client.HTTPSConnection, prefer the
  context's check_hostname attribute over the *check_hostname* parameter.

- bpo-22696: Add function :func:`sys.is_finalizing` to know about
  interpreter shutdown.

- bpo-16043: Add a default limit for the amount of data
  xmlrpclib.gzip_decode will return. This resolves CVE-2013-1753.

- bpo-14099: ZipFile.open() no longer reopen the underlying file.  Objects
  returned by ZipFile.open() can now operate independently of the ZipFile
  even if the ZipFile was created by passing in a file-like object as the
  first argument to the constructor.

- bpo-22966: Fix __pycache__ pyc file name clobber when pyc_compile is asked
  to compile a source file containing multiple dots in the source file name.

- bpo-21971: Update turtledemo doc and add module to the index.

- bpo-21032: Fixed socket leak if HTTPConnection.getresponse() fails.
  Original patch by Martin Panter.

- bpo-22407: Deprecated the use of re.LOCALE flag with str patterns or
  re.ASCII. It was newer worked.

- bpo-22902: The "ip" command is now used on Linux to determine MAC address
  in uuid.getnode().  Pach by Bruno Cauet.

- bpo-22960: Add a context argument to xmlrpclib.ServerProxy constructor.

- bpo-22389: Add contextlib.redirect_stderr().

- bpo-21356: Make ssl.RAND_egd() optional to support LibreSSL. The
  availability of the function is checked during the compilation. Patch
  written by Bernard Spil.

- bpo-22915: SAX parser now supports files opened with file descriptor or
  bytes path.

- bpo-22609: Constructors and update methods of mapping classes in the
  collections module now accept the self keyword argument.

- bpo-22940: Add readline.append_history_file.

- bpo-19676: Added the "namereplace" error handler.

- bpo-22788: Add *context* parameter to logging.handlers.HTTPHandler.

- bpo-22921: Allow SSLContext to take the *hostname* parameter even if
  OpenSSL doesn't support SNI.

- bpo-22894: TestCase.subTest() would cause the test suite to be stopped
  when in failfast mode, even in the absence of failures.

- bpo-22796: HTTP cookie parsing is now stricter, in order to protect
  against potential injection attacks.

- bpo-22370: Windows detection in pathlib is now more robust.

- bpo-22841: Reject coroutines in asyncio add_signal_handler(). Patch by
  Ludovic.Gasc.

- bpo-19494: Added urllib.request.HTTPBasicPriorAuthHandler. Patch by Matej
  Cepl.

- bpo-22578: Added attributes to the re.error class.

- bpo-22849: Fix possible double free in the io.TextIOWrapper constructor.

- bpo-12728: Different Unicode characters having the same uppercase but
  different lowercase are now matched in case-insensitive regular
  expressions.

- bpo-22821: Fixed fcntl() with integer argument on 64-bit big-endian
  platforms.

- bpo-21650: Add an `--sort-keys` option to json.tool CLI.

- bpo-22824: Updated reprlib output format for sets to use set literals.
  Patch contributed by Berker Peksag.

- bpo-22824: Updated reprlib output format for arrays to display empty
  arrays without an unnecessary empty list.  Suggested by Serhiy Storchaka.

- bpo-22406: Fixed the uu_codec codec incorrectly ported to 3.x. Based on
  patch by Martin Panter.

- bpo-17293: uuid.getnode() now determines MAC address on AIX using netstat.
  Based on patch by Aivars Kalvāns.

- bpo-22769: Fixed ttk.Treeview.tag_has() when called without arguments.

- bpo-22417: Verify certificates by default in httplib (PEP 476).

- bpo-22775: Fixed unpickling of http.cookies.SimpleCookie with protocol 2
  and above. Patch by Tim Graham.

- bpo-22776: Brought excluded code into the scope of a try block in
  SysLogHandler.emit().

- bpo-22665: Add missing get_terminal_size and SameFileError to
  shutil.__all__.

- bpo-6623: Remove deprecated Netrc class in the ftplib module. Patch by
  Matt Chaput.

- bpo-17381: Fixed handling of case-insensitive ranges in regular
  expressions.

- bpo-22410: Module level functions in the re module now cache compiled
  locale-dependent regular expressions taking into account the locale.

- bpo-22759: Query methods on pathlib.Path() (exists(), is_dir(), etc.) now
  return False when the underlying stat call raises NotADirectoryError.

- bpo-8876: distutils now falls back to copying files when hard linking
  doesn't work. This allows use with special filesystems such as VirtualBox
  shared folders.

- bpo-22217: Implemented reprs of classes in the zipfile module.

- bpo-22457: Honour load_tests in the start_dir of discovery.

- bpo-18216: gettext now raises an error when a .mo file has an unsupported
  major version number.  Patch by Aaron Hill.

- bpo-13918: Provide a locale.delocalize() function which can remove locale-
  specific number formatting from a string representing a number, without
  then converting it to a specific type.  Patch by Cédric Krier.

- bpo-22676: Make the pickling of global objects which don't have a
  __module__ attribute less slow.

- bpo-18853: Fixed ResourceWarning in shlex.__nain__.

- bpo-9351: Defaults set with set_defaults on an argparse subparser are no
  longer ignored when also set on the parent parser.

- bpo-7559: unittest test loading ImportErrors are reported as import errors
  with their import exception rather than as attribute errors after the
  import has already failed.

- bpo-19746: Make it possible to examine the errors from unittest discovery
  without executing the test suite. The new `errors` attribute on TestLoader
  exposes these non-fatal errors encountered during discovery.

- bpo-21991: Make email.headerregistry's header 'params' attributes be read-
  only (MappingProxyType).  Previously the dictionary was modifiable but a
  new one was created on each access of the attribute.

- bpo-22638: SSLv3 is now disabled throughout the standard library. It can
  still be enabled by instantiating a SSLContext manually.

- bpo-22641: In asyncio, the default SSL context for client connections is
  now created using ssl.create_default_context(), for stronger security.

- bpo-17401: Include closefd in io.FileIO repr.

- bpo-21338: Add silent mode for compileall. quiet parameters of
  compile_{dir, file, path} functions now have a multilevel value. Also, -q
  option of the CLI now have a multilevel value. Patch by Thomas Kluyver.

- bpo-20152: Convert the array and cmath modules to Argument Clinic.

- bpo-18643: Add socket.socketpair() on Windows.

- bpo-22435: Fix a file descriptor leak when socketserver bind fails.

- bpo-13096: Fixed segfault in CTypes POINTER handling of large values.

- bpo-11694: Raise ConversionError in xdrlib as documented.  Patch by Filip
  Gruszczyński and Claudiu Popa.

- bpo-19380: Optimized parsing of regular expressions.

- bpo-1519638: Now unmatched groups are replaced with empty strings in
  re.sub() and re.subn().

- bpo-18615: sndhdr.what/whathdr now return a namedtuple.

- bpo-22462: Fix pyexpat's creation of a dummy frame to make it appear in
  exception tracebacks.

- bpo-21965: Add support for in-memory SSL to the ssl module.  Patch by
  Geert Jansen.

- bpo-21173: Fix len() on a WeakKeyDictionary when .clear() was called with
  an iterator alive.

- bpo-11866: Eliminated race condition in the computation of names for new
  threads.

- bpo-21905: Avoid RuntimeError in pickle.whichmodule() when sys.modules is
  mutated while iterating.  Patch by Olivier Grisel.

- bpo-11271: concurrent.futures.Executor.map() now takes a *chunksize*
  argument to allow batching of tasks in child processes and improve
  performance of ProcessPoolExecutor.  Patch by Dan O'Reilly.

- bpo-21883: os.path.join() and os.path.relpath() now raise a TypeError with
  more helpful error message for unsupported or mismatched types of
  arguments.

- bpo-22219: The zipfile module CLI now adds entries for directories
  (including empty directories) in ZIP file.

- bpo-22449: In the ssl.SSLContext.load_default_certs, consult the
  environmental variables SSL_CERT_DIR and SSL_CERT_FILE on Windows.

- bpo-22508: The email.__version__ variable has been removed; the email code
  is no longer shipped separately from the stdlib, and __version__ hasn't
  been updated in several releases.

- bpo-20076: Added non derived UTF-8 aliases to locale aliases table.

- bpo-20079: Added locales supported in glibc 2.18 to locale alias table.

- bpo-20218: Added convenience methods read_text/write_text and read_bytes/
  write_bytes to pathlib.Path objects.

- bpo-22396: On 32-bit AIX platform, don't expose os.posix_fadvise() nor
  os.posix_fallocate() because their prototypes in system headers are wrong.

- bpo-22517: When an io.BufferedRWPair object is deallocated, clear its
  weakrefs.

- bpo-22437: Number of capturing groups in regular expression is no longer
  limited by 100.

- bpo-17442: InteractiveInterpreter now displays the full chained traceback
  in its showtraceback method, to match the built in interactive
  interpreter.

- bpo-23392: Added tests for marshal C API that works with FILE*.

- bpo-10510: distutils register and upload methods now use HTML standards
  compliant CRLF line endings.

- bpo-9850: Fixed macpath.join() for empty first component.  Patch by Oleg
  Oshmyan.

- bpo-5309: distutils' build and build_ext commands now accept a ``-j``
  option to enable parallel building of extension modules.

- bpo-22448: Improve canceled timer handles cleanup to prevent unbound
  memory usage. Patch by Joshua Moore-Oliva.

- bpo-22427: TemporaryDirectory no longer attempts to clean up twice when
  used in the with statement in generator.

- bpo-22362: Forbidden ambiguous octal escapes out of range 0-0o377 in
  regular expressions.

- bpo-20912: Now directories added to ZIP file have correct Unix and MS-DOS
  directory attributes.

- bpo-21866: ZipFile.close() no longer writes ZIP64 central directory
  records if allowZip64 is false.

- bpo-22278: Fix urljoin problem with relative urls, a regression observed
  after changes to issue22118 were submitted.

- bpo-22415: Fixed debugging output of the GROUPREF_EXISTS opcode in the re
  module. Removed trailing spaces in debugging output.

- bpo-22423: Unhandled exception in thread no longer causes unhandled
  AttributeError when sys.stderr is None.

- bpo-21332: Ensure that ``bufsize=1`` in subprocess.Popen() selects line
  buffering, rather than block buffering.  Patch by Akira Li.

- bpo-21091: Fix API bug: email.message.EmailMessage.is_attachment is now a
  method.

- bpo-21079: Fix email.message.EmailMessage.is_attachment to return the
  correct result when the header has parameters as well as a value.

- bpo-22247: Add NNTPError to nntplib.__all__.

- bpo-22366: urllib.request.urlopen will accept a context object
  (SSLContext) as an argument which will then be used for HTTPS connection.
  Patch by Alex Gaynor.

- bpo-4180: The warnings registries are now reset when the filters are
  modified.

- bpo-22419: Limit the length of incoming HTTP request in wsgiref server to
  65536 bytes and send a 414 error code for higher lengths. Patch
  contributed by Devin Cook.

- Lax cookie parsing in http.cookies could be a security issue when combined
  with non-standard cookie handling in some Web browsers.  Reported by
  Sergey Bobrov.

- bpo-20537: logging methods now accept an exception instance as well as a
  Boolean value or exception tuple. Thanks to Yury Selivanov for the patch.

- bpo-22384: An exception in Tkinter callback no longer crashes the program
  when it is run with pythonw.exe.

- bpo-22168: Prevent turtle AttributeError with non-default Canvas on OS X.

- bpo-21147: sqlite3 now raises an exception if the request contains a null
  character instead of truncating it.  Based on patch by Victor Stinner.

- bpo-13968: The glob module now supports recursive search in subdirectories
  using the ``**`` pattern.

- bpo-21951: Fixed a crash in Tkinter on AIX when called Tcl command with
  empty string or tuple argument.

- bpo-21951: Tkinter now most likely raises MemoryError instead of crash if
  the memory allocation fails.

- bpo-22338: Fix a crash in the json module on memory allocation failure.

- bpo-12410: imaplib.IMAP4 now supports the context management protocol.
  Original patch by Tarek Ziadé.

- bpo-21270: We now override tuple methods in mock.call objects so that they
  can be used as normal call attributes.

- bpo-16662: load_tests() is now unconditionally run when it is present in a
  package's __init__.py.  TestLoader.loadTestsFromModule() still accepts
  use_load_tests, but it is deprecated and ignored.  A new keyword-only
  attribute `pattern` is added and documented.  Patch given by Robert
  Collins, tweaked by Barry Warsaw.

- bpo-22226: First letter no longer is stripped from the "status" key in the
  result of Treeview.heading().

- bpo-19524: Fixed resource leak in the HTTP connection when an invalid
  response is received.  Patch by Martin Panter.

- bpo-20421: Add a .version() method to SSL sockets exposing the actual
  protocol version in use.

- bpo-19546: configparser exceptions no longer expose implementation
  details. Chained KeyErrors are removed, which leads to cleaner tracebacks.
  Patch by Claudiu Popa.

- bpo-22051: turtledemo no longer reloads examples to re-run them.
  Initialization of variables and gui setup should be done in main(), which
  is called each time a demo is run, but not on import.

- bpo-21933: Turtledemo users can change the code font size with a menu
  selection or control(command) '-' or '+' or control-mousewheel. Original
  patch by Lita Cho.

- bpo-21597: The separator between the turtledemo text pane and the drawing
  canvas can now be grabbed and dragged with a mouse.  The code text pane
  can be widened to easily view or copy the full width of the text.  The
  canvas can be widened on small screens.  Original patches by Jan Kanis and
  Lita Cho.

- bpo-18132: Turtledemo buttons no longer disappear when the window is
  shrunk.  Original patches by Jan Kanis and Lita Cho.

- bpo-22043: time.monotonic() is now always available.
  ``threading.Lock.acquire()``, ``threading.RLock.acquire()`` and socket
  operations now use a monotonic clock, instead of the system clock, when a
  timeout is used.

- bpo-21527: Add a default number of workers to ThreadPoolExecutor equal to
  5 times the number of CPUs.  Patch by Claudiu Popa.

- bpo-22216: smtplib now resets its state more completely after a quit.  The
  most obvious consequence of the previous behavior was a STARTTLS failure
  during a connect/starttls/quit/connect/starttls sequence.

- bpo-22098: ctypes' BigEndianStructure and LittleEndianStructure now define
  an empty __slots__ so that subclasses don't always get an instance dict.
  Patch by Claudiu Popa.

- bpo-22185: Fix an occasional RuntimeError in threading.Condition.wait()
  caused by mutation of the waiters queue without holding the lock.  Patch
  by Doug Zongker.

- bpo-22287: On UNIX, _PyTime_gettimeofday() now uses
  clock_gettime(CLOCK_REALTIME) if available. As a side effect, Python now
  depends on the librt library on Solaris and on Linux (only with glibc
  older than 2.17).

- bpo-22182: Use e.args to unpack exceptions correctly in
  distutils.file_util.move_file. Patch by Claudiu Popa.

- The webbrowser module now uses subprocess's start_new_session=True rather
  than a potentially risky preexec_fn=os.setsid call.

- bpo-22042: signal.set_wakeup_fd(fd) now raises an exception if the file
  descriptor is in blocking mode.

- bpo-16808: inspect.stack() now returns a named tuple instead of a tuple.
  Patch by Daniel Shahaf.

- bpo-22236: Fixed Tkinter images copying operations in NoDefaultRoot mode.

- bpo-2527: Add a *globals* argument to timeit functions, in order to
  override the globals namespace in which the timed code is executed. Patch
  by Ben Roberts.

- bpo-22118: Switch urllib.parse to use RFC 3986 semantics for the
  resolution of relative URLs, rather than RFCs 1808 and 2396. Patch by
  Demian Brecht.

- bpo-21549: Added the "members" parameter to TarFile.list().

- bpo-19628: Allow compileall recursion depth to be specified with a -r
  option.

- bpo-15696: Add a __sizeof__ implementation for mmap objects on Windows.

- bpo-22068: Avoided reference loops with Variables and Fonts in Tkinter.

- bpo-22165: SimpleHTTPRequestHandler now supports undecodable file names.

- bpo-15381: Optimized line reading in io.BytesIO.

- bpo-8797: Raise HTTPError on failed Basic Authentication immediately.
  Initial patch by Sam Bull.

- bpo-20729: Restored the use of lazy iterkeys()/itervalues()/iteritems() in
  the mailbox module.

- bpo-21448: Changed FeedParser feed() to avoid O(N**2) behavior when
  parsing long line. Original patch by Raymond Hettinger.

- bpo-22184: The functools LRU Cache decorator factory now gives an earlier
  and clearer error message when the user forgets the required parameters.

- bpo-17923: glob() patterns ending with a slash no longer match non-dirs on
  AIX.  Based on patch by Delhallt.

- bpo-21725: Added support for RFC 6531 (SMTPUTF8) in smtpd.

- bpo-22176: Update the ctypes module's libffi to v3.1.  This release adds
  support for the Linux AArch64 and POWERPC ELF ABIv2 little endian
  architectures.

- bpo-5411: Added support for the "xztar" format in the shutil module.

- bpo-21121: Don't force 3rd party C extensions to be built with
  -Werror=declaration- after-statement.

- bpo-21975: Fixed crash when using uninitialized sqlite3.Row (in particular
  when unpickling pickled sqlite3.Row).  sqlite3.Row is now initialized in
  the __new__() method.

- bpo-20170: Convert posixmodule to use Argument Clinic.

- bpo-21539: Add an *exists_ok* argument to `Pathlib.mkdir()` to mimic
  `mkdir -p` and `os.makedirs()` functionality.  When true, ignore
  FileExistsErrors.  Patch by Berker Peksag.

- bpo-22127: Bypass IDNA for pure-ASCII host names in the socket module (in
  particular for numeric IPs).

- bpo-21047: set the default value for the *convert_charrefs* argument of
  HTMLParser to True.  Patch by Berker Peksag.

- Add an __all__ to html.entities.

- bpo-15114: the strict mode and argument of HTMLParser, HTMLParser.error,
  and the HTMLParserError exception have been removed.

- bpo-22085: Dropped support of Tk 8.3 in Tkinter.

- bpo-21580: Now Tkinter correctly handles bytes arguments passed to Tk. In
  particular this allows initializing images from binary data.

- bpo-22003: When initialized from a bytes object, io.BytesIO() now defers
  making a copy until it is mutated, improving performance and memory use on
  some use cases. Patch by David Wilson.

- bpo-22018: On Windows, signal.set_wakeup_fd() now also supports sockets. A
  side effect is that Python depends to the WinSock library.

- bpo-22054: Add os.get_blocking() and os.set_blocking() functions to get
  and set the blocking mode of a file descriptor (False if the O_NONBLOCK
  flag is set, True otherwise). These functions are not available on
  Windows.

- bpo-17172: Make turtledemo start as active on OS X even when run with
  subprocess. Patch by Lita Cho.

- bpo-21704: Fix build error for _multiprocessing when semaphores are not
  available. Patch by Arfrever Frehtes Taifersar Arahesis.

- bpo-20173: Convert sha1, sha256, sha512 and md5 to ArgumentClinic. Patch
  by Vajrasky Kok.

- Fix repr(_socket.socket) on Windows 64-bit: don't fail with OverflowError
  on closed socket. repr(socket.socket) already works fine.

- bpo-22033: Reprs of most Python implemened classes now contain actual
  class name instead of hardcoded one.

- bpo-21947: The dis module can now disassemble generator-iterator objects
  based on their gi_code attribute. Patch by Clement Rouault.

- bpo-16133: The asynchat.async_chat.handle_read() method now ignores
  BlockingIOError exceptions.

- bpo-22044: Fixed premature DECREF in call_tzinfo_method. Patch by Tom
  Flanagan.

- bpo-19884: readline: Disable the meta modifier key if stdout is not a
  terminal to not write the ANSI sequence ``"\033[1034h"`` into stdout. This
  sequence is used on some terminal (ex: TERM=xterm-256color") to enable
  support of 8 bit characters.

- bpo-4350: Removed a number of out-of-dated and non-working for a long time
  Tkinter methods.

- bpo-6167: Scrollbar.activate() now returns the name of active element if
  the argument is not specified.  Scrollbar.set() now always accepts only 2
  arguments.

- bpo-15275: Clean up and speed up the ntpath module.

- bpo-21888: plistlib's load() and loads() now work if the fmt parameter is
  specified.

- bpo-22032: __qualname__ instead of __name__ is now always used to format
  fully qualified class names of Python implemented classes.

- bpo-22031: Reprs now always use hexadecimal format with the "0x" prefix
  when contain an id in form " at 0x...".

- bpo-22018: signal.set_wakeup_fd() now raises an OSError instead of a
  ValueError on ``fstat()`` failure.

- bpo-21044: tarfile.open() now handles fileobj with an integer 'name'
  attribute.  Based on patch by Antoine Pietri.

- bpo-21966: Respect -q command-line option when code module is ran.

- bpo-19076: Don't pass the redundant 'file' argument to self.error().

- bpo-16382: Improve exception message of warnings.warn() for bad category.
  Initial patch by Phil Elson.

- bpo-21932: os.read() now uses a :c:func:`Py_ssize_t` type instead of
  :c:type:`int` for the size to support reading more than 2 GB at once. On
  Windows, the size is truncted to INT_MAX. As any call to os.read(), the OS
  may read less bytes than the number of requested bytes.

- bpo-21942: Fixed source file viewing in pydoc's server mode on Windows.

- bpo-11259: asynchat.async_chat().set_terminator() now raises a ValueError
  if the number of received bytes is negative.

- bpo-12523: asynchat.async_chat.push() now raises a TypeError if it doesn't
  get a bytes string

- bpo-21707: Add missing kwonlyargcount argument to
  ModuleFinder.replace_paths_in_code().

- bpo-20639: calling Path.with_suffix('') allows removing the suffix again.
  Patch by July Tikhonov.

- bpo-21714: Disallow the construction of invalid paths using
  Path.with_name().  Original patch by Antony Lee.

- bpo-15014: Added 'auth' method to smtplib to make implementing auth
  mechanisms simpler, and used it internally in the login method.

- bpo-21151: Fixed a segfault in the winreg module when ``None`` is passed
  as a ``REG_BINARY`` value to SetValueEx.  Patch by John Ehresman.

- bpo-21090: io.FileIO.readall() does not ignore I/O errors anymore. Before,
  it ignored I/O errors if at least the first C call read() succeed.

- bpo-5800: headers parameter of wsgiref.headers.Headers is now optional.
  Initial patch by Pablo Torres Navarrete and SilentGhost.

- bpo-21781: ssl.RAND_add() now supports strings longer than 2 GB.

- bpo-21679: Prevent extraneous fstat() calls during open().  Patch by
  Bohuslav Kabrda.

- bpo-21863: cProfile now displays the module name of C extension functions,
  in addition to their own name.

- bpo-11453: asyncore: emit a ResourceWarning when an unclosed file_wrapper
  object is destroyed. The destructor now closes the file if needed. The
  close() method can now be called twice: the second call does nothing.

- bpo-21858: Better handling of Python exceptions in the sqlite3 module.

- bpo-21476: Make sure the email.parser.BytesParser TextIOWrapper is
  discarded after parsing, so the input file isn't unexpectedly closed.

- bpo-20295: imghdr now recognizes OpenEXR format images.

- bpo-21729: Used the "with" statement in the dbm.dumb module to ensure
  files closing. Patch by Claudiu Popa.

- bpo-21491: socketserver: Fix a race condition in child processes reaping.

- bpo-21719: Added the ``st_file_attributes`` field to os.stat_result on
  Windows.

- bpo-21832: Require named tuple inputs to be exact strings.

- bpo-21722: The distutils "upload" command now exits with a non-zero return
  code when uploading fails.  Patch by Martin Dengler.

- bpo-21723: asyncio.Queue: support any type of number (ex: float) for the
  maximum size. Patch written by Vajrasky Kok.

- bpo-21711: support for "site-python" directories has now been removed from
  the site module (it was deprecated in 3.4).

- bpo-17552: new socket.sendfile() method allowing a file to be sent over a
  socket by using high-performance os.sendfile() on UNIX. Patch by Giampaolo
  Rodola'.

- bpo-18039: dbm.dump.open() now always creates a new database when the flag
  has the value 'n'.  Patch by Claudiu Popa.

- bpo-21326: Add a new is_closed() method to asyncio.BaseEventLoop.
  run_forever() and run_until_complete() methods of asyncio.BaseEventLoop
  now raise an exception if the event loop was closed.

- bpo-21766: Prevent a security hole in CGIHTTPServer by URL unquoting paths
  before checking for a CGI script at that path.

- bpo-21310: Fixed possible resource leak in failed open().

- bpo-21256: Printout of keyword args should be in deterministic order in a
  mock function call. This will help to write better doctests.

- bpo-21677: Fixed chaining nonnormalized exceptions in io close() methods.

- bpo-11709: Fix the pydoc.help function to not fail when sys.stdin is not a
  valid file.

- bpo-21515: tempfile.TemporaryFile now uses os.O_TMPFILE flag is available.

- bpo-13223: Fix pydoc.writedoc so that the HTML documentation for methods
  that use 'self' in the example code is generated correctly.

- bpo-21463: In urllib.request, fix pruning of the FTP cache.

- bpo-21618: The subprocess module could fail to close open fds that were
  inherited by the calling process and already higher than POSIX resource
  limits would otherwise allow.  On systems with a functioning /proc/self/fd
  or /dev/fd interface the max is now ignored and all fds are closed.

- bpo-20383: Introduce importlib.util.module_from_spec() as the preferred
  way to create a new module.

- bpo-21552: Fixed possible integer overflow of too long string lengths in
  the tkinter module on 64-bit platforms.

- bpo-14315: The zipfile module now ignores extra fields in the central
  directory that are too short to be parsed instead of letting a
  struct.unpack error bubble up as this "bad data" appears in many real
  world zip files in the wild and is ignored by other zip tools.

- bpo-13742: Added "key" and "reverse" parameters to heapq.merge(). (First
  draft of patch contributed by Simon Sapin.)

- bpo-21402: tkinter.ttk now works when default root window is not set.

- bpo-3015: _tkinter.create() now creates tkapp object with wantobject=1 by
  default.

- bpo-10203: sqlite3.Row now truly supports sequence protocol.  In
  particular it supports reverse() and negative indices.  Original patch by
  Claudiu Popa.

- bpo-18807: If copying (no symlinks) specified for a venv, then the python
  interpreter aliases (python, python3) are now created by copying rather
  than symlinking.

- bpo-20197: Added support for the WebP image type in the imghdr module.
  Patch by Fabrice Aneche and Claudiu Popa.

- bpo-21513: Speedup some properties of IP addresses (IPv4Address,
  IPv6Address) such as .is_private or .is_multicast.

- bpo-21137: Improve the repr for threading.Lock() and its variants by
  showing the "locked" or "unlocked" status.  Patch by Berker Peksag.

- bpo-21538: The plistlib module now supports loading of binary plist files
  when reference or offset size is not a power of two.

- bpo-21455: Add a default backlog to socket.listen().

- bpo-21525: Most Tkinter methods which accepted tuples now accept lists
  too.

- bpo-22166: With the assistance of a new internal _codecs._forget_codec
  helping function, test_codecs now clears the encoding caches to avoid the
  appearance of a reference leak

- bpo-22236: Tkinter tests now don't reuse default root window.  New root
  window is created for every test class.

- bpo-10744: Fix PEP 3118 format strings on ctypes objects with a nontrivial
  shape.

- bpo-20826: Optimize ipaddress.collapse_addresses().

- bpo-21487: Optimize ipaddress.summarize_address_range() and
  ipaddress.{IPv4Network,IPv6Network}.subnets().

- bpo-21486: Optimize parsing of netmasks in ipaddress.IPv4Network and
  ipaddress.IPv6Network.

- bpo-13916: Disallowed the surrogatepass error handler for non UTF-\*
  encodings.

- bpo-20998: Fixed re.fullmatch() of repeated single character pattern with
  ignore case. Original patch by Matthew Barnett.

- bpo-21075: fileinput.FileInput now reads bytes from standard stream if
  binary mode is specified.  Patch by Sam Kimbrel.

- bpo-19775: Add a samefile() method to pathlib Path objects.  Initial patch
  by Vajrasky Kok.

- bpo-21226: Set up modules properly in PyImport_ExecCodeModuleObject (and
  friends).

- bpo-21398: Fix a unicode error in the pydoc pager when the documentation
  contains characters not encodable to the stdout encoding.

- bpo-16531: ipaddress.IPv4Network and ipaddress.IPv6Network now accept an
  (address, netmask) tuple argument, so as to easily construct network
  objects from existing addresses.

- bpo-21156: importlib.abc.InspectLoader.source_to_code() is now a
  staticmethod.

- bpo-21424: Simplified and optimized heaqp.nlargest() and nmsmallest() to
  make fewer tuple comparisons.

- bpo-21396: Fix TextIOWrapper(..., write_through=True) to not force a
  flush() on the underlying binary stream.  Patch by akira.

- bpo-18314: Unlink now removes junctions on Windows. Patch by Kim Gräsman

- bpo-21088: Bugfix for curses.window.addch() regression in 3.4.0. In
  porting to Argument Clinic, the first two arguments were reversed.

- bpo-21407: _decimal: The module now supports function signatures.

- bpo-10650: Remove the non-standard 'watchexp' parameter from the
  Decimal.quantize() method in the Python version.  It had never been
  present in the C version.

- bpo-21469: Reduced the risk of false positives in robotparser by checking
  to make sure that robots.txt has been read or does not exist prior to
  returning True in can_fetch().

- bpo-19414: Have the OrderedDict mark deleted links as unusable. This gives
  an early failure if the link is deleted during iteration.

- bpo-21421: Add __slots__ to the MappingViews ABC. Patch by Josh Rosenberg.

- bpo-21101: Eliminate double hashing in the C speed-up code for
  collections.Counter().

- bpo-21321: itertools.islice() now releases the reference to the source
  iterator when the slice is exhausted.  Patch by Anton Afanasyev.

- bpo-21057: TextIOWrapper now allows the underlying binary stream's read()
  or read1() method to return an arbitrary bytes-like object (such as a
  memoryview). Patch by Nikolaus Rath.

- bpo-20951: SSLSocket.send() now raises either SSLWantReadError or
  SSLWantWriteError on a non-blocking socket if the operation would block.
  Previously, it would return 0.  Patch by Nikolaus Rath.

- bpo-13248: removed previously deprecated asyncore.dispatcher __getattr__
  cheap inheritance hack.

- bpo-9815: assertRaises now tries to clear references to local variables in
  the exception's traceback.

- bpo-19940: ssl.cert_time_to_seconds() now interprets the given time string
  in the UTC timezone (as specified in RFC 5280), not the local timezone.

- bpo-13204: Calling sys.flags.__new__ would crash the interpreter, now it
  raises a TypeError.

- bpo-19385: Make operations on a closed dbm.dumb database always raise the
  same exception.

- bpo-21207: Detect when the os.urandom cached fd has been closed or
  replaced, and open it anew.

- bpo-21291: subprocess's Popen.wait() is now thread safe so that multiple
  threads may be calling wait() or poll() on a Popen instance at the same
  time without losing the Popen.returncode value.

- bpo-21127: Path objects can now be instantiated from str subclass
  instances (such as ``numpy.str_``).

- bpo-15002: urllib.response object to use _TemporaryFileWrapper (and
  _TemporaryFileCloser) facility. Provides a better way to handle file
  descriptor close. Patch contributed by Christian Theune.

- bpo-12220: mindom now raises a custom ValueError indicating it doesn't
  support spaces in URIs instead of letting a 'split' ValueError bubble up.

- bpo-21068: The ssl.PROTOCOL* constants are now enum members.

- bpo-21276: posixmodule: Don't define USE_XATTRS on KFreeBSD and the Hurd.

- bpo-21262: New method assert_not_called for Mock. It raises AssertionError
  if the mock has been called.

- bpo-21238: New keyword argument `unsafe` to Mock. It raises
  `AttributeError` incase of an attribute startswith assert or assret.

- bpo-20896: ssl.get_server_certificate() now uses PROTOCOL_SSLv23, not
  PROTOCOL_SSLv3, for maximum compatibility.

- bpo-21239: patch.stopall() didn't work deterministically when the same
  name was patched more than once.

- bpo-21203: Updated fileConfig and dictConfig to remove inconsistencies.
  Thanks to Jure Koren for the patch.

- bpo-21222: Passing name keyword argument to mock.create_autospec now
  works.

- bpo-21197: Add lib64 -> lib symlink in venvs on 64-bit non-OS X POSIX.

- bpo-17498: Some SMTP servers disconnect after certain errors, violating
  strict RFC conformance.  Instead of losing the error code when we issue
  the subsequent RSET, smtplib now returns the error code and defers raising
  the SMTPServerDisconnected error until the next command is issued.

- bpo-17826: setting an iterable side_effect on a mock function created by
  create_autospec now works. Patch by Kushal Das.

- bpo-7776: Fix ``Host:`` header and reconnection when using
  http.client.HTTPConnection.set_tunnel(). Patch by Nikolaus Rath.

- bpo-20968: unittest.mock.MagicMock now supports division. Patch by
  Johannes Baiter.

- bpo-21529: Fix arbitrary memory access in JSONDecoder.raw_decode with a
  negative second parameter. Bug reported by Guido Vranken. (See also:
  CVE-2014-4616)

- bpo-21169: getpass now handles non-ascii characters that the input stream
  encoding cannot encode by re-encoding using the replace error handler.

- bpo-21171: Fixed undocumented filter API of the rot13 codec. Patch by
  Berker Peksag.

- bpo-20539: Improved math.factorial error message for large positive inputs
  and changed exception type (OverflowError -> ValueError) for large
  negative inputs.

- bpo-21172: isinstance check relaxed from dict to collections.Mapping.

- bpo-21155: asyncio.EventLoop.create_unix_server() now raises a ValueError
  if path and sock are specified at the same time.

- bpo-21136: Avoid unnecessary normalization of Fractions resulting from
  power and other operations.  Patch by Raymond Hettinger.

- bpo-17621: Introduce importlib.util.LazyLoader.

- bpo-21076: signal module constants were turned into enums. Patch by
  Giampaolo Rodola'.

- bpo-20636: Improved the repr of Tkinter widgets.

- bpo-19505: The items, keys, and values views of OrderedDict now support
  reverse iteration using reversed().

- bpo-21149: Improved thread-safety in logging cleanup during interpreter
  shutdown. Thanks to Devin Jeanpierre for the patch.

- bpo-21058: Fix a leak of file descriptor in
  :func:`tempfile.NamedTemporaryFile`, close the file descriptor if
  :func:`io.open` fails

- bpo-21200: Return None from pkgutil.get_loader() when __spec__ is missing.

- bpo-21013: Enhance ssl.create_default_context() when used for server side
  sockets to provide better security by default.

- bpo-20145: `assertRaisesRegex` and `assertWarnsRegex` now raise a
  TypeError if the second argument is not a string or compiled regex.

- bpo-20633: Replace relative import by absolute import.

- bpo-20980: Stop wrapping exception when using ThreadPool.

- bpo-21082: In os.makedirs, do not set the process-wide umask. Note this
  changes behavior of makedirs when exist_ok=True.

- bpo-20990: Fix issues found by pyflakes for multiprocessing.

- bpo-21015: SSL contexts will now automatically select an elliptic curve
  for ECDH key exchange on OpenSSL 1.0.2 and later, and otherwise default to
  "prime256v1".

- bpo-21000: Improve the command-line interface of json.tool.

- bpo-20995: Enhance default ciphers used by the ssl module to enable better
  security and prioritize perfect forward secrecy.

- bpo-20884: Don't assume that __file__ is defined on importlib.__init__.

- bpo-21499: Ignore __builtins__ in several test_importlib.test_api tests.

- bpo-20627: xmlrpc.client.ServerProxy is now a context manager.

- bpo-19165: The formatter module now raises DeprecationWarning instead of
  PendingDeprecationWarning.

- bpo-13936: Remove the ability of datetime.time instances to be considered
  false in boolean contexts.

- bpo-18931: selectors module now supports /dev/poll on Solaris. Patch by
  Giampaolo Rodola'.

- bpo-19977: When the ``LC_TYPE`` locale is the POSIX locale (``C`` locale),
  :py:data:`sys.stdin` and :py:data:`sys.stdout` are now using the
  ``surrogateescape`` error handler, instead of the ``strict`` error
  handler.

- bpo-20574: Implement incremental decoder for cp65001 code (Windows code
  page 65001, Microsoft UTF-8).

- bpo-20879: Delay the initialization of encoding and decoding tables for
  base32, ascii85 and base85 codecs in the base64 module, and delay the
  initialization of the unquote_to_bytes() table of the urllib.parse module,
  to not waste memory if these modules are not used.

- bpo-19157: Include the broadcast address in the usuable hosts for IPv6 in
  ipaddress.

- bpo-11599: When an external command (e.g. compiler) fails, distutils now
  prints out the whole command line (instead of just the command name) if
  the environment variable DISTUTILS_DEBUG is set.

- bpo-4931: distutils should not produce unhelpful "error: None" messages
  anymore. distutils.util.grok_environment_error is kept but doc-deprecated.

- bpo-20875: Prevent possible gzip "'read' is not defined" NameError. Patch
  by Claudiu Popa.

- bpo-11558: ``email.message.Message.attach`` now returns a more useful
  error message if ``attach`` is called on a message for which
  ``is_multipart`` is False.

- bpo-20283: RE pattern methods now accept the string keyword parameters as
  documented. The pattern and source keyword parameters are left as
  deprecated aliases.

- bpo-20778: Fix modulefinder to work with bytecode-only modules.

- bpo-20791: copy.copy() now doesn't make a copy when the input is a bytes
  object. Initial patch by Peter Otten.

- bpo-19748: On AIX, time.mktime() now raises an OverflowError for year
  outsize range [1902; 2037].

- bpo-19573: inspect.signature: Use enum for parameter kind constants.

- bpo-20726: inspect.signature: Make Signature and Parameter picklable.

- bpo-17373: Add inspect.Signature.from_callable method.

- bpo-20378: Improve repr of inspect.Signature and inspect.Parameter.

- bpo-20816: Fix inspect.getcallargs() to raise correct TypeError for
  missing keyword- only arguments. Patch by Jeremiah Lowin.

- bpo-20817: Fix inspect.getcallargs() to fail correctly if more than 3
  arguments are missing. Patch by Jeremiah Lowin.

- bpo-6676: Ensure a meaningful exception is raised when attempting to parse
  more than one XML document per pyexpat xmlparser instance. (Original
  patches by Hirokazu Yamamoto and Amaury Forgeot d'Arc, with suggested
  wording by David Gutteridge)

- bpo-21117: Fix inspect.signature to better support functools.partial. Due
  to the specifics of functools.partial implementation, positional-or-
  keyword arguments passed as keyword arguments become keyword-only.

- bpo-20334: inspect.Signature and inspect.Parameter are now hashable.
  Thanks to Antony Lee for bug reports and suggestions.

- bpo-15916: doctest.DocTestSuite returns an empty unittest.TestSuite
  instead of raising ValueError if it finds no tests

- bpo-21209: Fix asyncio.tasks.CoroWrapper to workaround a bug in yield-from
  implementation in CPythons prior to 3.4.1.

- asyncio: Add gi_{frame,running,code} properties to CoroWrapper (upstream
  issue #163).

- bpo-21311: Avoid exception in _osx_support with non-standard compiler
  configurations. Patch by John Szakmeister.

- bpo-11571: Ensure that the turtle window becomes the topmost window when
  launched on OS X.

- bpo-21801: Validate that __signature__ is None or an instance of
  Signature.

- bpo-21923: Prevent AttributeError in
  distutils.sysconfig.customize_compiler due to possible uninitialized
  _config_vars.

- bpo-21323: Fix http.server to again handle scripts in CGI subdirectories,
  broken by the fix for security issue #19435.  Patch by Zach Byrne.

- bpo-22733: Fix ffi_prep_args not zero-extending argument values correctly
  on 64-bit Windows.

- bpo-23302: Default to TCP_NODELAY=1 upon establishing an HTTPConnection.
  Removed use of hard-coded MSS as it's an optimization that's no longer
  needed with Nagle disabled.

IDLE
----

- bpo-20577: Configuration of the max line length for the FormatParagraph
  extension has been moved from the General tab of the Idle preferences
  dialog to the FormatParagraph tab of the Config Extensions dialog. Patch
  by Tal Einat.

- bpo-16893: Update Idle doc chapter to match current Idle and add new
  information.

- bpo-3068: Add Idle extension configuration dialog to Options menu. Changes
  are written to HOME/.idlerc/config-extensions.cfg. Original patch by Tal
  Einat.

- bpo-16233: A module browser (File : Class Browser, Alt+C) requires an
  editor window with a filename.  When Class Browser is requested otherwise,
  from a shell, output window, or 'Untitled' editor, Idle no longer displays
  an error box. It now pops up an Open Module box (Alt+M). If a valid name
  is entered and a module is opened, a corresponding browser is also opened.

- bpo-4832: Save As to type Python files automatically adds .py to the name
  you enter (even if your system does not display it).  Some systems
  automatically add .txt when type is Text files.

- bpo-21986: Code objects are not normally pickled by the pickle module. To
  match this, they are no longer pickled when running under Idle.

- bpo-17390: Adjust Editor window title; remove 'Python', move version to
  end.

- bpo-14105: Idle debugger breakpoints no longer disappear when inserting or
  deleting lines.

- bpo-17172: Turtledemo can now be run from Idle. Currently, the entry is on
  the Help menu, but it may move to Run. Patch by Ramchandra Apt and Lita
  Cho.

- bpo-21765: Add support for non-ascii identifiers to HyperParser.

- bpo-21940: Add unittest for WidgetRedirector. Initial patch by Saimadhav
  Heblikar.

- bpo-18592: Add unittest for SearchDialogBase. Patch by Phil Webster.

- bpo-21694: Add unittest for ParenMatch. Patch by Saimadhav Heblikar.

- bpo-21686: add unittest for HyperParser. Original patch by Saimadhav
  Heblikar.

- bpo-12387: Add missing upper(lower)case versions of default Windows key
  bindings for Idle so Caps Lock does not disable them. Patch by Roger
  Serwy.

- bpo-21695: Closing a Find-in-files output window while the search is still
  in progress no longer closes Idle.

- bpo-18910: Add unittest for textView. Patch by Phil Webster.

- bpo-18292: Add unittest for AutoExpand. Patch by Saihadhav Heblikar.

- bpo-18409: Add unittest for AutoComplete. Patch by Phil Webster.

- bpo-21477: htest.py - Improve framework, complete set of tests. Patches by
  Saimadhav Heblikar

- bpo-18104: Add idlelib/idle_test/htest.py with a few sample tests to begin
  consolidating and improving human-validated tests of Idle. Change other
  files as needed to work with htest.  Running the module as __main__ runs
  all tests.

- bpo-21139: Change default paragraph width to 72, the PEP 8 recommendation.

- bpo-21284: Paragraph reformat test passes after user changes reformat
  width.

- bpo-17654: Ensure IDLE menus are customized properly on OS X for non-
  framework builds and for all variants of Tk.

- bpo-23180: Rename IDLE "Windows" menu item to "Window". Patch by Al
  Sweigart.

Build
-----

- bpo-15506: Use standard PKG_PROG_PKG_CONFIG autoconf macro in the
  configure script.

- bpo-22935: Allow the ssl module to be compiled if openssl doesn't support
  SSL 3.

- bpo-22592: Drop support of the Borland C compiler to build Python. The
  distutils module still supports it to build extensions.

- bpo-22591: Drop support of MS-DOS, especially of the DJGPP compiler (MS-
  DOS port of GCC).

- bpo-16537: Check whether self.extensions is empty in setup.py. Patch by
  Jonathan Hosmer.

- bpo-22359: Remove incorrect uses of recursive make.  Patch by Jonas
  Wagner.

- bpo-21958: Define HAVE_ROUND when building with Visual Studio 2013 and
  above.  Patch by Zachary Turner.

- bpo-18093: the programs that embed the CPython runtime are now in a
  separate "Programs" directory, rather than being kept in the Modules
  directory.

- bpo-15759: "make suspicious", "make linkcheck" and "make doctest" in Doc/
  now display special message when and only when there are failures.

- bpo-21141: The Windows build process no longer attempts to find Perl,
  instead relying on OpenSSL source being configured and ready to build.
  The ``PCbuild\build_ssl.py`` script has been re-written and re-named to
  ``PCbuild\prepare_ssl.py``, and takes care of configuring OpenSSL source
  for both 32 and 64 bit platforms.  OpenSSL sources obtained from
  svn.python.org will always be pre-configured and ready to build.

- bpo-21037: Add a build option to enable AddressSanitizer support.

- bpo-19962: The Windows build process now creates "python.bat" in the root
  of the source tree, which passes all arguments through to the most
  recently built interpreter.

- bpo-21285: Refactor and fix curses configure check to always search in a
  ncursesw directory.

- bpo-15234: For BerkelyDB and Sqlite, only add the found library and
  include directories if they aren't already being searched. This avoids an
  explicit runtime library dependency.

- bpo-17861: Tools/scripts/generate_opcode_h.py automatically regenerates
  Include/opcode.h from Lib/opcode.py if the latter gets any change.

- bpo-20644: OS X installer build support for documentation build changes in
  3.4.1: assume externally supplied sphinx-build is available in /usr/bin.

- bpo-20022: Eliminate use of deprecated bundlebuilder in OS X builds.

- bpo-15968: Incorporated Tcl, Tk, and Tix builds into the Windows build
  solution.

- bpo-17095: Fix Modules/Setup *shared* support.

- bpo-21811: Anticipated fixes to support OS X versions > 10.9.

- bpo-21166: Prevent possible segfaults and other random failures of python
  --generate- posix-vars in pybuilddir.txt build target.

- bpo-18096: Fix library order returned by python-config.

- bpo-17219: Add library build dir for Python extension cross-builds.

- bpo-22919: Windows build updated to support VC 14.0 (Visual Studio 2015),
  which will be used for the official release.

- bpo-21236: Build _msi.pyd with cabinet.lib instead of fci.lib

- bpo-17128: Use private version of OpenSSL for OS X 10.5+ installer.

C API
-----

- bpo-14203: Remove obsolete support for view==NULL in PyBuffer_FillInfo(),
  bytearray_getbuffer(), bytesiobuf_getbuffer() and array_buffer_getbuf().
  All functions now raise BufferError in that case.

- bpo-22445: PyBuffer_IsContiguous() now implements precise contiguity
  tests, compatible with NumPy's NPY_RELAXED_STRIDES_CHECKING compilation
  flag.  Previously the function reported false negatives for corner cases.

- bpo-22079: PyType_Ready() now checks that statically allocated type has no
  dynamically allocated bases.

- bpo-22453: Removed non-documented macro PyObject_REPR().

- bpo-18395: Rename ``_Py_char2wchar()`` to :c:func:`Py_DecodeLocale`,
  rename ``_Py_wchar2char()`` to :c:func:`Py_EncodeLocale`, and document
  these functions.

- bpo-21233: Add new C functions: PyMem_RawCalloc(), PyMem_Calloc(),
  PyObject_Calloc(), _PyObject_GC_Calloc(). bytes(int) is now using
  ``calloc()`` instead of ``malloc()`` for large objects which is faster and
  use less memory.

- bpo-20942: PyImport_ImportFrozenModuleObject() no longer sets __file__ to
  match what importlib does; this affects _frozen_importlib as well as any
  module loaded using imp.init_frozen().

Documentation
-------------

- bpo-19548: Update the codecs module documentation to better cover the
  distinction between text encodings and other codecs, together with other
  clarifications. Patch by Martin Panter.

- bpo-22394: Doc/Makefile now supports ``make venv PYTHON=../python`` to
  create a venv for generating the documentation, e.g., ``make html
  PYTHON=venv/bin/python3``.

- bpo-21514: The documentation of the json module now refers to new JSON RFC
  7159 instead of obsoleted RFC 4627.

- bpo-21777: The binary sequence methods on bytes and bytearray are now
  documented explicitly, rather than assuming users will be able to derive
  the expected behaviour from the behaviour of the corresponding str
  methods.

- bpo-6916: undocument deprecated asynchat.fifo class.

- bpo-17386: Expanded functionality of the ``Doc/make.bat`` script to make
  it much more comparable to ``Doc/Makefile``.

- bpo-21312: Update the thread_foobar.h template file to include newer
  threading APIs. Patch by Jack McCracken.

- bpo-21043: Remove the recommendation for specific CA organizations and to
  mention the ability to load the OS certificates.

- bpo-20765: Add missing documentation for PurePath.with_name() and
  PurePath.with_suffix().

- bpo-19407: New package installation and distribution guides based on the
  Python Packaging Authority tools. Existing guides have been retained as
  legacy links from the distutils docs, as they still contain some required
  reference material for tool developers that isn't recorded anywhere else.

- bpo-19697: Document cases where __main__.__spec__ is None.

Tests
-----

- bpo-18982: Add tests for CLI of the calendar module.

- bpo-19548: Added some additional checks to test_codecs to ensure that
  statements in the updated documentation remain accurate. Patch by Martin
  Panter.

- bpo-22838: All test_re tests now work with unittest test discovery.

- bpo-22173: Update lib2to3 tests to use unittest test discovery.

- bpo-16000: Convert test_curses to use unittest.

- bpo-21456: Skip two tests in test_urllib2net.py if _ssl module not
  present. Patch by Remi Pointel.

- bpo-20746: Fix test_pdb to run in refleak mode (-R).  Patch by Xavier de
  Gaye.

- bpo-22060: test_ctypes has been somewhat cleaned up and simplified; it now
  uses unittest test discovery to find its tests.

- bpo-22104: regrtest.py no longer holds a reference to the suite of tests
  loaded from test modules that don't define test_main().

- bpo-22111: Assorted cleanups in test_imaplib.  Patch by Milan Oberkirch.

- bpo-22002: Added ``load_package_tests`` function to test.support and used
  it to implement/augment test discovery in test_asyncio, test_email,
  test_importlib, test_json, and test_tools.

- bpo-21976: Fix test_ssl to accept LibreSSL version strings.  Thanks to
  William Orr.

- bpo-21918: Converted test_tools from a module to a package containing
  separate test files for each tested script.

- bpo-9554: Use modern unittest features in test_argparse. Initial patch by
  Denver Coneybeare and Radu Voicilas.

- bpo-20155: Changed HTTP method names in failing tests in test_httpservers
  so that packet filtering software (specifically Windows Base Filtering
  Engine) does not interfere with the transaction semantics expected by the
  tests.

- bpo-19493: Refactored the ctypes test package to skip tests explicitly
  rather than silently.

- bpo-18492: All resources are now allowed when tests are not run by
  regrtest.py.

- bpo-21634: Fix pystone micro-benchmark: use floor division instead of true
  division to benchmark integers instead of floating point numbers. Set
  pystone version to 1.2. Patch written by Lennart Regebro.

- bpo-21605: Added tests for Tkinter images.

- bpo-21493: Added test for ntpath.expanduser().  Original patch by Claudiu
  Popa.

- bpo-19925: Added tests for the spwd module. Original patch by Vajrasky
  Kok.

- bpo-21522: Added Tkinter tests for Listbox.itemconfigure(),
  PanedWindow.paneconfigure(), and Menu.entryconfigure().

- bpo-17756: Fix test_code test when run from the installed location.

- bpo-17752: Fix distutils tests when run from the installed location.

- bpo-18604: Consolidated checks for GUI availability.  All platforms now at
  least check whether Tk can be instantiated when the GUI resource is
  requested.

- bpo-21275: Fix a socket test on KFreeBSD.

- bpo-21223: Pass test_site/test_startup_imports when some of the extensions
  are built as builtins.

- bpo-20635: Added tests for Tk geometry managers.

- Add test case for freeze.

- bpo-20743: Fix a reference leak in test_tcl.

- bpo-21097: Move test_namespace_pkgs into test_importlib.

- bpo-21503: Use test_both() consistently in test_importlib.

- bpo-20939: Avoid various network test failures due to new redirect of
  http://www.python.org/ to https://www.python.org: use
  http://www.example.com instead.

- bpo-20668: asyncio tests no longer rely on tests.txt file. (Patch by
  Vajrasky Kok)

- bpo-21093: Prevent failures of ctypes test_macholib on OS X if a copy of
  libz exists in $HOME/lib or /usr/local/lib.

- bpo-22770: Prevent some Tk segfaults on OS X when running gui tests.

- bpo-23211: Workaround test_logging failure on some OS X 10.6 systems.

- bpo-23345: Prevent test_ssl failures with large OpenSSL patch level values
  (like 0.9.8zc).

Tools/Demos
-----------

- bpo-22314: pydoc now works when the LINES environment variable is set.

- bpo-22615: Argument Clinic now supports the "type" argument for the int
  converter. This permits using the int converter with enums and typedefs.

- bpo-20076: The makelocalealias.py script no longer ignores UTF-8 mapping.

- bpo-20079: The makelocalealias.py script now can parse the SUPPORTED file
  from glibc sources and supports command line options for source paths.

- bpo-22201: Command-line interface of the zipfile module now correctly
  extracts ZIP files with directory entries.  Patch by Ryan Wilson.

- bpo-22120: For functions using an unsigned integer return converter,
  Argument Clinic now generates a cast to that type for the comparison to -1
  in the generated code.  (This suppresses a compilation warning.)

- bpo-18974: Tools/scripts/diff.py now uses argparse instead of optparse.

- bpo-21906: Make Tools/scripts/md5sum.py work in Python 3. Patch by Zachary
  Ware.

- bpo-21629: Fix Argument Clinic's "--converters" feature.

- Add support for ``yield from`` to 2to3.

- Add support for the PEP 465 matrix multiplication operator to 2to3.

- bpo-16047: Fix module exception list and __file__ handling in freeze.
  Patch by Meador Inge.

- bpo-11824: Consider ABI tags in freeze. Patch by Meador Inge.

- bpo-20535: PYTHONWARNING no longer affects the run_tests.py script. Patch
  by Arfrever Frehtes Taifersar Arahesis.

Windows
-------

- bpo-23260: Update Windows installer

- The bundled version of Tcl/Tk has been updated to 8.6.3.  The most visible
  result of this change is the addition of new native file dialogs when
  running on Windows Vista or newer.  See Tcl/Tk's TIP 432 for more
  information.  Also, this version of Tcl/Tk includes support for Windows
  10.

- bpo-17896: The Windows build scripts now expect external library sources
  to be in ``PCbuild\..\externals`` rather than ``PCbuild\..\..``.

- bpo-17717: The Windows build scripts now use a copy of NASM pulled from
  svn.python.org to build OpenSSL.

- bpo-21907: Improved the batch scripts provided for building Python.

- bpo-22644: The bundled version of OpenSSL has been updated to 1.0.1j.

- bpo-10747: Use versioned labels in the Windows start menu. Patch by Olive
  Kilburn.

- bpo-22980: .pyd files with a version and platform tag (for example,
  ".cp35-win32.pyd") will now be loaded in preference to those without tags.


**(For information about older versions, consult the HISTORY file.)**

