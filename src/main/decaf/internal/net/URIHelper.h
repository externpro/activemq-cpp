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

#ifndef _DECAF_INTERNAL_NET_URIHELPER_H_
#define _DECAF_INTERNAL_NET_URIHELPER_H_

#include <string>
#include <decaf/net/URISyntaxException.h>

namespace decaf {
namespace internal {
namespace net {

    /**
     * Helper class used by the URI classes in encoding and decoding of URI's.
     */
    class URIHelper {
    private:

        /**
         * All characters that are legal in a URI
         */
        std::string allLegal;

    public:

        /**
         * Create a URIHelper with the assigned set of Legal URI Characters.
         * @param allLegal - All Characters that are legal in this URI instance.
         */
        URIHelper( const std::string& allLegal );

        virtual ~URIHelper() {}

        /**
         * Validate that the URI Query Segment contains no invalid encodings.
         * @param uri - the full uri.
         * @param query - the query to check.
         * @param index - position in the uri where fragment starts.
         * @throw URISyntaxException if the fragment has errors.
         */
        void validateQuery( const std::string& uri, const std::string& query,
                            std::size_t index )
            throw( decaf::net::URISyntaxException );

        /**
         * Validate that the URI fragment contains no invalid encodings.
         * @param uri - the full uri.
         * @param fragment - the fragment to check.
         * @param index - position in the uri where fragment starts.
         * @throw URISyntaxException if the fragment has errors.
         */
        void validateFragment( const std::string& uri, const std::string& fragment,
                               std::size_t index )
            throw( decaf::net::URISyntaxException );

        /**
         * determine the host, port and user-info if the authority parses
         * successfully to a server based authority
         * <p>
         * behavior in error cases: if forceServer is true, throw
         * URISyntaxException with the proper diagnostic messages. if
         * forceServer is false assume this is a registry based uri, and just
         * return leaving the host, port and user-info fields undefined.
         * <p>
         * and there are some error cases where URISyntaxException is thrown
         * regardless of the forceServer parameter e.g. mal-formed ipv6 address
         * <p>
         * @param forceServer
         * @param authority
         * @throw URISyntaxException
         */
        void parseAuthority( bool forceServer, const std::string& authority )
            throw( decaf::net::URISyntaxException );

        /**
         * Check the supplied user info for validity.
         * @param uri - the uri to parse.
         * @param userinfo - supplied user info
         * @return true if valid
         * @throw URISyntaxException if an error occurs
         */
        void validateUserinfo( const std::string& uri, const std::string& userinfo, std::size_t index )
            throw( decaf::net::URISyntaxException );

        /**
         * distinguish between IPv4, IPv6, domain name and validate it based on
         * its type
         * @param forceServer
         * @param host - Host string to validate
         * @return true if the host value if a valid domain name
         * @throws URISyntaxException if the host is invalid and forceServer is true.
         */
        bool isValidHost( bool forceServer, const std::string& host )
            throw( decaf::net::URISyntaxException );

        /**
         * Validates the string past to determine if it is a well formed
         * domain name.
         * @param host - domain name to validate.
         * @return true if host is well formed.
         */
        bool isValidDomainName( const std::string& host );

        /**
         * Validate if the host value is a well formed IPv4 address, this is
         * the form XXX.XXX.XXX.XXX were X is any number 0-9. and XXX is not
         * greater than 255.
         * @param host - IPv4 address string to parse.
         * @return true if host is a well formed IPv4 address.
         */
        bool isValidIPv4Address( const std::string& host );

        /**
         * Determines if the given address is valid according to the IPv6 spec.
         * @param ipAddress - string ip address value to validate.
         * @return true if the address string is valid.
         */
        bool isValidIP6Address( const std::string& ipAddress );

        /**
         * Check is the string passed contains a Valid IPv4 word, which is
         * an integer in the range of 0 to 255.
         * @param word - string value to check.
         * @return true if the word is a valid IPv4 word.
         */
        bool isValidIP4Word( const std::string& word );

        /**
         * Determines if the given char is a valid Hex char.  Valid
         * chars are A-F (upper or lower case) and 0-9.
         * @param c - char to inspect
         * @return true if c is a valid hex char.
         */
        bool isValidHexChar( char c );

    };

}}}

#endif /* _DECAF_INTERNAL_NET_URIHELPER_H_ */
