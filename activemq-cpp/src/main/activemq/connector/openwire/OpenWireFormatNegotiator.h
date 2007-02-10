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

#ifndef _ACTIVEMQ_CONNECTOR_OPENWIRE_OPENWIREFORMATNEGOTIATOR_H_
#define _ACTIVEMQ_CONNECTOR_OPENWIRE_OPENWIREFORMATNEGOTIATOR_H_

#include <activemq/transport/TransportFilter.h>
#include <activemq/transport/Command.h>
#include <activemq/concurrent/Mutex.h>
#include <activemq/concurrent/CountDownLatch.h>
#include <activemq/concurrent/Concurrent.h>
#include <activemq/connector/openwire/OpenWireFormat.h>

namespace activemq{
namespace connector{
namespace openwire{

    class OpenWireFormatNegotiator : public transport::TransportFilter
    {
    private:

        /**
         * Time to wait before we declare that the negotiation has timed out.
         */
        static const int negotiationTimeout = 15000;

        /**
         * Have we started already?
         */
        bool firstTime;

        /**
         * Latch to count down till we receive the wireFormat info
         */
        concurrent::CountDownLatch wireInfoSentDownLatch;
        concurrent::CountDownLatch readyCountDownLatch;

        /**
         * The OpenWireFormat object that we use in negotiation.
         */
        OpenWireFormat* openWireFormat;

        /**
         * Indicates Transport has shut down
         */
        bool closed;

    public:

        /**
         * Constructor - Initializes this object around another Transport
         * @param openWireFormat - The WireFormat object we use to negotiate
         * @param next - The next transport in the chain
         * @param own - do we own the Transport pointer.
         */
        OpenWireFormatNegotiator( OpenWireFormat* openWireFormat,
                                  transport::Transport* next,
                                  const bool own = true );

        virtual ~OpenWireFormatNegotiator();

        /**
         * Sends a one-way command.  Does not wait for any response from the
         * broker.
         * @param command the command to be sent.
         * @throws CommandIOException if an exception occurs during writing of
         * the command.
         * @throws UnsupportedOperationException if this method is not implemented
         * by this transport.
         */
        virtual void oneway( transport::Command* command )
            throw( transport::CommandIOException, exceptions::UnsupportedOperationException );

        /**
         * This is called in the context of the nested transport's
         * reading thread.  In the case of a response object,
         * updates the request map and notifies those waiting on the
         * response.  Non-response messages are just delegated to
         * the command listener.
         * @param command the received from the nested transport.
         */
        virtual void onCommand( transport::Command* command );

        /**
         * Starts this transport object and creates the thread for
         * polling on the input stream for commands.  If this object
         * has been closed, throws an exception.  Before calling start,
         * the caller must set the IO streams and the reader and writer
         * objects.
         * @throws CMSException if an error occurs or if this transport
         * has already been closed.
         */
        virtual void start() throw( cms::CMSException );

        /**
         * Stops the polling thread and closes the streams.  This can
         * be called explicitly, but is also called in the destructor. Once
         * this object has been closed, it cannot be restarted.
         * @throws CMSException if errors occur.
         */
        virtual void close() throw( cms::CMSException );

    };

}}}

#endif /*_ACTIVEMQ_CONNECTOR_OPENWIRE_OPENWIREFORMATNEGOTIATOR_H_*/
