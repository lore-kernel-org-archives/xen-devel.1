From: "Jan Beulich" <JBeulich@suse.com>
Subject: Ping: [PATCH] AMD/IOMMU: adjust IOMMU list head
 initialization
Date: Thu, 02 May 2019 08:50:44 -0600
Message-ID: <5CCB03C4020000780022B53F@prv1-mh.provo.novell.com>
References: <5CADB95A0200007800226174@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hMD2v-0005wr-Im
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 14:50:49 +0000
In-Reply-To: <5CADB95A0200007800226174@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEwLjA0LjE5IGF0IDExOjM3LCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+IERv
IHRoaXMgc3RhdGljYWxseSwgd2hpY2ggd2lsbCBhbGxvdyBhY2Nlc3NpbmcgdGhlIChlbXB0eSkg
bGlzdCBldmVuCj4gd2l0aG91dCBoYXZpbmcgY29tZSB0aHJvdWdoIGFjcGlfaXZyc19pbml0KCku
Cj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+
IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbml0LmMKPiArKysgYi94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5pdC5jCj4gQEAgLTM2LDcgKzM2LDcg
QEAgc3RhdGljIHN0cnVjdCB0YXNrbGV0IGFtZF9pb21tdV9pcnFfdGFzawo+ICB1bnNpZ25lZCBp
bnQgX19yZWFkX21vc3RseSBpdnJzX2JkZl9lbnRyaWVzOwo+ICB1OCBfX3JlYWRfbW9zdGx5IGl2
aGRfdHlwZTsKPiAgc3RhdGljIHN0cnVjdCByYWRpeF90cmVlX3Jvb3QgaXZyc19tYXBzOwo+IC1z
dHJ1Y3QgbGlzdF9oZWFkIGFtZF9pb21tdV9oZWFkOwo+ICtMSVNUX0hFQURfUkVBRF9NT1NUTFko
YW1kX2lvbW11X2hlYWQpOwo+ICBzdHJ1Y3QgdGFibGVfc3RydWN0IGRldmljZV90YWJsZTsKPiAg
Ym9vbF90IGlvbW11djJfZW5hYmxlZDsKPiAgCj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvYW1kL3BjaV9hbWRfaW9tbXUuYwo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2Ft
ZC9wY2lfYW1kX2lvbW11LmMKPiBAQCAtMTUwLDggKzE1MCw2IEBAIHN0YXRpYyB2b2lkIGFtZF9p
b21tdV9zZXR1cF9kb21haW5fZGV2aWMKPiAgCj4gIGludCBfX2luaXQgYWNwaV9pdnJzX2luaXQo
dm9pZCkKPiAgewo+IC0gICAgSU5JVF9MSVNUX0hFQUQoJmFtZF9pb21tdV9oZWFkKTsKPiAtCj4g
ICAgICBpZiAoICFpb21tdV9lbmFibGUgJiYgIWlvbW11X2ludHJlbWFwICkKPiAgICAgICAgICBy
ZXR1cm4gMDsKPiAgCj4gCj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Cj4gWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnIAo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWwgCgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
