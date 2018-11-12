From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v5 11/15] libxl_dm: Pre-open QMP socket for
 QEMU
Date: Mon, 12 Nov 2018 15:14:30 +0000
Message-ID: <23529.39126.887208.455960@mariner.uk.xensource.com>
References: <20180907151104.32306-1-anthony.perard@citrix.com>
 <20180907151104.32306-12-anthony.perard@citrix.com>
 <23493.61815.315512.256184@mariner.uk.xensource.com>
 <20181112145256.GF1302@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=0ka0=nx=citrix.com=prvs=847df0986=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gMDv9-0006R4-SK
 for xen-devel@lists.xenproject.org; Mon, 12 Nov 2018 15:14:35 +0000
In-Reply-To: <20181112145256.GF1302@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtQQVRDSCB2NSAxMS8xNV0gbGlieGxfZG06IFBy
ZS1vcGVuIFFNUCBzb2NrZXQgZm9yIFFFTVUiKToKPiBPbiBUdWUsIE9jdCAxNiwgMjAxOCBhdCAw
MzoxMTowM1BNICswMTAwLCBJYW4gSmFja3NvbiB3cm90ZToKPiA+IEFudGhvbnkgUEVSQVJEIHdy
aXRlcyAoIltQQVRDSCB2NSAxMS8xNV0gbGlieGxfZG06IFByZS1vcGVuIFFNUCBzb2NrZXQgZm9y
IFFFTVUiKToKPiA+ID4gICAgICByZXQgPSBsaWJ4bF9fYnVpbGRfZGV2aWNlX21vZGVsX2FyZ3Mo
Z2MsICJzdHViZG9tLWRtIiwgZ3Vlc3RfZG9taWQsCj4gPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGd1ZXN0X2NvbmZpZywgJmFyZ3MsIE5VTEwsCj4gPiA+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRfc3RhdGUsIE5VTEwpOwo+
ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkX3N0YXRlLCBO
VUxMLCBOVUxMKTsKPiA+IAo+ID4gRGlkIHlvdSBjb25zaWRlciBhZGRpbmcgZG1fbW9uaXRvcl9m
ZCB0byBkX3N0YXRlID8KPiAKPiBObywgSSBkaWRuJ3QsIEknbSBub3Qgc3VyIHdoYXQgY2FuIGdv
IGludG8gZF9zdGF0ZS4gQnV0IHRoYXQgc2VlbXMKPiBiZXR0ZXIgdGhhdCBhZGRpbmcgYW4gYXJn
dW1lbnQgdG8gbWFueSBmdW5jdGlvbiBwcm90b3R5cGVzLgoKSSB0aGluayBwcmV0dHkgbXVjaCBh
bnl0aGluZyB0byBkbyB3aXRoIGNyZWF0aW5nIGEgZG9tYWluIGNhbiBnbyBpbgp0aGVyZS4KCj4g
T24gdGhlIG90aGVyIGhhbmQsIEkgd291bGQgbmVlZCB0byBtYWtlIHN1cmUgdGhhdCBkbV9tb25p
dG9yX2ZkIGhhdmUgYQo+IHByb3BlciBpbml0aWFsIHZhbHVlICgtMSkgd2hlbiBuZWVkZWQuCgpZ
ZXMsIGl0IHdvdWxkIGhhdmUgdG8gYmUgaW5pdGlhbGlzZWQgYWxvbmcgd2l0aCB0aGUgb3RoZXIg
bWVtYmVycyBvZgpsaWJ4bF9fZG9tYWluX2J1aWxkX3N0YXRlLgoKSWFuLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
