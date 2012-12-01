PlanuKit
========

PlanuKit is an Objective-C library for consuming the [Planets.Nu][1] game API. The project builds a iOS static library as well as a Framework for OS X.

**ARC**
---

PlanuKit requires ARC to be enabled in the project. No effort to support non-ARC projects is currently planned.

**CoreData**
--------

PlanuKit uses CoreData to save the game data locally. For iOS projects using the static library, include the *NuData.xcdatamodeld* from PlanuKit in the resources of the app.

**License**
-------

PlanuKit is © 2012 Srs Biznas, LLC and licensed under the GNU Lesser General Public License, with the exception that the data model is freely distributable in any format you see fit.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

[1]: http://planets.nu "Planets.Nu"


