From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3] tools: set Dom0 UUID if requested
Date: Fri, 23 Nov 2018 16:18:41 +0000
Message-ID: <20181123161841.pt4mms26yenh64vc@zion.uk.xensource.com>
References: <20181120180941.1005-1-wei.liu2@citrix.com>
 <20181123152849.GA6902@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=k4pk=oc=citrix.com=prvs=858f4146b=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gQEAI-0003cD-7h
 for xen-devel@lists.xenproject.org; Fri, 23 Nov 2018 16:18:46 +0000
Content-Disposition: inline
In-Reply-To: <20181123152849.GA6902@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Edwin =?iso-8859-1?B?VPZy9ms=?= <edvin.torok@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBOb3YgMjMsIDIwMTggYXQgMDM6Mjg6NDlQTSArMDAwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvaG90cGx1Zy9MaW51eC9zeXN0ZW1kL3hlbi1p
bml0LWRvbTAuc2VydmljZS5pbiBiL3Rvb2xzL2hvdHBsdWcvTGludXgvc3lzdGVtZC94ZW4taW5p
dC1kb20wLnNlcnZpY2UuaW4KPiA+IGluZGV4IDNiZWZhZGNlYTMuLmJlZWQzMTI2YzYgMTAwNjQ0
Cj4gPiAtLS0gYS90b29scy9ob3RwbHVnL0xpbnV4L3N5c3RlbWQveGVuLWluaXQtZG9tMC5zZXJ2
aWNlLmluCj4gPiArKysgYi90b29scy9ob3RwbHVnL0xpbnV4L3N5c3RlbWQveGVuLWluaXQtZG9t
MC5zZXJ2aWNlLmluCj4gPiBAQCAtNyw4ICs3LDkgQEAgQ29uZGl0aW9uUGF0aEV4aXN0cz0vcHJv
Yy94ZW4vY2FwYWJpbGl0aWVzCj4gPiAgW1NlcnZpY2VdCj4gPiAgVHlwZT1vbmVzaG90Cj4gPiAg
UmVtYWluQWZ0ZXJFeGl0PXRydWUKPiA+ICtFbnZpcm9ubWVudEZpbGU9QENPTkZJR19ESVJAL0BD
T05GSUdfTEVBRl9ESVJAL3hlbmNvbW1vbnMKPiA+ICBFeGVjU3RhcnRQcmU9L2Jpbi9ncmVwIC1x
IGNvbnRyb2xfZCAvcHJvYy94ZW4vY2FwYWJpbGl0aWVzCj4gPiAtRXhlY1N0YXJ0PUBMSUJFWEVD
X0JJTkAveGVuLWluaXQtZG9tMAo+ID4gK0V4ZWNTdGFydD1ATElCRVhFQ19CSU5AL3hlbi1pbml0
LWRvbTAgJFhFTl9ET00wX1VVSUQKPiA+ICAKPiA+ICBbSW5zdGFsbF0KPiA+ICBXYW50ZWRCeT1t
dWx0aS11c2VyLnRhcmdldAo+IAo+IERvbid0IHlvdSBuZWVkIHRvIG1vZGlmeSBGcmVlQlNEL3Jj
LmQveGVuY29tbW9ucy5pbiBhbmQKPiBOZXRCU0QvcmMuZC94ZW5jb21tb25zLmluIGFzIHdlbGw/
CgpJIGRpZG4ndCB3YW50IHRvIG1vZGlmeSB0aGVtIHdpdGhvdXQgaGF2aW5nIGEgdGVzdCBzZXR1
cCBmaXJzdC4gIFRoZQp4ZW4taW5pdC1kb20wIHByb2dyYW0gYWxyZWFkeSB0YWtlcyBpbnRvIGNv
bnNpZGVyYXRpb24gdGhhdCB0aGV5IGRvbid0CnByb3ZpZGUgVVVJRC4KCkkgY2FuIGRvIGl0IGlu
IHRoZSBuZXh0IHZlcnNpb24uCgpXZWkuCgo+IAo+IC0tIAo+IEFudGhvbnkgUEVSQVJECgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
