From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4] x86/setup: disallow any src/dst overlaps
 when relocating Xen image
Date: Mon, 16 Apr 2018 07:22:54 -0600
Message-ID: <5AD4A3AE02000078001BBBAD@prv1-mh.provo.novell.com>
References: <1522770854-31108-1-git-send-email-daniel.kiper@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ulgz=hf=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f845t-0002dJ-KG
 for xen-devel@lists.xenproject.org; Mon, 16 Apr 2018 13:22:53 +0000
In-Reply-To: <1522770854-31108-1-git-send-email-daniel.kiper@oracle.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Daniel Kiper <daniel.kiper@oracle.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjA0LjE4IGF0IDE3OjU0LCA8ZGFuaWVsLmtpcGVyQG9yYWNsZS5jb20+IHdyb3Rl
Ogo+IENvbW1pdCAwZDMxZDE2ICh4ODYvc2V0dXA6IGRvIG5vdCByZWxvY2F0ZSBYZW4gb3ZlciBj
dXJyZW50IFhlbiBpbWFnZQo+IHBsYWNlbWVudCkgZGlzYWxsb3dlZCBzcmMvZHN0IGltYWdlcyBv
dmVybGFwcyB3aGVuIHJlbG9jYXRpbmcgWGVuIGltYWdlLgo+IFRob3VnaCBpdCBkZWxpYmVyYXRl
bHkgYWxsb3dlZCBkZXN0aW5hdGlvbiByZWdpb24gYmV0d2VlbiBfX2ltYWdlX2Jhc2VfXwo+IGFu
ZCAoX19pbWFnZV9iYXNlX18gKyBYRU5fSU1HX09GRlNFVCkgb3ZlcmxhcHMgd2l0aCB0aGUgZW5k
IG9mIHNvdXJjZQo+IGltYWdlLiBBbmQgaGVyZSBpcyB0aGUgcHJvYmxlbS4gSWYgYW55dGhpbmcg
YmV0d2VlbiBfX3BhZ2VfdGFibGVzX3N0YXJ0Cj4gYW5kIF9fcGFnZV90YWJsZXNfZW5kIGluIHNv
dXJjZSBpbWFnZSBsYW5kcyBpbiB0aGUgb3ZlcmxhcCB0aGVuIHNvbWUgb3IKPiBldmVuIGFsbCBw
YWdlIHRhYmxlIGVudHJpZXMgbWF5IG5vdCBiZSB1cGRhdGVkLiBUaGlzIHVzdWFsbHkgbWVhbnMg
Ym9vbQo+IGluIGVhcmx5IGJvb3Qgd2hpY2ggd2lsbCBiZSBkaWZmaWN1bHQgdG8gdGhlIGludmVz
dGlnYXRlLiBTbywgSSB0aGluawo+IHRoYXQgd2UgaGF2ZSB0aHJlZSBjaG9pY2VzIHRvIGZpeCB0
aGUgaXNzdWU6Cj4gICAtIGRyb3AgWEVOX0lNR19PRkZTRVQgZnJvbQo+ICAgICBpZiAoIChlbmQg
PiBzKSAmJiAoZW5kIC0gcmVsb2Nfc2l6ZSArIFhFTl9JTUdfT0ZGU0VUID49IF9fcGEoX2VuZCkp
ICkKPiAgIC0gYWRkIFhFTl9JTUdfT0ZGU0VUIHRvIHhlbl9waHlzX3N0YXJ0IGluIFBGTl9ET1dO
KHhlbl9waHlzX3N0YXJ0KQo+ICAgICB1c2VkIGluIGxvb3BzIGFzIG9uZSBvZiBjb25kaXRpb25z
LAo+ICAgLSBjaGFuZ2UgUEZOX0RPV04oeGVuX3BoeXNfc3RhcnQpIHRvIFBGTl9ET1dOKHhlbl9y
ZW1hcF9lbmRfcGZuKQo+ICAgICBwcm9wb3NlZCBpbiBlYXJsaWVyIHZlcnNpb24gb2YgdGhpcyBw
YXRjaC4KPiAKPiBUaGlzIHBhdGNoIGltcGxlbWVudHMgdGhlIGZpcnN0IG9wdGlvbi4gVGhpcyB3
YXkgd2Ugd2lsbCBhdm9pZCBhbGwga2luZHMKPiBvZiBvdmVybGFwcyB3aGljaCBhcmUgYWx3YXlz
IGZ1bGwgY2FuIG9mIHdvcm1zLgoKUGVyc29uYWxseSBJJ2QgbGlrZSBvcHRpb24gMiBiZXR0ZXIs
IGFzIHRoZXJlJ3Mgbm90aGluZyBvZiBpbnRlcmVzdCBpbiB0aGUKWzAsWEVOX0lNR19PRkZTRVQp
IHJhbmdlLiBJbnN0ZWFkIG9mIG1vZGlmeWluZyBldmVyeQpQRk5fRE9XTih4ZW5fcGh5c19zdGFy
dCksIHBlcmhhcHMgc2ltcGx5IGludHJvZHVjZSBhIGxvY2FsIHZhcmlhYmxlLAphY2NvbXBhbmll
ZCBieSBhIHN1aXRhYmxlIGNvbW1lbnQuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
