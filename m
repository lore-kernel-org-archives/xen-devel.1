From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 11/32] libxl_dm: Add
 libxl__qemu_qmp_path()
Date: Thu, 2 Aug 2018 10:41:57 +0200
Message-ID: <20180802084157.ylodthkbk4dzfnyt@mac>
References: <20180727140614.13256-1-anthony.perard@citrix.com>
 <20180727140614.13256-12-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=os/m=kr=citrix.com=prvs=7454c2131=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fl9Bv-0006pt-MR
 for xen-devel@lists.xenproject.org; Thu, 02 Aug 2018 08:42:39 +0000
Content-Disposition: inline
In-Reply-To: <20180727140614.13256-12-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKdWwgMjcsIDIwMTggYXQgMDM6MDU6NTNQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gLi4uIHdoaWNoIGdlbmVyYXRlIHRoZSBwYXRoIHRvIGEgUU1QIHNvY2tldCB0aGF0
IGxpYnhsIHVzZXMuCiAgICAgICAgICAgIF4gZ2VuZXJhdGVzCj4gCj4gU2lnbmVkLW9mZi1ieTog
QW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTog
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cgo+IC0tLQo+IAo+IE5vdGVz
Ogo+ICAgICBOZXcgaW4gdjQuCj4gCj4gIHRvb2xzL2xpYnhsL2xpYnhsX2RtLmMgICAgICAgfCA5
ICsrKysrKystLQo+ICB0b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oIHwgMSArCj4gIDIgZmls
ZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS90b29scy9saWJ4bC9saWJ4bF9kbS5jIGIvdG9vbHMvbGlieGwvbGlieGxfZG0uYwo+IGlu
ZGV4IGZkZDdmYTNiYTQuLjVjMjhhMGNlZDQgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvbGlieGwvbGli
eGxfZG0uYwo+ICsrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMKPiBAQCAtOTEwLDYgKzkxMCwx
MSBAQCBzdGF0aWMgY2hhciAqcWVtdV9kaXNrX2lkZV9kcml2ZV9zdHJpbmcobGlieGxfX2djICpn
YywgY29uc3QgY2hhciAqdGFyZ2V0X3BhdGgsCj4gICAgICByZXR1cm4gZHJpdmU7Cj4gIH0KPiAg
Cj4gK2NvbnN0IGNoYXIgKmxpYnhsX19xZW11X3FtcF9wYXRoKGxpYnhsX19nYyAqZ2MsIGludCBk
b21pZCkKPiArewo+ICsgICAgcmV0dXJuIEdDU1BSSU5URigiJXMvcW1wLWxpYnhsLSVkIiwgbGli
eGxfX3J1bl9kaXJfcGF0aCgpLCBkb21pZCk7Cj4gK30KCllvdSBjb3VsZCBwbGFjZSB0aGlzIGFz
IGEgc3RhdGljIGlubGluZSBmdW5jdGlvbiBpbiBsaWJ4bF9pbnRlcm5hbC5oCmRpcmVjdGx5IElN
Ty4KClJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
