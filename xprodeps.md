# activemq-cpp dependencies

|project|license [^_l]|description [dependencies]|version|source|diff [^_d]|
|-------|-------------|--------------------------|-------|------|----------|
|<a id='activemq-cpp' />[activemq-cpp](http://activemq.apache.org/cms/)|[Apache-2.0](http://www.apache.org/licenses/LICENSE-2.0.html 'Apache License, Version 2.0')|ActiveMQ C++ Messaging Service (CMS) client library [deps: _apr, openssl_]| |[upstream](https://github.com/apache/activemq-cpp 'github.com/apache/activemq-cpp')|  [auto]|
|<a id='apr' />[apr](http://apr.apache.org/)|[Apache-2.0](http://www.apache.org/licenses/LICENSE-2.0.html 'Apache License, Version 2.0')|Apache Portable Runtime project|[xpv1.7.6.3](https://github.com/externpro/apr/releases/tag/xpv1.7.6.3 'release')|[repo](https://github.com/externpro/apr 'github.com/externpro/apr') [upstream](https://github.com/apache/apr 'github.com/apache/apr')|[diff](https://github.com/externpro/apr/compare/1.7.6...xpv1.7.6.3 'github.com/externpro/apr/compare/1.7.6...xpv1.7.6.3') [patch(msw), auto(unix)]|
|<a id='openssl' />[openssl](http://www.openssl.org/)|[BSD-style](http://www.openssl.org/source/license.html 'dual OpenSSL and SSLeay License: both are BSD-style licenses')|Cryptography and SSL/TLS Toolkit [pvt deps: _nasm, yasm_]|[xpv1.1.1l.4](https://github.com/externpro/openssl/releases/tag/xpv1.1.1l.4 'release')|[repo](https://github.com/externpro/openssl 'github.com/externpro/openssl') [upstream](https://github.com/openssl/openssl 'github.com/openssl/openssl')|[diff](https://github.com/externpro/openssl/compare/OpenSSL_1_1_1l...xpv1.1.1l.4 'github.com/externpro/openssl/compare/OpenSSL_1_1_1l...xpv1.1.1l.4') [intro]|
|<a id='nasm' />[nasm](https://www.nasm.us/)|[BSD-2-Clause](https://www.nasm.us/ 'BSD 2-Clause Simplified License')|The Netwide Assembler - an 80x86 and x86-64 assembler (MSW-only)|[xpv2.14.02.4](https://github.com/externpro/nasm/releases/tag/xpv2.14.02.4 'release')|[repo](https://github.com/externpro/nasm 'github.com/externpro/nasm')|[diff](https://github.com/externpro/nasm/compare/v0...xpv2.14.02.4 'github.com/externpro/nasm/compare/v0...xpv2.14.02.4') [bin]|
|<a id='yasm' />[yasm](http://yasm.tortall.net/)|[BSD-2-Clause](https://github.com/yasm/yasm/blob/v1.3.0/COPYING 'BSD 2-Clause Simplified License')|assembler and disassembler for the Intel x86 architecture|[xpv1.3.0.3](https://github.com/externpro/yasm/releases/tag/xpv1.3.0.3 'release')|[repo](https://github.com/externpro/yasm 'github.com/externpro/yasm') [upstream](https://github.com/yasm/yasm 'github.com/yasm/yasm')|[diff](https://github.com/externpro/yasm/compare/v1.3.0...xpv1.3.0.3 'github.com/externpro/yasm/compare/v1.3.0...xpv1.3.0.3') [patch]|

![deps](xprodeps.svg 'dependencies')

Dependency version check: all 4 parent-manifest versions match pinned versions.

|diff  |description|
|------|-----------|
|patch |diff modifies/patches existing cmake|
|intro |diff introduces cmake|
|auto  |diff adds cmake to replace autotools/configure/make|
|native|diff adds cmake but uses existing build system|
|bin   |diff adds cmake to repackage binaries built elsewhere|
|fetch |diff adds cmake and utilizes FetchContent|

[^_l]: see [SPDX License List](https://spdx.org/licenses/ '') for a list of commonly found licenses
[^_d]: see table above with description of diff
