From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 11/23] x86: XENMEM_resource_ioreq_server
 is HVM only
Date: Wed, 29 Aug 2018 17:28:15 +0100
Message-ID: <20180829162815.siax7c3sdih52ft3@citrix.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
 <51741a6af59c41162ab10c5bc2a9462770bb1276.1535285866.git-series.wei.liu2@citrix.com>
 <5B84150002000078001E24AB@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vupe=lm=citrix.com=prvs=7720ea622=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fv3KN-0003yY-Jj
 for xen-devel@lists.xenproject.org; Wed, 29 Aug 2018 16:28:19 +0000
Content-Disposition: inline
In-Reply-To: <5B84150002000078001E24AB@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBdWcgMjcsIDIwMTggYXQgMDk6MTM6MDRBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI2LjA4LjE4IGF0IDE0OjE5LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0uYwo+ID4gKysrIGIveGVuL2FyY2gveDg2L21t
LmMKPiA+IEBAIC00Mzc2LDEyICs0Mzc2LDE3IEBAIGludCBhcmNoX2FjcXVpcmVfcmVzb3VyY2Uo
c3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IHR5cGUsCj4gPiAgCj4gPiAgICAgIHN3aXRj
aCAoIHR5cGUgKQo+ID4gICAgICB7Cj4gPiArI2lmZGVmIENPTkZJR19IVk0KPiA+ICAgICAgY2Fz
ZSBYRU5NRU1fcmVzb3VyY2VfaW9yZXFfc2VydmVyOgo+ID4gICAgICB7Cj4gPiAgICAgICAgICBp
b3NlcnZpZF90IGlvc2VydmlkID0gaWQ7Cj4gPiAgICAgICAgICB1bnNpZ25lZCBpbnQgaTsKPiA+
ICAKPiA+ICAgICAgICAgIHJjID0gLUVJTlZBTDsKPiA+ICsgICAgICAgIGlmICggIWlzX2h2bV9k
b21haW4oZCkgKQo+ID4gKyAgICAgICAgICAgIGJyZWFrOwo+ID4gKwo+ID4gKyAgICAgICAgcmMg
PSAtRUlOVkFMOwo+ID4gICAgICAgICAgaWYgKCBpZCAhPSAodW5zaWduZWQgaW50KWlvc2Vydmlk
ICkKPiA+ICAgICAgICAgICAgICBicmVhazsKPiAKPiBTaW5jZSB0aGlzIGlzIHRoZSBvbmx5IGNh
bGxlciBvZiBodm1fZ2V0X2lvcmVxX3NlcnZlcl9mcmFtZSgpLAo+IGFkZGluZyBhbiBpc19odm1f
ZG9tYWluKCkgY2hlY2sgaGVyZSBtZWFucyB0aGUgb25lIGluc2lkZQo+IHRoZSBmdW5jdGlvbiBi
ZWNvbWVzIHJlZHVuZGFudCAtIGl0IHNob3VsZCBiZSBkcm9wcGVkIG9yCj4gY29udmVydGVkIHRv
IGFuIEFTU0VSVCgpIGltby4gRnVydGhlcm1vcmUgaWYgdGhlIGNoZWNrIGlzIHRvCj4gcmVtYWlu
IGhlcmUsIHBsZWFzZSBkcm9wIHRoZSByZWR1bmRhbnQgYXNzaWdubWVudCBvZiByYy4KCkEgZ2Vu
ZXJhbCBwcmluY2lwbGUgSSBoYXZlIGJlZW4gc3RpY2tpbmcgdG8gaXMgdGhlIGNvbW1vbiBjb2Rl
IHNob3VsZAptYWtlIHN1cmUgZ3Vlc3QgdHlwZSBzcGVjaWZpYyBmdW5jdGlvbiBzaG91bGQgb25s
eSBiZSBjYWxsZWQgd2hlbgpuZWNlc3NhcnkgYnkgdXNpbmcgaXNfaHZtL3B2XyouIFJlc3RydWN0
dXJpbmcgdGhlIGNvZGUgbGlrZSB0aGF0IG1ha2VzCkRDRSB3b3JrIGVmZmVjdGl2ZWx5LgoKVGhh
dCBtZWFucyBhIGxvdCBvZiB0aGUgY2hlY2tzIGluIGh2bV8vcHZfIGZ1bmN0aW9ucyBzaG91bGQg
bGlmdGVkIG91dAphbmQgdHVybmVkIGludG8gQVNTRVJULgoKRm9yIHRoaXMgcGF0Y2gsIGlzX2h2
bV9kb21haW4gaW4gdGhlIGNhc2UgYnJhbmNoIHdpbGwgcmVtYWluIGFuZCB0aGUgb25lCmluIGh2
bV9nZXRfaW9yZXFfc2VydmVyX2ZyYW1lIHdpbGwgYmUgdHVybmVkIGludG8gQVNTRVJULgoKV2Vp
LgoKPiAKPiBKYW4KPiAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
