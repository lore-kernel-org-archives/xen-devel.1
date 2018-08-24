From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [linux-3.18 bisection] complete
 test-amd64-amd64-xl-shadow
Date: Fri, 24 Aug 2018 10:37:38 +0100
Message-ID: <20180824093738.w6vw2oyekx3zrzho@citrix.com>
References: <E1ft0R1-0000Ei-7L@osstest.test-lab.xenproject.org>
 <20180824091314.dwcnmwfjctdre2pw@citrix.com>
 <b27568f003fb447a8526a038d5d23a80@AMSPEX02CL03.citrite.net>
 <20180824093458.yqpjn2bidhkyifo2@citrix.com>
 <867af023836249878d96196f9e1e27be@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=n8yf=lh=citrix.com=prvs=76773b150=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ft8XI-0002ys-13
 for xen-devel@lists.xenproject.org; Fri, 24 Aug 2018 09:37:44 +0000
Content-Disposition: inline
In-Reply-To: <867af023836249878d96196f9e1e27be@AMSPEX02CL03.citrite.net>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, osstest service owner <osstest-admin@xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBdWcgMjQsIDIwMTggYXQgMTA6MzU6NTJBTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IFdlaSBMaXUgW21h
aWx0bzp3ZWkubGl1MkBjaXRyaXguY29tXQo+ID4gU2VudDogMjQgQXVndXN0IDIwMTggMTA6MzUK
PiA+IFRvOiBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPgo+ID4gQ2M6IFdl
aSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+OyBvc3N0ZXN0IHNlcnZpY2Ugb3duZXIgPG9zc3Rl
c3QtCj4gPiBhZG1pbkB4ZW5wcm9qZWN0Lm9yZz47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwo+ID4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtsaW51eC0zLjE4IGJpc2VjdGlvbl0g
Y29tcGxldGUgdGVzdC1hbWQ2NC1hbWQ2NC0KPiA+IHhsLXNoYWRvdwo+ID4gCj4gPiBPbiBGcmks
IEF1ZyAyNCwgMjAxOCBhdCAxMDozMDoyNkFNICswMTAwLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4g
PiA+ID4gPiBGb3IgYmlzZWN0aW9uIHJldmlzaW9uLXR1cGxlIGdyYXBoIHNlZToKPiA+ID4gPiA+
ICAgIGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvcmVzdWx0cy9i
aXNlY3QvbGludXgtCj4gPiA+ID4gMy4xOC90ZXN0LWFtZDY0LWFtZDY0LXhsLXNoYWRvdy5ndWVz
dC1zdGFydC5odG1sCj4gPiA+ID4gPiBSZXZpc2lvbiBJRHMgaW4gZWFjaCBncmFwaCBub2RlIHJl
ZmVyLCByZXNwZWN0aXZlbHksIHRvIHRoZSBUcmVlcyBhYm92ZS4KPiA+ID4gPgo+ID4gPiA+IGRv
bWFpbmJ1aWxkZXI6IGRldGFpbDogdmNwdV94ODZfNjQ6IGNhbGxlZAo+ID4gPiA+IGRvbWFpbmJ1
aWxkZXI6IGRldGFpbDogdmNwdV94ODZfNjQ6IGNyMzogcGZuIDB4MjI0NSBtZm4gMHgyNDQ4NDUK
PiA+ID4gPiB4ZW5mb3JlaWdubWVtb3J5OiBlcnJvcjogaW9jdGwgZmFpbGVkOiBJbnZhbGlkIGFy
Z3VtZW50Cj4gPiA+ID4geGM6IGVycm9yOiBwYW5pYzogeGNfZG9tX2Jvb3QuYzo0MjA6IHhjX2Rv
bV9nbnR0YWJfc2VlZDogZmFpbGVkIHRvCj4gPiBhY3F1aXJlCj4gPiA+ID4gZDEgZ3JhbnQgdGFi
bGUgW2Vycm5vPTIyXQo+ID4gPiA+IDogSW50ZXJuYWwgZXJyb3IKPiA+ID4gPiBsaWJ4bDogZXJy
b3I6IGxpYnhsX2RvbS5jOjc1MDpsaWJ4bF9fYnVpbGRfZG9tOiB4Y19kb21fZ250dGFiX2luaXQg
ZmFpbGVkOgo+ID4gPiA+IEludmFsaWQgYXJndW1lbnQKPiA+ID4gPiBkb21haW5idWlsZGVyOiBk
ZXRhaWw6IHhjX2RvbV9yZWxlYXNlOiBjYWxsZWQKPiA+ID4gPgo+ID4gPgo+ID4gPiBUYWtpbmcg
YSBsb29rIG5vdy4uLiBKdXN0IGZvcmNpbmcgaGFwIG9mZiBkb2Vzbid0IGdlbmVyYXRlIGFuIGlt
bWVkaWF0ZQo+ID4gcmVwcm8gc28gSSdsbCBoYXZlIHRvIGhhdmUgYSBjbG9zZXIgbG9vayBhdCB0
aGUgZW52aXJvbm1lbnQuCj4gPiAKPiA+IE5vdGUgdGhlIExpbnV4IGJyYW5jaCBpcyAzLjE4LiBJ
J20gbm90IHN1cmUgaWYgdGhhdCByZWFsbHkgbWF0dGVycy4KPiA+IAo+IAo+IEkgdGhpbmsgdGhh
dCdzIHRoZSBndWVzdCB2ZXJzaW9uLCB3aGljaCBzaG91bGQgYmUgaXJyZWxldmFudC4gVHJ5aW5n
IHRvIGZpZ3VyZSBvdXQgZnJvbSB0aGUgbG9ncyB3aGF0IGRvbTAgaXMuCgpOby4gVGhhdCdzIHRo
ZSBob3N0IGtlcm5lbC4KCldlaS4KCj4gCj4gICBQYXVsCj4gCj4gPiBXZWkuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
