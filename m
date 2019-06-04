From: chenbaodong <chenbaodong@mxnavi.com>
Subject: Re: [PATCH v1] xen: make tracebuffer configurable
Date: Tue, 4 Jun 2019 16:39:08 +0800
Message-ID: <01f51119-2964-4b8f-0f97-d89cf38326bd@mxnavi.com>
References: <08d5ca37f0803dc7aa9906a9478407c3@sslemail.net>
 <5CF619640200007800234E6E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Rj+d=UD=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1hY4ya-00036e-3A
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 08:39:24 +0000
In-Reply-To: <5CF619640200007800234E6E@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Ck9uIDYvNC8xOSAxNToxMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDQuMDYuMTkgYXQg
MDI6NDQsIDxjaGVuYmFvZG9uZ0BteG5hdmkuY29tPiB3cm90ZToKPj4gLS0tIGEveGVuL2luY2x1
ZGUveGVuL3RyYWNlLmgKPj4gKysrIGIveGVuL2luY2x1ZGUveGVuL3RyYWNlLmgKPj4gQEAgLTIx
LDEyICsyMSwxNSBAQAo+PiAgICNpZm5kZWYgX19YRU5fVFJBQ0VfSF9fCj4+ICAgI2RlZmluZSBf
X1hFTl9UUkFDRV9IX18KPj4gICAKPj4gKyNpZmRlZiBDT05GSUdfVFJBQ0VCVUZGRVIKPj4gICBl
eHRlcm4gaW50IHRiX2luaXRfZG9uZTsKPj4gKyNlbmRpZgo+IElmIHRoaXMgaXMgdG8gc3RheSB1
cCBoZXJlICh3aGljaCBJJ20gc3RpbGwgbm90IHN1cmUgaXQgbmVlZHMgdG87IEkgaGFkCj4gbWVy
ZWx5IGluZGljYXRlZCB0aGF0IHRoZXJlIGxpa2VseSBpcyBhIHJlYXNvbiBmb3IgdGhpcyB3aXRo
b3V0IGFjdHVhbGx5Cj4ga25vd2luZyB3aGF0IHRoYXQgcmVhc29uIG1pZ2h0IGJlKSwgdGhlbiBJ
IHRoaW5rIHRoZSAjZGVmaW5lIG5lZWRzCj4gdG8gZ28gaGVyZSBhcyB3ZWxsLCBpbiBhbiAjZWxz
ZS4KClllcywgbmVlZCB0byBzdGF5IGhlcmUgYmVjYXVzZSAndGJfaW5pdF9kb25lJyB1c2VkIGlu
ICdhc20teDg2L3RyYWNlLmgnCgp3aGljaCBpbmNsdWRlZMKgIGJ5ICd4ZW4vdHJhY2UuaCfCoCBh
dCBsaW5lIDMyOiAjaW5jbHVkZSA8YXNtL3RyYWNlLmg+Cgp3aWxsIGJlIGZpeGVkIGluIG5leHQg
dmVyc2lvbi4KCj4KPj4gQEAgLTQ3LDYgKzUwLDIwIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB0cmFj
ZV92YXIodTMyIGV2ZW50LCBpbnQgY3ljbGVzLCBpbnQgZXh0cmEsCj4+ICAgdm9pZCBfX3RyYWNl
X2h5cGVyY2FsbCh1aW50MzJfdCBldmVudCwgdW5zaWduZWQgbG9uZyBvcCwKPj4gICAgICAgICAg
ICAgICAgICAgICAgICAgIGNvbnN0IHhlbl91bG9uZ190ICphcmdzKTsKPj4gICAKPj4gKyNlbHNl
Cj4+ICsjZGVmaW5lIHRiX2luaXRfZG9uZSBmYWxzZQo+PiArc3RhdGljIGlubGluZSB2b2lkIGlu
aXRfdHJhY2VfYnVmcyh2b2lkKSB7fQo+PiArc3RhdGljIGlubGluZSBpbnQgdGJfY29udHJvbChz
dHJ1Y3QgeGVuX3N5c2N0bF90YnVmX29wICp0YmMpIHsgcmV0dXJuIC1FTk9TWVM7IH0KPiAtRU9Q
Tk9UU1VQUAo+Cj4gSmFuCj4KPgo+IC4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
