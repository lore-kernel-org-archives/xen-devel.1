From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 0/2] MMIO emulation fixes
Date: Fri, 10 Aug 2018 06:13:24 -0600
Message-ID: <5B6D816402000078001DCF55@prv1-mh.provo.novell.com>
References: <20180810103714.5112-1-paul.durrant@citrix.com>
 <5B6D7E9C02000078001DCF26@prv1-mh.provo.novell.com>
 <d60afbae4e264d6bb6f29c9ae0445133@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=aouf=kz=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fo6II-000250-Nn
 for xen-devel@lists.xenproject.org; Fri, 10 Aug 2018 12:13:26 +0000
In-Reply-To: <d60afbae4e264d6bb6f29c9ae0445133@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEwLjA4LjE4IGF0IDE0OjA4LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiAgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSmFuIEJldWxpY2ggW21h
aWx0bzpKQmV1bGljaEBzdXNlLmNvbV0KPj4gU2VudDogMTAgQXVndXN0IDIwMTggMTM6MDIKPj4g
VG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4+IENjOiB4ZW4tZGV2
ZWwgPHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4KPj4gU3ViamVjdDogUmU6IFtYZW4t
ZGV2ZWxdIFtQQVRDSCAwLzJdIE1NSU8gZW11bGF0aW9uIGZpeGVzCj4+IAo+PiA+Pj4gT24gMTAu
MDguMTggYXQgMTI6MzcsIDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4gd3JvdGU6Cj4+ID4gVGhl
c2UgYXJlIHByb2JhYmx5IGJvdGggY2FuZGlkYXRlcyBmb3IgYmFjay1wb3J0Lgo+PiA+Cj4+ID4g
UGF1bCBEdXJyYW50ICgyKToKPj4gPiAgIHg4Ni9odm0vaW9yZXE6IE1NSU8gcmFuZ2UgY2hlY2tp
bmcgY29tcGxldGVseSBpZ25vcmVzIGRpcmVjdGlvbiBmbGFnCj4+ID4gICB4ODYvaHZtL2VtdWxh
dGU6IG1ha2Ugc3VyZSByZXAgSS9PIGVtdWxhdGlvbiBkb2VzIG5vdCBjcm9zcyBHRk4KPj4gPiAg
ICAgYm91bmRhcmllcwo+PiA+Cj4+ID4gIHhlbi9hcmNoL3g4Ni9odm0vZW11bGF0ZS5jIHwgMTcg
KysrKysrKysrKysrKysrKy0KPj4gPiAgeGVuL2FyY2gveDg2L2h2bS9pb3JlcS5jICAgfCAxNSAr
KysrKysrKysrLS0tLS0KPj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCA2
IGRlbGV0aW9ucygtKQo+PiAKPj4gSSB0YWtlIGl0IHRoaXMgaXNuJ3QgeWV0IHdoYXQgd2UndmUg
dGFsa2VkIGFib3V0IHllc3RlcmRheSBvbiBpcmM/Cj4+IAo+IAo+IFRoaXMgaXMgdGhlIGJhbmQt
YWlkIGZpeC4gSSBjYW4gbm93IHNob3cgY29ycmVjdCBoYW5kbGluZyBvZiBhIHJlcCBtb3YgCj4g
d2Fsa2luZyBvZmYgTU1JTyBpbnRvIFJBTS4KCkJ1dCB0aGF0J3Mgbm90IHRoZSBwcm9ibGVtIHdl
J3JlIGhhdmluZy4gSW4gb3VyIGNhc2UgdGhlIGJhZCBiZWhhdmlvcgppcyB3aXRoIGEgc2luZ2xl
IE1PVi4gVGhhdCdzIHdoeSBJIGhhZCBhc3N1bWVkIHRoYXQgeW91ciBwbGFuIHRvIGZpZGRsZQp3
aXRoIG51bGxfaGFuZGxlciB3b3VsZCBoZWxwIGluIG91ciBjYXNlIGFzIHdlbGwsIHdoaWxlIHRo
aXMgc2VyaWVzIGNsZWFybHkKd29uJ3QgKGFmYWljdCkuCgpKYW4KCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
