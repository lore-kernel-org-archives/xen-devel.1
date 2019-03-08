From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v2] libxl: prepare environment for
 domcreate_stream_done
Date: Fri, 8 Mar 2019 14:08:10 +0000
Message-ID: <23682.30538.373590.52177@mariner.uk.xensource.com>
References: <20190308122415.29972-1-olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DpA2=RL=citrix.com=prvs=963cf6c57=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1h2GAi-0000Rz-MD
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2019 14:08:24 +0000
In-Reply-To: <20190308122415.29972-1-olaf@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T2xhZiBIZXJpbmcgd3JpdGVzICgiW1BBVENIIHYyXSBsaWJ4bDogcHJlcGFyZSBlbnZpcm9ubWVu
dCBmb3IgZG9tY3JlYXRlX3N0cmVhbV9kb25lIik6Cj4gVGhlIGZ1bmN0aW9uIGRvbWNyZWF0ZV9i
b290bG9hZGVyX2RvbmUgbWF5IGJyYW5jaCBlYXJseSB0bwo+IGRvbWNyZWF0ZV9zdHJlYW1fZG9u
ZSwgaW4gY2FzZSBzb21lIGVycm9yIG9jY291cmVkLiBIZXJlIHNycy0+ZGNzIHdpbGwgYmUKPiBO
VUxMLCB3aGljaCBsZWFkcyB0byBhIGNyYXNoLgoKVGhhbmtzLiAgSSB0aGluayB0aGlzIGlzIE9L
IGFzIGZhciBhcyBpdCBnb2VzLiAgQnV0OgoKPiArICAgIC8qIFByZXBhcmUgZW52aXJvbm1lbnQg
Zm9yIGRvbWNyZWF0ZV9zdHJlYW1fZG9uZSAqLwo+ICsgICAgZGNzLT5zcnMuZGNzID0gZGNzOwoK
VGhlIG5lZWQgZm9yIHRoaXMgY29tbWVudCBpcyB0ZWxsaW5nIHVzIHNvbWV0aGluZyBhYm91dCB0
aGUgd2VpcmQgY29kZQpzdHJ1Y3R1cmUgaGVyZS4gIFdlIGluaXRpYWxpc2UgYWxsIG9mIGRjcy0+
c3JzIG11Y2ggbGF0ZXIsIHNvIGV2ZW4Kd2l0aCB0aGlzIGNoYW5nZSB3ZSBjYWxsIGRvbWNyZWF0
ZV9zdHJlYW1fZG9uZSB3aXRoIGEKbW9zdGx5LXVuaW5pdGlhbGlzZWQgc3JzLgoKSW4gZmFjdCB0
aGlzIGlzIE9LIGJlY2F1c2UgZG9tY3JlYXRlX3N0cmVhbV9kb25lIG9ubHkgcmVhZHMgc3JzLT5k
Y3MKYW5kIHRoZW4gZG9lcyBldmVyeXRoaW5nIHdpdGggdGhlIG9idGFpbmVkIGRjcy4gIEJ1dCB0
aGVyZSBpcyBub3RoaW5nCnRoZXJlIHRvIGluZGljYXRlIHRoYXQgc3JzIG1pZ2h0IGJlIG1vc3Rs
eSB1bmluaXRpYWxpc2VkLiAgTWF5YmUgd2UKY291bGQgYWRkIGEgY29tbWVudCB0aGVyZSwgc29t
ZXRoaW5nIGxpa2U6CgogIC8qIE5CIHBlcmhhcHMgb25seSBzcnMtPmRjcyBpcyB2YWxpZDsgZWcg
aW4gdGhlIGNhc2Ugb2YgYW4KICAgKiBlYXJseSBicmFuY2ggdG8gZG9tY3JlYXRlX2Jvb3Rsb2Fk
ZXJfZG9uZSdzIGBvdXQnIGJsb2NrICovCgo/CgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
