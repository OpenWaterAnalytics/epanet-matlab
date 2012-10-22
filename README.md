epanet-matlab
=============

Description
-----------
This product consists of a set of Matlab wrappers that allow use of the EPANET and EPANET-MSX programmer's toolkit APIs from within the Matlab environment. The Matlab functions share names with the C-language API functions. Usage of the Matlab functions is similar; the argument lists are identical, with the exception that Matlab separates input and output arguments. User's of the EPANET or EPANET-MSX APIs with Matlab programming experience should be able to make efficient use of this product.

In addition to the Matlab API wrappers, this product includes a small number of utility routines that, for example, allow for plotting of the network using Matlab graphics.

For reference see: EPANET programmer's toolkit Windows help file, and EPANET/MSX User's Guide.


Requirements:
-------------
Following files have to be in the search path: %(easiest is to copy them in the working directory)
- epanet2.dll
- epanet2.h
- epanetmsx.dll
- epanetmsx.h

Also added to the path should be locations for the included directories:
- EPANET toolkit matlab wrappers
- MSX matlab wrappers
- Test files
- Utils files

Use:
----
The frame of a toolkit application should always have the
following form:

    global EN_CONSTANT
    global MSX_CONSTANT

    %load libraries
    %start EPANET toolkit
    ENMatlabSetup('epanet2','epanet2.h');

    %start MSX toolkit
    MSXMatlabSetup('epanetmsx','epanetmsx.h');
    
    %open hydraulic network
    [errcode] = ENopen(inpfn, rptfn, '');
    
    % Open the MSX file
    [errcode] = MSXopen(msxfn);
    ...
    %close MSX file
    MSXclose();

    %close hydraulic network
    ENclose();

    %unload libraries
    ENMatlabCleanup();
    MSXMatlabCleanup();


Examples for the use of the EPANET toolkit and the MSX toolkit
can be found in the test folder.


Notes:
------

- predefined objects are stored in the global structures
`EN_CONSTANT` and `MSX_CONSTANT`. Thus functions that require the
input of an object must be called as can be observed in the example below:

        [errcode,value]=ENgetlinkvalue(index,EN_CONSTANT.EN_LENGTH);

    The prefix of `EN_CONSTANT.` or `MSX_CONSTANT.` is required for all object inputs even though this is not indicated in the help files. The help file for the above example would only say:

        [errcode,value]=ENgetlinkvalue(index,EN_LENGTH);

    Alternatively, numeric codes can be used as indicated in the help files.

- index numbers and id (names) of nodes, links, species etc. do not necessarily coincide.

Authors & License:
--------
Original Matlab wrappers and scripts by Jim Uber.

This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.