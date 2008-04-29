/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// All CPP Unit tests are registered in here so we can disable them and
// enable them easily in one place.

#include <decaf/internal/util/ByteArrayAdapterTest.h>
CPPUNIT_TEST_SUITE_REGISTRATION( decaf::internal::util::ByteArrayAdapterTest );
#include <decaf/internal/nio/ByteArrayPerspectiveTest.h>
CPPUNIT_TEST_SUITE_REGISTRATION( decaf::internal::nio::ByteArrayPerspectiveTest );
#include <decaf/internal/nio/ByteArrayBufferTest.h>
CPPUNIT_TEST_SUITE_REGISTRATION( decaf::internal::nio::ByteArrayBufferTest );
#include <decaf/internal/nio/BufferFactoryTest.h>
CPPUNIT_TEST_SUITE_REGISTRATION( decaf::internal::nio::BufferFactoryTest );
#include <decaf/internal/nio/CharArrayBufferTest.h>
CPPUNIT_TEST_SUITE_REGISTRATION( decaf::internal::nio::CharArrayBufferTest );
#include <decaf/internal/nio/DoubleArrayBufferTest.h>
CPPUNIT_TEST_SUITE_REGISTRATION( decaf::internal::nio::DoubleArrayBufferTest );
#include <decaf/internal/nio/FloatArrayBufferTest.h>
CPPUNIT_TEST_SUITE_REGISTRATION( decaf::internal::nio::FloatArrayBufferTest );
#include <decaf/internal/nio/LongArrayBufferTest.h>
CPPUNIT_TEST_SUITE_REGISTRATION( decaf::internal::nio::LongArrayBufferTest );
#include <decaf/internal/nio/IntArrayBufferTest.h>
CPPUNIT_TEST_SUITE_REGISTRATION( decaf::internal::nio::IntArrayBufferTest );
#include <decaf/internal/nio/ShortArrayBufferTest.h>
CPPUNIT_TEST_SUITE_REGISTRATION( decaf::internal::nio::ShortArrayBufferTest );

#include <decaf/nio/BufferTest.h>
CPPUNIT_TEST_SUITE_REGISTRATION( decaf::nio::BufferTest );

#include <decaf/io/FilterInputStreamTest.h>
CPPUNIT_TEST_SUITE_REGISTRATION( decaf::io::FilterInputStreamTest );
#include <decaf/io/FilterOutputStreamTest.h>
CPPUNIT_TEST_SUITE_REGISTRATION( decaf::io::FilterOutputStreamTest );
#include <decaf/io/BufferedInputStreamTest.h>
CPPUNIT_TEST_SUITE_REGISTRATION( decaf::io::BufferedInputStreamTest );
#include <decaf/io/BufferedOutputStreamTest.h>
CPPUNIT_TEST_SUITE_REGISTRATION( decaf::io::BufferedOutputStreamTest );
#include <decaf/io/ByteArrayInputStreamTest.h>
CPPUNIT_TEST_SUITE_REGISTRATION( decaf::io::ByteArrayInputStreamTest );
#include <decaf/io/ByteArrayOutputStreamTest.h>
CPPUNIT_TEST_SUITE_REGISTRATION( decaf::io::ByteArrayOutputStreamTest );
#include <decaf/io/DataInputStreamTest.h>
CPPUNIT_TEST_SUITE_REGISTRATION( decaf::io::DataInputStreamTest );
#include <decaf/io/DataOutputStreamTest.h>
CPPUNIT_TEST_SUITE_REGISTRATION( decaf::io::DataOutputStreamTest );

#include <decaf/lang/MathTest.h>
CPPUNIT_TEST_SUITE_REGISTRATION( decaf::lang::MathTest );
#include <decaf/lang/ByteTest.h>
CPPUNIT_TEST_SUITE_REGISTRATION( decaf::lang::ByteTest );
#include <decaf/lang/CharacterTest.h>
CPPUNIT_TEST_SUITE_REGISTRATION( decaf::lang::CharacterTest );
#include <decaf/lang/BooleanTest.h>
CPPUNIT_TEST_SUITE_REGISTRATION( decaf::lang::BooleanTest );
#include <decaf/lang/ShortTest.h>
CPPUNIT_TEST_SUITE_REGISTRATION( decaf::lang::ShortTest );
#include <decaf/lang/IntegerTest.h>
CPPUNIT_TEST_SUITE_REGISTRATION( decaf::lang::IntegerTest );
#include <decaf/lang/LongTest.h>
CPPUNIT_TEST_SUITE_REGISTRATION( decaf::lang::LongTest );
#include <decaf/lang/FloatTest.h>
CPPUNIT_TEST_SUITE_REGISTRATION( decaf::lang::FloatTest );
#include <decaf/lang/DoubleTest.h>
CPPUNIT_TEST_SUITE_REGISTRATION( decaf::lang::DoubleTest );
#include <decaf/lang/ExceptionTest.h>
CPPUNIT_TEST_SUITE_REGISTRATION( decaf::lang::ExceptionTest );
#include <decaf/lang/ThreadTest.h>
CPPUNIT_TEST_SUITE_REGISTRATION( decaf::lang::ThreadTest );
#include <decaf/lang/SystemTest.h>
CPPUNIT_TEST_SUITE_REGISTRATION( decaf::lang::SystemTest );

#include <decaf/net/SocketFactoryTest.h>
CPPUNIT_TEST_SUITE_REGISTRATION( decaf::net::SocketFactoryTest );
#include <decaf/net/SocketTest.h>
CPPUNIT_TEST_SUITE_REGISTRATION( decaf::net::SocketTest );
#include <decaf/net/URITest.h>
CPPUNIT_TEST_SUITE_REGISTRATION( decaf::net::URITest );
#include <decaf/net/URISyntaxExceptionTest.h>
CPPUNIT_TEST_SUITE_REGISTRATION( decaf::net::URISyntaxExceptionTest );

#include <decaf/util/concurrent/CountDownLatchTest.h>
CPPUNIT_TEST_SUITE_REGISTRATION( decaf::util::concurrent::CountDownLatchTest );
#include <decaf/util/concurrent/MutexTest.h>
CPPUNIT_TEST_SUITE_REGISTRATION( decaf::util::concurrent::MutexTest );
#include <decaf/util/concurrent/ThreadPoolTest.h>
CPPUNIT_TEST_SUITE_REGISTRATION( decaf::util::concurrent::ThreadPoolTest );

#include <decaf/util/DateTest.h>
CPPUNIT_TEST_SUITE_REGISTRATION( decaf::util::DateTest );
#include <decaf/util/UUIDTest.h>
CPPUNIT_TEST_SUITE_REGISTRATION( decaf::util::UUIDTest );
#include <decaf/util/MapTest.h>
CPPUNIT_TEST_SUITE_REGISTRATION( decaf::util::MapTest );
#include <decaf/util/QueueTest.h>
CPPUNIT_TEST_SUITE_REGISTRATION( decaf::util::QueueTest );
#include <decaf/util/RandomTest.h>
CPPUNIT_TEST_SUITE_REGISTRATION( decaf::util::RandomTest );
#include <decaf/util/SetTest.h>
CPPUNIT_TEST_SUITE_REGISTRATION( decaf::util::SetTest );
#include <decaf/util/StringTokenizerTest.h>
CPPUNIT_TEST_SUITE_REGISTRATION( decaf::util::StringTokenizerTest );