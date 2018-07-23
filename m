From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH V5] x86/altp2m: Fix crash with
 INVALID_ALTP2M EPTP index
Date: Mon, 23 Jul 2018 14:34:38 +0300
Message-ID: <0bbd3381-a0b4-d21e-da32-30b1b7b04622@bitdefender.com>
References: <1530196528-17865-1-git-send-email-rcojocaru@bitdefender.com>
 <ab532b31-0eef-1364-f26d-b758a78e4ff6@citrix.com>
 <91e61736-c6a4-a628-dbb2-a2d50a9ff38e@bitdefender.com>
 <8f681a50-e161-b8d5-013f-6b807ad5f942@citrix.com>
 <ab7d44d2-cb19-2cb6-e768-0fc22d22954e@bitdefender.com>
 <b2d62b43-f38b-a918-7d83-118fd2e58156@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <b2d62b43-f38b-a918-7d83-118fd2e58156@citrix.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xen.org
Cc: george.dunlap@eu.citrix.com, andrew.cooper3@citrix.com, kevin.tian@intel.com, jun.nakajima@intel.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMjMvMjAxOCAwMToyOSBQTSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBJdCdzIHBvc3Np
YmxlIG15IGFuYWx5c2lzIGlzIHdyb25nIHRoZXJlIChJJ20gbm90IGludGltYXRlbHkgZmFtaWxp
YXIKPiB3aXRoIHRoZSBjb2RlKSwgYnV0IEkgdGhpbmsgbXkgcGF0Y2ggaXMgYmV0dGVyIGFueXdh
eSBmb3IgYSBjb3VwbGUgb2YKPiByZWFzb25zOgo+IAo+ICogVGhlIGxvZ2ljIHRvIGtlZXAgRVBU
UF9JTkRFWCBpbiBzeW5jIGlzIGV4cGxpY2l0LCBhbmQgYWxsIGluIHRoZSBzYW1lCj4gZmlsZS4K
PiAKPiAqIEl0IGRvZXNuJ3QgZG8gdW5uZWNlc3NhcnkgdXBkYXRlcyB0byBvdGhlciBiaXRzIG9m
IHN0YXRlCj4gCj4gKiBJZiB3ZSBldmVyIGhhdmUgcmVhc29uIHRvIGNhbGwgdm14X3ZjcHVfdXBk
YXRlX3ZtZnVuY192ZSgpIGRpcmVjdGx5LAo+IHdlIHdvbid0IHJlLWludHJvZHVjZSB0aGlzIGJ1
Zy4gIChPciB0byBwdXQgaXQgYSBkaWZmZXJlbnQgd2F5OiBXZSBkb24ndAo+IGhhdmUgdG8gcmVt
ZW1iZXIgdGhhdCB3ZSBjYW4ndCBjYWxsIGl0IGRpcmVjdGx5LikKClZlcnkgZ29vZCByZWFzb25z
LCBhbmQgSSBjb21wbGV0ZWx5IGFncmVlLiBUaGFua3MgYWdhaW4gZm9yIHlvdXIgaGVscCEKCgpU
aGFua3MsClJhenZhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
