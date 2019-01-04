From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v7 06/14] libxl_qmp: Implementation of
 libxl__ev_qmp_*
Date: Fri, 4 Jan 2019 11:41:58 +0000
Message-ID: <20190104114158.GB1508@perard.uk.xensource.com>
References: <20181123135355.6001-1-anthony.perard@citrix.com>
 <20181123135355.6001-7-anthony.perard@citrix.com>
 <23581.2162.571088.595084@mariner.uk.xensource.com>
 <20190103124018.GE1288@perard.uk.xensource.com>
 <23599.16807.146733.72837@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OewZ=PM=citrix.com=prvs=90051d582=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gfNrV-0005CD-SL
 for xen-devel@lists.xenproject.org; Fri, 04 Jan 2019 11:42:01 +0000
Content-Disposition: inline
In-Reply-To: <23599.16807.146733.72837@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKYW4gMDQsIDIwMTkgYXQgMTE6MjE6MTFBTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gQW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtQQVRDSCB2NyAwNi8xNF0gbGlieGxf
cW1wOiBJbXBsZW1lbnRhdGlvbiBvZiBsaWJ4bF9fZXZfcW1wXyoiKToKPiA+IE9uIEZyaSwgRGVj
IDIxLCAyMDE4IGF0IDAzOjM2OjE4UE0gKzAwMDAsIElhbiBKYWNrc29uIHdyb3RlOgo+ID4gPiA+
ICsgICAgd2hpbGUgKGV2LT50eF9idWZfb2ZmIDwgZXYtPnR4X2J1Zl9sZW4pIHsKPiA+ID4gPiAr
ICAgICAgICByID0gd3JpdGUoZmQsIGV2LT50eF9idWYgKyBldi0+dHhfYnVmX29mZiwKPiA+ID4g
PiArICAgICAgICAgICAgICAgICAgZXYtPnR4X2J1Zl9sZW4gLSBldi0+dHhfYnVmX29mZik7Cj4g
PiA+ID4gKyAgICAgICAgaWYgKHIgPCAwKSB7Cj4gPiA+ID4gKyAgICAgICAgICAgIGlmIChlcnJu
byA9PSBFSU5UUikKPiA+ID4gPiArICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ID4gPiA+ICsg
ICAgICAgICAgICBpZiAoZXJybm8gPT0gRVdPVUxEQkxPQ0spCj4gPiA+ID4gKyAgICAgICAgICAg
ICAgICBicmVhazsKPiA+ID4gPiArICAgICAgICAgICAgTE9HRUQoRVJST1IsIGV2LT5kb21pZCwg
ImZhaWxlZCB0byB3cml0ZSB0byBRTVAgc29ja2V0Iik7Cj4gPiA+ID4gKyAgICAgICAgICAgIHJl
dHVybiBFUlJPUl9GQUlMOwo+ID4gPiA+ICsgICAgICAgIH0KPiA+ID4gPiArICAgICAgICBldi0+
dHhfYnVmX29mZiArPSByOwo+ID4gPiAKPiA+ID4gQ2FuIHlvdSBhc3NlcnQgdGhhdCB0aGUgdmFs
dWUgb2YgciB3YXMgd2l0aGluIHJhbmdlID8gIChQZXJoYXBzIHRoaXMKPiA+ID4gaXMgcGFyYW5v
aWEgb24gbXkgcGFydCwgYnV0LCBzdGlsbC4pCj4gPiAKPiA+IEkgZG8gYXNzZXJ0IHRoZSB2YWx1
ZSBvZiB0eF9idWZfb2ZmIHdoaWNoIGRvZXMgaW5jbHVkZSByLgo+ID4gQnV0IEkgY2FuIGFkZAo+
ID4gYGFzc2VydChyID4gMCAmJiByIDw9IChldi0+cnhfYnVmX3NpemUgLSBldi0+cnhfYnVmX3Vz
ZWQpKTsnLgo+IAo+IFllcy4gIEFzIEkgc2F5IHdvcnJ5aW5nIHRoYXQgd3JpdGUoKSBtaWdodCBy
ZXR1cm4gc29tZXRoaW5nIGluc2FuZSBpcwo+IHBlcmhhcHMgcGFyYW5vaWEuCj4gCj4gRG8geW91
IG1lYW4gYGV2LT50eF9idWZfbGVuIC0gZXYtPnR4X2J1Zl9vZmYnIGxpa2UgaW4gdGhlIHdyaXRl
IGNhbGwgPwoKSSB3YXMgbG9va2luZyBhdCB0aGUgd3JvbmcgZnVuY3Rpb24gOiguCgotLSAKQW50
aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
