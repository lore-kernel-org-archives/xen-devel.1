From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/3] xen: drop preempt_count() for non-debug
 builds
Date: Wed, 22 May 2019 12:17:51 +0200
Message-ID: <ad0e1bdd-9e5e-d28c-e9d1-32c2e9cd8490@suse.com>
References: <20190522094549.28397-1-jgross@suse.com>
 <20190522094549.28397-3-jgross@suse.com> <5CE5207A0200007800231481@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aAGA=TW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hTOJn-0001SG-BE
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 10:17:55 +0000
In-Reply-To: <5CE5207A0200007800231481@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMDUvMjAxOSAxMjoxMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjIuMDUuMTkg
YXQgMTE6NDUsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBAQCAtMjYsOSArMjgsMTEgQEAg
REVDTEFSRV9QRVJfQ1BVKHVuc2lnbmVkIGludCwgX19wcmVlbXB0X2NvdW50KTsKPj4gICAgICBw
cmVlbXB0X2NvdW50KCktLTsgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4gIH0gd2hpbGUg
KDApCj4+ICAKPj4gLSNpZm5kZWYgTkRFQlVHCj4+ICB2b2lkIEFTU0VSVF9OT1RfSU5fQVRPTUlD
KHZvaWQpOwo+PiArCj4+ICAjZWxzZQo+PiArI2RlZmluZSBwcmVlbXB0X2Rpc2FibGUoKSAgICBi
YXJyaWVyKCk7Cj4+ICsjZGVmaW5lIHByZWVtcHRfZW5hYmxlKCkgICAgIGJhcnJpZXIoKTsKPiAK
PiBTdHJheSBzZW1pY29sb25zIChjb3VsZCBiZSBkcm9wcGVkIHdoaWxlIGNvbW1pdHRpbmcgaWYg
d2UgcmVhbGx5Cj4gd2FudCB0byBnbyB0aGlzIHJvdXRlKS4KCk9oLCByaWdodC4KCldpbGwgY29y
cmVjdCBpbiBWMi4KCgpKdWVyZ2VuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
