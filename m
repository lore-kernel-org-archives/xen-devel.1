From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v5 01/15] libxl: Design of an async API to
 issue QMP commands to QEMU
Date: Thu, 11 Oct 2018 12:17:47 +0100
Message-ID: <20181011111747.GF1331@perard.uk.xensource.com>
References: <20180907151104.32306-1-anthony.perard@citrix.com>
 <20180907151104.32306-2-anthony.perard@citrix.com>
 <23486.6236.759607.459674@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qe5r=mx=citrix.com=prvs=815e876d9=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gAYya-0006yh-MZ
 for xen-devel@lists.xenproject.org; Thu, 11 Oct 2018 11:17:56 +0000
Content-Disposition: inline
In-Reply-To: <23486.6236.759607.459674@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBPY3QgMTAsIDIwMTggYXQgMDQ6MTg6NTJQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gQW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIHY1IDAxLzE1XSBsaWJ4bDogRGVz
aWduIG9mIGFuIGFzeW5jIEFQSSB0byBpc3N1ZSBRTVAgY29tbWFuZHMgdG8gUUVNVSIpOgo+ID4g
QWxsIHRoZSBmdW5jdGlvbnMgd2lsbCBiZSBpbXBsZW1lbnRlZCBpbiBsYXRlciBwYXRjaGVzLgo+
IAo+IFRoaXMgcGF0Y2ggbG9va3MgZ29vZCB0byBtZS4gIEFsdGhvdWdoIGl0J3MgYSBiaXQgb2Rk
IHRvIG1peCBzb21lCj4gdHlwZWRlZiBuYW1lIHNodWZmbGluZyBpbiB0aGUgc2FtZSBwYXRjaCwg
SSB0aGluayBpdCdzIE9LIGhlcmUgZ2l2ZW4KPiB0aGF0IHRoZSByZXN0IGlzIEFQSSBjb21tZW50
YXJ5Lgo+IAo+ID4gKy8qCj4gPiArICogUU1QIGFzeW5jaHJvbm91cyBjYWxscwo+ID4gKyAqCj4g
PiArICogVGhpcyBmYWNpbGl0eSBhbGxvd3MgYSBjb21tYW5kIHRvIGJlIHNlbnQgdG8gUUVNVSwg
YW5kIHRoZSByZXNwb25zZSB0byBiZQo+ID4gKyAqIGhhbmRlZCB0byBhIGNhbGxiYWNrIGZ1bmN0
aW9uLgo+ID4gKyAqCj4gPiArICogQ29tbWFuZHMgY2FuIGJlIGNoYWluZWQsIHdpdGggYSBzYW1l
IGNvbm5lY3Rpb24uIChlLmcuICJhZGQtZmQiIHdpbGwgbmVlZCB0bwo+ID4gKyAqIGJlIGNoYWlu
ZWQgdG8gdGhlIG5leHQgY29tbWFuZCkuIEEgbGlieGxfX2V2X3FtcCBjYW4gYmUgcmV1c2VkIHdo
ZW4gdGhlCj4gPiArICogY2FsbGJhY2sgaXMgYmVlbiBjYWxsZWQgaW4gb3JkZXIgdG8gdXNlIHRo
ZSBzYW1lIGNvbm5lY3Rpb24uCj4gCj4gSSB0aGluayB0aGUgd29yZCBgY2hhaW5lZCcgaGVyZSBj
b3VsZCBkbyB3aXRoIGRlZmluaXRpb24uICBJIHRoaW5rIHlvdQo+IGp1c3QgbWVhbiB0aGF0IHRo
ZXkgYXJlIG9uIHRoZSBzYW1lIGNvbm5lY3Rpb24gd2hpY2ggcmVtYWlucwo+IEFjdGl2ZS9Db25u
ZWN0ZWQgdGhyb3VnaG91dCA/CgpZZXMuCgoKTWF5YmUgSSBjb3VsZCBhdm9pZCB0aGUgd29yZCAi
Y2hhaW5lZCIgYW5kIHJlcGxhY2UgdGhhdCBwYXJhZ3JhcGggd2l0aApzb21ldGhpbmcgbGlrZToK
IkNvbW1hbmRzIGNhbiBiZSBzdWJtaXRlZCBvbmUgYWZ0ZXIgYW4gb3RoZXIgd2l0aCB0aGUgc2Ft
ZSBjb25uZWN0aW9uLgooZS5nLiB0aGUgcmVzdWx0IGZyb20gdGhlICJhZGQtZmQiIGNvbW1hbmQg
bmVlZCB0byBiZSB1c2UgaW4gYSBmb2xsb3ctdXAKY29tbWFuZCBiZWZvcmUgZGlzY29ubmVjdGlu
ZyBmcm9tIFFNUCkuIEEgbGlieGxfX2V2X3FtcCBjYW4gYmUgcmV1c2VkCndoZW4gdGhlIGNhbGxi
YWNrIGlzIGJlZW4gY2FsbGVkIGluIG9yZGVyIHRvIHVzZSB0aGUgc2FtZSBjb25uZWN0aW9uLiIK
Cj4gQWxzbywgY2FuIHlvdSBwbGVhc2Ugd3JhcCB0aGUgY29tbWVudGFyeSBsaW5lcyB0byA3MCBv
ciA3NSBjb2x1bW5zID8KPiBZb3VyIGN1cnJlbnQgNzktY2hhcmFjdGVyIGxpbmVzIGdldCB3cmFw
IGRhbWFnZSB3aGVuIGRpc3BsYXllZCBpbiA4MAo+IGNvbHVtbnMgd2l0aCB0aGUgYWRkZWQgYCsn
IGFuZCBhcmUgd29yc2Ugd2hlbiBgPiAnIGlzIGFkZGVkLgoKV2lsbCBkby4KCi0tIApBbnRob255
IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
