From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/1] xen/gnttab: print log at level
 XENLOG_ERR before panic
Date: Tue, 23 Apr 2019 11:37:42 +0100
Message-ID: <d34d784e-9db9-b646-4099-8b787308fef2@citrix.com>
References: <1555936799-15675-1-git-send-email-dongli.zhang@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RGA1=SZ=citrix.com=prvs=00953f314=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hIso6-0006NY-HM
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 10:37:46 +0000
In-Reply-To: <1555936799-15675-1-git-send-email-dongli.zhang@oracle.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dongli Zhang <dongli.zhang@oracle.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, konrad.wilk@oracle.com, George.Dunlap@eu.citrix.com, tim@xen.org, ian.jackson@eu.citrix.com, julien.grall@arm.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMDQvMjAxOSAxMzozOSwgRG9uZ2xpIFpoYW5nIHdyb3RlOgo+IFByaW50IGxvZyBhdCBs
ZXZlbCBYRU5MT0dfRVJSIChpbnN0ZWFkIFhFTkxPR19JTkZPKSBhcyBkb21haW5fY3Jhc2goKQo+
IGluZGljYXRlcyB0aGVyZSBpcyBmYXRhbCBlcnJvci4KPgo+IFNpZ25lZC1vZmYtYnk6IERvbmds
aSBaaGFuZyA8ZG9uZ2xpLnpoYW5nQG9yYWNsZS5jb20+Cj4gLS0tCj4gIHhlbi9jb21tb24vZ3Jh
bnRfdGFibGUuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jIGIveGVu
L2NvbW1vbi9ncmFudF90YWJsZS5jCj4gaW5kZXggODA3MjhlYS4uNzI1YzYxOCAxMDA2NDQKPiAt
LS0gYS94ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMKPiArKysgYi94ZW4vY29tbW9uL2dyYW50X3Rh
YmxlLmMKPiBAQCAtMTI4Miw3ICsxMjgyLDcgQEAgdW5tYXBfY29tbW9uKAo+ICAgICAgaWYgKCB1
bmxpa2VseSgocmQgPSByY3VfbG9ja19kb21haW5fYnlfaWQoZG9tKSkgPT0gTlVMTCkgKQo+ICAg
ICAgewo+ICAgICAgICAgIC8qIFRoaXMgY2FuIGhhcHBlbiB3aGVuIGEgZ3JhbnQgaXMgaW1wbGlj
aXRseSB1bm1hcHBlZC4gKi8KPiAtICAgICAgICBnZHByaW50ayhYRU5MT0dfSU5GTywgIkNvdWxk
IG5vdCBmaW5kIGRvbWFpbiAlZFxuIiwgZG9tKTsKPiArICAgICAgICBnZHByaW50ayhYRU5MT0df
RVJSLCAiQ291bGQgbm90IGZpbmQgZG9tYWluICVkXG4iLCBkb20pOwoKV2hpbGUgSSBhZ3JlZSB3
aXRoIHRoZSBjaGFuZ2UgaW4gcHJpbmNpcGxlLCB3aGF0IGRvZXMgdGhpcyBhY3R1YWxseSBkbz/C
oApUaGUgZW50aXJlIHByaW50aygpIGlzIGNvbXBpbGVkIG91dCBpbiByZWxlYXNlIGJ1aWxkcywg
YW5kIGRlYnVnIGJ1aWxkcwpsb2cgYWxsIG1lc3NhZ2VzLgoKfkFuZHJldwoKPiAgICAgICAgICBk
b21haW5fY3Jhc2gobGQpOyAvKiBuYXVnaHR5Li4uICovCj4gICAgICAgICAgcmV0dXJuOwo+ICAg
ICAgfQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
