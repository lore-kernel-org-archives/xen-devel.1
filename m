From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 21/34] x86/mm: p2m_flush and nvcpu_flush are
 HVM only
Date: Wed, 22 Aug 2018 15:14:12 +0100
Message-ID: <20180822141412.6awnbjpbm7kmopge@citrix.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <e8c4ff53a1b67c443b987cf77991787b53c30db0.1534518694.git-series.wei.liu2@citrix.com>
 <5B7BC6C802000078001E0467@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=om3v=lf=citrix.com=prvs=7650e4d92=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fsTto-00063w-PQ
 for xen-devel@lists.xenproject.org; Wed, 22 Aug 2018 14:14:16 +0000
Content-Disposition: inline
In-Reply-To: <5B7BC6C802000078001E0467@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBdWcgMjEsIDIwMTggYXQgMDI6MDE6MTJBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE3LjA4LjE4IGF0IDE3OjEyLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBwMm1fZmx1c2ggaXMgb25seSBjYWxsZWQgYnkgSEFQIGNvZGUsIG52Y3B1X2ZsdXNo
IGlzIG9ubHkgdXNlZnVsIGZvcgo+ID4gbmVzdGVkaHZtLCBib3RoIG9mIHdoaWNoIGRlcGVuZCBv
biBIVk0gc3VwcG9ydC4KPiA+IAo+ID4gRW5jbG9zZSB0aGVpciBjb2RlIGluIENPTkZJR19IVk0u
IEFkZCBhc3NlcnRpb25zLgo+IAo+IEJ1dCB3aHkgZG8geW91IHB1dCB0aGUgI2lmZGVmLXMgaW5z
aWRlIHRoZSBmdW5jdGlvbnMsIHJhdGhlciB0aGFuCj4gYXJvdW5kIHRoZW0/IEZyb20gd2hhdCB5
b3Ugc2F5LCB3aXRob3V0IENPTkZJR19IVk0gbm8gY2FsbGVyCj4gc2hvdWxkIGV4aXN0Lgo+IAo+
IEphbgo+IAo+ID4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4K
PiA+IC0tLQo+ID4gIHhlbi9hcmNoL3g4Ni9tbS9wMm0uYyB8IDYgKysrKysrCj4gPiAgMSBmaWxl
IGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L21tL3AybS5jIGIveGVuL2FyY2gveDg2L21tL3AybS5jCj4gPiBpbmRleCAxMDg5Yjg2Li4x
YTA0YjM0IDEwMDY0NAo+ID4gLS0tIGEveGVuL2FyY2gveDg2L21tL3AybS5jCj4gPiArKysgYi94
ZW4vYXJjaC94ODYvbW0vcDJtLmMKPiA+IEBAIC0xNzg1LDEwICsxNzg1LDEzIEBAIHAybV9mbHVz
aF90YWJsZShzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtKQo+ID4gIHZvaWQKPiA+ICBwMm1fZmx1c2go
c3RydWN0IHZjcHUgKnYsIHN0cnVjdCBwMm1fZG9tYWluICpwMm0pCgpUaGlzIGlzIGNhbGxlZCBi
eSBIQVAgY29kZSB3aGljaCBJIGRpZG4ndCBwdXQgdW5kZXIgQ09ORklHX0hWTSB5ZXQuCgpJIHdp
bGwgc2VlIGFib3V0IHJld29ya2luZyB0aGF0IHBhcnQgdG8gcHV0IEhBUCB1bmRlciBDT05GSUdf
SFZNLgoKPiA+ICB7Cj4gPiArI2lmIENPTkZJR19IVk0KPiA+ICsgICAgQVNTRVJUKGlzX2h2bV92
Y3B1KHYpKTsKPiA+ICAgICAgQVNTRVJUKHYtPmRvbWFpbiA9PSBwMm0tPmRvbWFpbik7Cj4gPiAg
ICAgIHZjcHVfbmVzdGVkaHZtKHYpLm52X3AybSA9IE5VTEw7Cj4gPiAgICAgIHAybV9mbHVzaF90
YWJsZShwMm0pOwo+ID4gICAgICBodm1fYXNpZF9mbHVzaF92Y3B1KHYpOwo+ID4gKyNlbmRpZgo+
ID4gIH0KPiA+ICAKPiA+ICB2b2lkCj4gPiBAQCAtMTgzOSw4ICsxODQyLDExIEBAIHN0YXRpYyB2
b2lkIGFzc2lnbl9ucDJtKHN0cnVjdCB2Y3B1ICp2LCBzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtKQo+
ID4gIAo+ID4gIHN0YXRpYyB2b2lkIG52Y3B1X2ZsdXNoKHN0cnVjdCB2Y3B1ICp2KQoKVGhpcyBp
cyByZWZlcmVuY2VkIGJ5IGFub3RoZXIgSFZNIGZ1bmN0aW9uLiBNYXliZSBJIGNhbiByZXNodWZm
bGUgY29kZSBhCmJpdCBtb3JlIHRvIG1ha2UgaXQgd29yay4KCldlaS4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
