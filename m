From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 07/32] libxl_qmp: Move struct sockaddr_un
 variable to qmp_open()
Date: Thu, 2 Aug 2018 10:26:35 +0200
Message-ID: <20180802082635.b7k3vo7a43uaqpba@mac>
References: <20180727140614.13256-1-anthony.perard@citrix.com>
 <20180727140614.13256-8-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=os/m=kr=citrix.com=prvs=7454c2131=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fl8wX-0005C1-75
 for xen-devel@lists.xenproject.org; Thu, 02 Aug 2018 08:26:45 +0000
Content-Disposition: inline
In-Reply-To: <20180727140614.13256-8-anthony.perard@citrix.com>
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

T24gRnJpLCBKdWwgMjcsIDIwMTggYXQgMDM6MDU6NDlQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gVGhpcyB2YXJpYWJsZSBpcyBvbmx5IHVzZWQgb25jZSwgbm8gbmVlZCB0byBrZWVw
IGl0IGluIHRoZSBoYW5kbGVyLgo+IAo+IEFsc28gZml4IGNvZGluZyBzdHlsZSAocmVtb3ZlIHNw
YWNlIGFmdGVyIHNpemVvZikuCj4gQW5kIGFsbG93IHN0cm5jcHkgdG8gdXNlIGFsbCB0aGUgc3Bh
Y2UgaW4gc3VuX3BhdGguCj4gCj4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhv
bnkucGVyYXJkQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+Cgo+IC0tLQo+IAo+IE5vdGVzOgo+ICAgICB2NDoKPiAgICAgICAg
IGFjdHVhbGx5IGFsbG93IHN0cm5jcHkgdG8gdXNlIGFsbCB0aGUgc3BhY2UgaW4gc3VuX3BhdGgu
Cj4gCj4gIHRvb2xzL2xpYnhsL2xpYnhsX3FtcC5jIHwgMTQgKysrKysrLS0tLS0tLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvdG9vbHMvbGlieGwvbGlieGxfcW1wLmMgYi90b29scy9saWJ4bC9saWJ4bF9xbXAuYwo+
IGluZGV4IDk4N2JmMDIzMmUuLjFmZmExN2I2MzIgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvbGlieGwv
bGlieGxfcW1wLmMKPiArKysgYi90b29scy9saWJ4bC9saWJ4bF9xbXAuYwo+IEBAIC0xMDUsNyAr
MTA1LDYgQEAgdHlwZWRlZiBzdHJ1Y3QgY2FsbGJhY2tfaWRfcGFpciB7Cj4gIH0gY2FsbGJhY2tf
aWRfcGFpcjsKPiAgCj4gIHN0cnVjdCBsaWJ4bF9fcW1wX2hhbmRsZXIgewo+IC0gICAgc3RydWN0
IHNvY2thZGRyX3VuIGFkZHI7Cj4gICAgICBpbnQgcW1wX2ZkOwo+ICAgICAgYm9vbCBjb25uZWN0
ZWQ7Cj4gICAgICB0aW1lX3QgdGltZW91dDsKPiBAQCAtNDMxLDYgKzQzMCw3IEBAIHN0YXRpYyBp
bnQgcW1wX29wZW4obGlieGxfX3FtcF9oYW5kbGVyICpxbXAsIGNvbnN0IGNoYXIgKnFtcF9zb2Nr
ZXRfcGF0aCwKPiAgewo+ICAgICAgaW50IHJldCA9IC0xOwo+ICAgICAgaW50IGkgPSAwOwo+ICsg
ICAgc3RydWN0IHNvY2thZGRyX3VuIGFkZHI7CgpZb3UgY291bGQgZG86CgpzdHJ1Y3Qgc29ja2Fk
ZHJfdW4gYWRkciA9IHsgfTsKCkFuZCBnZXQgcmlkIG9mIHRoZSBtZW1zZXQgYmVsb3cuCgpUaGFu
a3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
