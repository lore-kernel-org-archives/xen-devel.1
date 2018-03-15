From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: ignore guest microcode loading attempts
Date: Thu, 15 Mar 2018 11:03:52 +0000
Message-ID: <06b2d681-1736-7768-adff-b250cbcd3179@citrix.com>
References: <5AA7B27402000078001B0D94@prv-mh.provo.novell.com>
 <831fa40e-f82d-1140-b093-74e9a4f5f356@citrix.com>
 <5AAA5BC202000078001B202F@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=h5rp=gf=citrix.com=prvs=605c7d53e=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ewQft-0002kU-6Q
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 11:03:57 +0000
In-Reply-To: <5AAA5BC202000078001B202F@prv-mh.provo.novell.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDMvMTggMTA6NDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Cj4+PiBAQCAtMjAwLDYgKzIw
MiwxNiBAQCBpbnQgZ3Vlc3Rfd3Jtc3Ioc3RydWN0IHZjcHUgKnYsIHVpbnQzMl90Cj4+PiAgICAg
ICAgICAvKiBSZWFkLW9ubHkgKi8KPj4+ICAgICAgICAgIGdvdG8gZ3BfZmF1bHQ7Cj4+PiAgCj4+
PiArICAgIGNhc2UgTVNSX0FNRF9QQVRDSExPQURFUjoKPj4+ICsgICAgICAgIGlmICggZC0+YXJj
aC5jcHVpZC0+eDg2X3ZlbmRvciAhPSBYODZfVkVORE9SX0FNRCApCj4+PiArICAgICAgICAgICAg
Z290byBncF9mYXVsdDsKPj4+ICsgICAgICAgIGJyZWFrOwo+Pj4gKwo+Pj4gKyAgICBjYXNlIE1T
Ul9JQTMyX1VDT0RFX1dSSVRFOgo+Pj4gKyAgICAgICAgaWYgKCBkLT5hcmNoLmNwdWlkLT54ODZf
dmVuZG9yICE9IFg4Nl9WRU5ET1JfSU5URUwgKQo+Pj4gKyAgICAgICAgICAgIGdvdG8gZ3BfZmF1
bHQ7Cj4+IENhbiB3ZSBsZWF2ZSBhIG5vdGUgaGVyZSB0aGF0IFdpbmRvd3MgYXQgbGVhc3Qgb24g
c29tZSBoYXJkd2FyZSBsb2Fkcwo+PiBtaWNyb2NvZGUgYmVmb3JlIHNldHRpbmcgdXAgYW4gSURU
L0dEVCwgYW5kIHdpbGwgdHJpcGxlIGZhdWx0IGlmIHdlIGhhbmQKPj4gaXQgYmFjayAjR1AuCj4g
V2lsbCBkby4KPgo+PiAgSWdub3JpbmcgdGhlIHdyaXRlIG1lYW5zIHdpbmRvd3Mgd2lsbCBzZWUg
dGhlIHNhbWUKPj4gbWljcm9jb2RlIHZlcnNpb24gYWZ0ZXIgdGhlIGxvYWQgYXR0ZW1wdCwgYW5k
IGNvbmNsdWRlIHRoYXQgaXQgZGlkbid0Cj4+IHN1Y2NlZWQ/Cj4gVGhhdCdzIHdoYXQgSSBpbXBs
eS4gQWZ0ZXIgYWxsIHRoaW5ncyBoYXZlIHdvcmtlZCBiZWZvcmUsIHdoZXJlCj4gd2UgYWxzbyBz
aWxlbnRseSBkcm9wcGVkIHRoZXNlIHdyaXRlcy4KCkFjdHVhbGx5LCBvbiBmdXJ0aGVyIGludmVz
dGlnYXRpb24sIHdlJ3ZlIGFsd2F5cyBoYWQgYSByZWFkX3NhZmUoKSB0ZXN0CmZvciBQViwgd2hp
Y2ggbWVhbnMgdGhhdCBQViBndWVzdHMgaGF2ZSBhbHdheXMgdW5pbGF0ZXJhbGx5IHNlZW4gI0dQ
LsKgCkNhbiB3ZSByZXRhaW4gdGhhdCBiZWhhdmlvdXIgcGxlYXNlPwoKfkFuZHJldwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
