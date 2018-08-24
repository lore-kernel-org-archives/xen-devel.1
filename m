From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 21/34] x86/mm: p2m_flush and nvcpu_flush are
 HVM only
Date: Fri, 24 Aug 2018 18:19:41 +0100
Message-ID: <20180824171941.uxzrele5gonxv4px@citrix.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <e8c4ff53a1b67c443b987cf77991787b53c30db0.1534518694.git-series.wei.liu2@citrix.com>
 <5B7BC6C802000078001E0467@prv1-mh.provo.novell.com>
 <20180822141412.6awnbjpbm7kmopge@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=n8yf=lh=citrix.com=prvs=76773b150=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ftFkP-0002qv-83
 for xen-devel@lists.xenproject.org; Fri, 24 Aug 2018 17:19:45 +0000
Content-Disposition: inline
In-Reply-To: <20180822141412.6awnbjpbm7kmopge@citrix.com>
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

T24gV2VkLCBBdWcgMjIsIDIwMTggYXQgMDM6MTQ6MTJQTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBUdWUsIEF1ZyAyMSwgMjAxOCBhdCAwMjowMToxMkFNIC0wNjAwLCBKYW4gQmV1bGljaCB3
cm90ZToKPiA+ID4+PiBPbiAxNy4wOC4xOCBhdCAxNzoxMiwgPHdlaS5saXUyQGNpdHJpeC5jb20+
IHdyb3RlOgo+ID4gPiBwMm1fZmx1c2ggaXMgb25seSBjYWxsZWQgYnkgSEFQIGNvZGUsIG52Y3B1
X2ZsdXNoIGlzIG9ubHkgdXNlZnVsIGZvcgo+ID4gPiBuZXN0ZWRodm0sIGJvdGggb2Ygd2hpY2gg
ZGVwZW5kIG9uIEhWTSBzdXBwb3J0Lgo+ID4gPiAKPiA+ID4gRW5jbG9zZSB0aGVpciBjb2RlIGlu
IENPTkZJR19IVk0uIEFkZCBhc3NlcnRpb25zLgo+ID4gCj4gPiBCdXQgd2h5IGRvIHlvdSBwdXQg
dGhlICNpZmRlZi1zIGluc2lkZSB0aGUgZnVuY3Rpb25zLCByYXRoZXIgdGhhbgo+ID4gYXJvdW5k
IHRoZW0/IEZyb20gd2hhdCB5b3Ugc2F5LCB3aXRob3V0IENPTkZJR19IVk0gbm8gY2FsbGVyCj4g
PiBzaG91bGQgZXhpc3QuCj4gPiAKPiA+IEphbgo+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFdl
aSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgeGVuL2FyY2gveDg2
L21tL3AybS5jIHwgNiArKysrKysKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMo
KykKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMgYi94ZW4v
YXJjaC94ODYvbW0vcDJtLmMKPiA+ID4gaW5kZXggMTA4OWI4Ni4uMWEwNGIzNCAxMDA2NDQKPiA+
ID4gLS0tIGEveGVuL2FyY2gveDg2L21tL3AybS5jCj4gPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9t
bS9wMm0uYwo+ID4gPiBAQCAtMTc4NSwxMCArMTc4NSwxMyBAQCBwMm1fZmx1c2hfdGFibGUoc3Ry
dWN0IHAybV9kb21haW4gKnAybSkKPiA+ID4gIHZvaWQKPiA+ID4gIHAybV9mbHVzaChzdHJ1Y3Qg
dmNwdSAqdiwgc3RydWN0IHAybV9kb21haW4gKnAybSkKPiAKPiBUaGlzIGlzIGNhbGxlZCBieSBI
QVAgY29kZSB3aGljaCBJIGRpZG4ndCBwdXQgdW5kZXIgQ09ORklHX0hWTSB5ZXQuCj4gCj4gSSB3
aWxsIHNlZSBhYm91dCByZXdvcmtpbmcgdGhhdCBwYXJ0IHRvIHB1dCBIQVAgdW5kZXIgQ09ORklH
X0hWTS4KPiAKPiA+ID4gIHsKPiA+ID4gKyNpZiBDT05GSUdfSFZNCj4gPiA+ICsgICAgQVNTRVJU
KGlzX2h2bV92Y3B1KHYpKTsKPiA+ID4gICAgICBBU1NFUlQodi0+ZG9tYWluID09IHAybS0+ZG9t
YWluKTsKPiA+ID4gICAgICB2Y3B1X25lc3RlZGh2bSh2KS5udl9wMm0gPSBOVUxMOwo+ID4gPiAg
ICAgIHAybV9mbHVzaF90YWJsZShwMm0pOwo+ID4gPiAgICAgIGh2bV9hc2lkX2ZsdXNoX3ZjcHUo
dik7Cj4gPiA+ICsjZW5kaWYKPiA+ID4gIH0KPiA+ID4gIAo+ID4gPiAgdm9pZAo+ID4gPiBAQCAt
MTgzOSw4ICsxODQyLDExIEBAIHN0YXRpYyB2b2lkIGFzc2lnbl9ucDJtKHN0cnVjdCB2Y3B1ICp2
LCBzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtKQo+ID4gPiAgCj4gPiA+ICBzdGF0aWMgdm9pZCBudmNw
dV9mbHVzaChzdHJ1Y3QgdmNwdSAqdikKPiAKPiBUaGlzIGlzIHJlZmVyZW5jZWQgYnkgYW5vdGhl
ciBIVk0gZnVuY3Rpb24uIE1heWJlIEkgY2FuIHJlc2h1ZmZsZSBjb2RlIGEKPiBiaXQgbW9yZSB0
byBtYWtlIGl0IHdvcmsuCgpJdCBhcHBlYXJzIHRoYXQgbW9yZSBjb2RlIGNhbiBiZSBwdXQgdW5k
ZXIgQ09ORklHX0hWTS4gSSBoYXZlIGRvbmUgdGhhdC4KCldlaS4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
