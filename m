From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] pvcalls-front: 64-bit align flags
Date: Tue, 27 Feb 2018 13:32:32 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1802271328140.4239__27063.8493741446$1519767079$gmane$org@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1802271150020.4239@sstabellini-ThinkPad-X260>
 <b7ec592a-bbd1-48d3-1a1f-92a8ed4a1e48@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=bhja=fv=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1eqmrS-0002GZ-GT
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2018 21:32:34 +0000
In-Reply-To: <b7ec592a-bbd1-48d3-1a1f-92a8ed4a1e48@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: jgross@suse.com, xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAyNyBGZWIgMjAxOCwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDAyLzI3LzIw
MTggMDI6NTQgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IFdlIGFyZSB1c2luZyB0
ZXN0X2FuZF8qIG9wZXJhdGlvbnMgb24gdGhlIHN0YXR1cyBhbmQgZmxhZyBmaWVsZHMgb2YKPiA+
IHN0cnVjdCBzb2NrX21hcHBpbmcuIEhvd2V2ZXIsIHRoZXNlIGZ1bmN0aW9ucyByZXF1aXJlIHRo
ZSBvcGVyYW5kIHRvIGJlCj4gPiA2NC1iaXQgYWxpZ25lZCBvbiBhcm02NC4gQ3VycmVudGx5LCBv
bmx5IHN0YXR1cyBpcyA2NC1iaXQgYWxpZ25lZC4KPiA+Cj4gPiBNYWtlIGZsYWdzIDY0LWJpdCBh
bGlnbmVkIGJ5IGludHJvZHVjaW5nIGFuIGV4cGxpY2l0IHBhZGRpbmcgZmllbGQuCj4gPgo+ID4g
U2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vQGFwb3JldG8uY29tPgo+
ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9wdmNhbGxzLWZyb250LmMgYi9kcml2ZXJz
L3hlbi9wdmNhbGxzLWZyb250LmMKPiA+IGluZGV4IGNhNWI3NzMuLmFhMDdiMmEgMTAwNjQ0Cj4g
PiAtLS0gYS9kcml2ZXJzL3hlbi9wdmNhbGxzLWZyb250LmMKPiA+ICsrKyBiL2RyaXZlcnMveGVu
L3B2Y2FsbHMtZnJvbnQuYwo+ID4gQEAgLTc4LDYgKzc4LDcgQEAgc3RydWN0IHNvY2tfbWFwcGlu
ZyB7Cj4gPiAgI2RlZmluZSBQVkNBTExTX1NUQVRVU19CSU5EICAgICAgICAgIDEKPiA+ICAjZGVm
aW5lIFBWQ0FMTFNfU1RBVFVTX0xJU1RFTiAgICAgICAgMgo+ID4gIAkJCXVpbnQ4X3Qgc3RhdHVz
Owo+ID4gKwkJCXVpbnQ4X3QgcGFkWzddOwo+IAo+IERvZXMgdGhpcyBndWFyYW50ZWUgYWxpZ25t
ZW50IChmb3IgZWl0aGVyIHN0YXR1cyBvciBmbGFnKT8KClllczogc3RhdHVzIGlzIHBhcnQgb2Yg
YSBzdHJ1Y3QgYW5kIGEgdW5pb24uIFVuaW9ucyBhbmQgc3RydWN0cyBoYXZlIHRoZQphbGlnbm1l
bnQgb2YgdGhlaXIgbW9zdCBhbGlnbmVkIHR5cGUuIEluIHRoaXMgY2FzZSB0aGV5IGFyZSA2NC1i
aXQKYWxpZ25lZCwgYXMgc29tZSBvZiB0aGUgZmllbGRzIGFyZSBwb2ludGVycy4KClRoZSBwYWRk
aW5nIG1ha2VzIHN1cmUgdGhhdCBmbGFncyBpcyAxKzcgYnl0ZXMgZnJvbSBpdC4KCiAKPiA+ICAJ
CS8qCj4gPiAgCQkgKiBJbnRlcm5hbCBzdGF0ZS1tYWNoaW5lIGZsYWdzLgo+ID4gIAkJICogT25s
eSBvbmUgYWNjZXB0IG9wZXJhdGlvbiBjYW4gYmUgaW5mbGlnaHQgZm9yIGEgc29ja2V0Lgo+IAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
