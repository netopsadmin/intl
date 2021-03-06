// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/**
 * This contains a reader that accesses data using the HttpRequest
 * facility, and thus works only in the web browser.
 */

library http_request_data_reader;

import 'dart:html';
import 'intl_helpers.dart';

class HTTPRequestDataReader implements LocaleDataReader {

  /** The base url from which we read the data. */
  String url;
  HTTPRequestDataReader(this.url);

  Future read(String locale) {
    var completer = new Completer();
    var source = '$url$locale.json';
    var request = new HttpRequest.get(
        source,
        (req) => completer.complete(req.responseText));
    return completer.future;
 }
}
