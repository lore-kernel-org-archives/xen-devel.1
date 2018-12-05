From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 5/9] x86/amd: Probe for legacy SSBD
 interfaces on boot
Date: Wed, 5 Dec 2018 17:09:36 +0000
Message-ID: <b2df3212-f972-fea6-64d5-aced5ead2f0d@citrix.com>
References: <1543853902-6257-1-git-send-email-andrew.cooper3@citrix.com>
 <1543853902-6257-6-git-send-email-andrew.cooper3@citrix.com>
 <5C0801C002000078002033D5@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5C0801C002000078002033D5@prv1-mh.provo.novell.com>
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
Cc: Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMTIvMjAxOCAxNjo1MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4KPj4gLS0tIGEveGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9jcHVmZWF0dXJlcy5oCj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYv
Y3B1ZmVhdHVyZXMuaAo+PiBAQCAtMjUsNiArMjUsNyBAQCBYRU5fQ1BVRkVBVFVSRShYRU5fU01B
UCwgICAgICAgIChGU0NBUElOVFMrMCkqMzIrMTEpIC8qIFNNQVAgZ2V0cyB1c2VkIGJ5IFhlbiBp
dAo+PiAgWEVOX0NQVUZFQVRVUkUoTEZFTkNFX0RJU1BBVENILCAoRlNDQVBJTlRTKzApKjMyKzEy
KSAvKiBsZmVuY2Ugc2V0IGFzIERpc3BhdGNoIFNlcmlhbGlzaW5nICovCj4+ICBYRU5fQ1BVRkVB
VFVSRShJTkRfVEhVTktfTEZFTkNFLChGU0NBUElOVFMrMCkqMzIrMTMpIC8qIFVzZSBJTkRfVEhV
TktfTEZFTkNFICovCj4+ICBYRU5fQ1BVRkVBVFVSRShJTkRfVEhVTktfSk1QLCAgIChGU0NBUElO
VFMrMCkqMzIrMTQpIC8qIFVzZSBJTkRfVEhVTktfSk1QICovCj4+ICtYRU5fQ1BVRkVBVFVSRShM
RUdBQ1lfU1NCRCwgICAgIChGU0NBUElOVFMrMCkqMzIrMTUpIC8qIExTX0NGRyBvciBWSVJUX1NQ
RUNfQ1RSTCBhdmFpbGFibGUgZm9yIFNTQkQgKi8KPiAuLi4gaGVyZSwgYnV0IEkgc3RpbGwgd2ls
bCBuZWVkIHRvIHNlZSBob3cgdGhpcyBnZXRzIHVzZWQgYmVmb3JlCj4gZ2l2aW5nIG15IGFjayBo
ZXJlLiBBZGRpdGlvbmFsbHkgSSBjYW4gc2VlICJsZWdhY3kiIGFzIGEgc3VpdGFibGUKPiBuYW1l
IGZvciB0aGUgTFNfQ0ZHIGFwcHJvYWNoLCBidXQgZG9lcyB0aGlzIGFsc28gZml0IHRoZQo+IFZJ
UlRfU1BFQ19DVFJMIG9uZT8KCkluIHByYWN0aWNlLCBWSVJUX1NQRUNfQ1RSTCBtZWFucyAieW91
ciBoeXBlcnZpc29yIGlzIHVzaW5nIExTX0NGRyBvbgp5b3VyIGJlaGFsZiIuCgpBcyB0byB0aGUg
am9pbnQgbWVhbmluZywgdGhhdCdzIGJlY2F1c2UgaXQgaXMgdGhlIG1vc3QgYXBwcm9wcmlhdGUg
KGkuZS4Kc2ltcGxlKSB3YXkgdG8gc3RydWN0dXJlIHRoZSBjb2RlLgoKPgo+IE9uZSBvdGhlciBx
dWVzdGlvbjogVGhlcmUncyBub3cgcmVkdW5kYW50IGNvZGUgaW4gaW5pdF9hbWQoKQo+IGhhbmRs
aW5nIG9wdF9zc2JkLiBXb3VsZCBpdCBub3QgZml0IGhlcmUgdG8gcmVtb3ZlL3JlcGxhY2UgdGhh
dD8KClRoZSBjb2RlIGluIGluaXRfYW1kKCkgb25seSBiZWNvbWVzIHJlZHVuZGFudCBpbiBwYXRj
aCA3LCBhbmQgdGhhdCBpcwp3aGVyZSBpdCBpcyByZW1vdmVkLgoKfkFuZHJldwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
