From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 04/14] x86/p2m: Fix locking in
 p2m_altp2m_lazy_copy()
Date: Wed, 5 Dec 2018 19:53:34 +0000
Message-ID: <da060320-318f-0ca2-ea78-967c592373ad@citrix.com>
References: <1542806482-24030-1-git-send-email-andrew.cooper3@citrix.com>
 <1542806482-24030-5-git-send-email-andrew.cooper3@citrix.com>
 <5BF6C4E602000078001FEFCA@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5BF6C4E602000078001FEFCA@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMTEvMjAxOCAxNTowMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjEuMTEuMTgg
YXQgMTQ6MjEsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gLS0tIGEveGVu
L2FyY2gveDg2L21tL3AybS5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwo+PiBAQCAt
MjE4NCwyNCArMjE4NCwyOSBAQCBib29sX3QgcDJtX2FsdHAybV9sYXp5X2NvcHkoc3RydWN0IHZj
cHUgKnYsIHBhZGRyX3QgZ3BhLAo+PiAgICAgIHVuc2lnbmVkIGxvbmcgbWFzazsKPj4gICAgICBt
Zm5fdCBtZm47Cj4+ICAgICAgaW50IHJ2Owo+PiArICAgIGJvb2wgcmV0Owo+PiAgCj4+ICAgICAg
KmFwMm0gPSBwMm1fZ2V0X2FsdHAybSh2KTsKPj4gIAo+PiAgICAgIG1mbiA9IGdldF9nZm5fdHlw
ZV9hY2Nlc3MoKmFwMm0sIGdmbl94KGdmbiksICZwMm10LCAmcDJtYSwKPj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIDAsICZwYWdlX29yZGVyKTsKPj4gLSAgICBfX3B1dF9nZm4oKmFw
Mm0sIGdmbl94KGdmbikpOwo+PiAgCj4+ICsgICAgLyogRW50cnkgYWxyZWFkeSBwcmVzZW50IGlu
IGFwMm0/ICBDYWxsZXIgc2hvdWxkIGhhbmRsZSB0aGUgZmF1bHQuICovCj4+ICAgICAgaWYgKCAh
bWZuX2VxKG1mbiwgSU5WQUxJRF9NRk4pICkKPj4gLSAgICAgICAgcmV0dXJuIDA7Cj4+ICsgICAg
ewo+PiArICAgICAgICByZXQgPSBmYWxzZTsKPj4gKyAgICAgICAgZ290byBwdXRfYXAybTsKPj4g
KyAgICB9Cj4+ICAKPj4gICAgICBtZm4gPSBnZXRfZ2ZuX3R5cGVfYWNjZXNzKGhwMm0sIGdmbl94
KGdmbiksICZwMm10LCAmcDJtYSwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFAy
TV9BTExPQywgJnBhZ2Vfb3JkZXIpOwo+PiAtICAgIF9fcHV0X2dmbihocDJtLCBnZm5feChnZm4p
KTsKPj4gIAo+PiArICAgIC8qIEVudHJ5IG5vdCBwcmVzZW50IGluIGhwMm0/ICBDYWxsZXIgc2hv
dWxkIGhhbmRsZSB0aGUgZmF1bHQuICovCj4+ICAgICAgaWYgKCBtZm5fZXEobWZuLCBJTlZBTElE
X01GTikgKQo+PiAtICAgICAgICByZXR1cm4gMDsKPj4gLQo+PiAtICAgIHAybV9sb2NrKCphcDJt
KTsKPj4gKyAgICB7Cj4+ICsgICAgICAgIHJldCA9IGZhbHNlOwo+PiArICAgICAgICBnb3RvIHB1
dF9ocDJtOwo+IFdvdWxkbid0IHRoaXMgYmV0dGVyIGJlIG5hbWVkICJwdXRfZ2ZuIiAob3IgImRy
b3BfZ2ZuIiB0byBhdm9pZCB0aGUKPiBuYW1lIGNvbGxpc2lvbiB3aXRoIHRoZSBmdW5jdGlvbik/
CgpObyAtIEkgZG9uJ3QgdGhpbmsgc28uwqAgV2UgaGF2ZSB0d28gc2VwYXJhdGUgcmVmcyB0byBk
cm9wLCBvbmUgZnJvbSB0aGUKaHAybSBhbmQgb25lIGZyb20gdGhlIGFwMm0uCgpUaGlzIGlzIHdo
eSB0aGUgbGFiZWxzIGFyZSBuYW1lZCBzeW1tZXRyaWNhbGx5LgoKfkFuZHJldwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
