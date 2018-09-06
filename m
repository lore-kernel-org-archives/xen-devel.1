From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v3 2/3] x86/HVM: add known_gla() emulation
 helper
Date: Thu, 6 Sep 2018 14:50:10 +0000
Message-ID: <64c102d7ae9c4e72b1f23d519c4265be@AMSPEX02CL03.citrite.net>
References: <5B87CF6302000078001E37A6@prv1-mh.provo.novell.com>
 <5B91249102000078001E5F08@prv1-mh.provo.novell.com>
 <5B9125B502000078001E5F1A@prv1-mh.provo.novell.com>
 <f94af765a03b45cfa562662284362a91@AMSPEX02CL03.citrite.net>
 <5B912A1202000078001E5F66@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gw3n=lu=citrix.com=prvs=7805f516e=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1fxvbp-0007Du-Jl
 for xen-devel@lists.xenproject.org; Thu, 06 Sep 2018 14:50:13 +0000
In-Reply-To: <5B912A1202000078001E5F66@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jan Beulich' <JBeulich@suse.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Olaf Hering <olaf@aepfle.de>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMDYgU2VwdGVtYmVyIDIwMTggMTQ6MjIKPiBUbzog
UGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPiBDYzogT2xhZiBIZXJpbmcg
PG9sYWZAYWVwZmxlLmRlPjsgQW5kcmV3IENvb3Blcgo+IDxBbmRyZXcuQ29vcGVyM0BjaXRyaXgu
Y29tPjsgeGVuLWRldmVsIDx4ZW4tCj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+Cj4gU3Vi
amVjdDogUkU6IFtQQVRDSCB2MyAyLzNdIHg4Ni9IVk06IGFkZCBrbm93bl9nbGEoKSBlbXVsYXRp
b24gaGVscGVyCj4gCj4gPj4+IE9uIDA2LjA5LjE4IGF0IDE1OjEyLCA8UGF1bC5EdXJyYW50QGNp
dHJpeC5jb20+IHdyb3RlOgo+ID4+ICAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4+IEZy
b206IEphbiBCZXVsaWNoIFttYWlsdG86SkJldWxpY2hAc3VzZS5jb21dCj4gPj4gU2VudDogMDYg
U2VwdGVtYmVyIDIwMTggMTQ6MDQKPiA+PiBUbzogeGVuLWRldmVsIDx4ZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmc+Cj4gPj4gQ2M6IE9sYWYgSGVyaW5nIDxvbGFmQGFlcGZsZS5kZT47IEFu
ZHJldyBDb29wZXIKPiA+PiA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFBhdWwgRHVycmFu
dCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gPj4gU3ViamVjdDogW1BBVENIIHYzIDIvM10g
eDg2L0hWTTogYWRkIGtub3duX2dsYSgpIGVtdWxhdGlvbiBoZWxwZXIKPiA+Pgo+ID4+IC4uLiBh
cyBhIGNlbnRyYWwgcGxhY2UgdG8gZG8gcmVzcGVjdGl2ZSBjaGVja2luZyBmb3Igd2hldGhlciB0
aGUKPiA+PiB0cmFuc2xhdGlvbiBmb3IgdGhlIGxpbmVhciBhZGRyZXNzIGlzIGF2YWlsYWJsZSBh
cyB3ZWxsIGFzIHVzYWJsZS4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KPiA+PiAtLS0KPiA+PiB2MzogU3BsaXQgZnJvbSBzdWJzZXF1ZW50
IHBhdGNoLgo+ID4KPiA+IE11Y2ggbmljZXIgOi0pCj4gPgo+ID4gUmV2aWV3ZWQtYnk6IFBhdWwg
RHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Cj4gCj4gVGhhbmtzOyBhbnkgY2hhbmNl
IG9mIGFsc28gZ2V0dGluZyBhbiBhY2sgZm9yIHBhdGNoIDE/Cj4gCgpPaCBzb3JyeSwgSSB0aG91
Z2h0IEkgYWxyZWFkeSBkaWQuLi4gQ29taW5nIHVwIGluIGEgbW9tZW50Li4uCgogIFBhdWwKCj4g
SmFuCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
