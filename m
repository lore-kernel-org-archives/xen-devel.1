From: "Jan Beulich" <JBeulich@suse.com>
Subject: Ping: [PATCH] ns16550/PCI: fix skipping of devices
Date: Fri, 26 Oct 2018 05:05:35 -0600
Message-ID: <5BD2F4FF02000078001F50B7@prv1-mh.provo.novell.com>
References: <5BB2440402000078001ED654@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=n7n6=ng=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gFzvx-0000Ds-TE
 for xen-devel@lists.xenproject.org; Fri, 26 Oct 2018 11:05:41 +0000
In-Reply-To: <5BB2440402000078001ED654@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjEwLjE4IGF0IDE3OjU3LCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+IFNl
bGVjdGluZyBiZXR3ZWVuIHNpbmdsZS9tdWx0aXBsZSBCQVIgbW9kZSBzaG91bGQgaGFwcGVuIGFm
dGVyIGNoZWNraW5nCj4gd2hldGhlciB0byBza2lwIHRoZSBwcmVzZW50IGRldmljZSwgb3IgZWxz
ZSBtdWx0aS1CQVIgZGV2aWNlcyB3b24ndCBiZQo+IHNraXBwZWQgY29ycmVjdGx5LCBkdWUgdG8g
cG9ydF9pZHggZ2V0dGluZyBzZXQgdG8gemVybyBpbiB0aGF0IGNhc2UuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IC0tLSBhL3hlbi9kcml2
ZXJzL2NoYXIvbnMxNjU1MC5jCj4gKysrIGIveGVuL2RyaXZlcnMvY2hhci9uczE2NTUwLmMKPiBA
QCAtMTAzNywxOCArMTAzNywxOCBAQCBwY2lfdWFydF9jb25maWcoc3RydWN0IG5zMTY1NTAgKnVh
cnQsIGJvCj4gICAgICAgICAgICAgICAgICAgICAgfQo+ICAgICAgICAgICAgICAgICAgfQo+ICAK
PiAtICAgICAgICAgICAgICAgIGlmICggIXBhcmFtLT5iYXIwICkKPiAtICAgICAgICAgICAgICAg
IHsKPiAtICAgICAgICAgICAgICAgICAgICBiYXJfaWR4ID0gaWR4Owo+IC0gICAgICAgICAgICAg
ICAgICAgIHBvcnRfaWR4ID0gMDsKPiAtICAgICAgICAgICAgICAgIH0KPiAtCj4gICAgICAgICAg
ICAgICAgICBpZiAoIHBvcnRfaWR4ID49IHBhcmFtLT5tYXhfcG9ydHMgKQo+ICAgICAgICAgICAg
ICAgICAgewo+ICAgICAgICAgICAgICAgICAgICAgIGlkeCAtPSBwYXJhbS0+bWF4X3BvcnRzOwo+
ICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ICAgICAgICAgICAgICAgICAgfQo+ICAK
PiArICAgICAgICAgICAgICAgIGlmICggIXBhcmFtLT5iYXIwICkKPiArICAgICAgICAgICAgICAg
IHsKPiArICAgICAgICAgICAgICAgICAgICBiYXJfaWR4ID0gaWR4Owo+ICsgICAgICAgICAgICAg
ICAgICAgIHBvcnRfaWR4ID0gMDsKPiArICAgICAgICAgICAgICAgIH0KPiArCj4gICAgICAgICAg
ICAgICAgICB1YXJ0LT5pb19iYXNlID0gMDsKPiAgICAgICAgICAgICAgICAgIGJhciA9IHBjaV9j
b25mX3JlYWQzMigwLCBiLCBkLCBmLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFBDSV9CQVNFX0FERFJFU1NfMCArIGJhcl9pZHgqNCk7Cj4gCj4gCj4gCj4gCj4gCj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Cj4gWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIAo+IGh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWwgCgoKCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
