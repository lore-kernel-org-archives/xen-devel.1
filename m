From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v6 1/4] xen: introduce SYMBOL
Date: Wed, 16 Jan 2019 16:41:37 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1901161638300.18561@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1901091537100.15373@sstabellini-ThinkPad-X260>
 <5C387472020000780020C9A7@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1901110911310.27759@sstabellini-ThinkPad-X260>
 <a3743bd4b2d54188890945322e92fc1b@dornerworks.com>
 <CAF3u54AAmx0rBVPscfvqcx5f0ezYNCkrsagJgZb3v2GqfB9TEw@mail.gmail.com>
 <0e731cbd10b64a2faac309c04c2030e2@dornerworks.com>
 <alpine.DEB.2.10.1901111331490.27759@sstabellini-ThinkPad-X260>
 <3cc0862e5f0442d49c33c08f21b423ab@dornerworks.com>
 <5C3C63E0020000780020D22C@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1901141030300.27759@sstabellini-ThinkPad-X260>
 <1CACC1FB020000D800417A66@prv1-mh.provo.novell.com>
 <5C3D97FE020000780020D9F3@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1901151043440.18561@sstabellini-ThinkPad-X260>
 <1CACC1FB020000D800417A66@prv1-mh.provo.novell.com>
 <5C3D97FE020000780020D9F3@prv1-mh.provo.novell.com>
 <2EA6D6FD0200001F00417A66@prv1-mh.provo.novell.com>
 <5C3F06B5020000780020E322@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TIIl=PZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gjvka-0006r4-E5
 for xen-devel@lists.xenproject.org; Thu, 17 Jan 2019 00:41:40 +0000
In-Reply-To: <5C3F06B5020000780020E322@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <stefanos@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@gmail.com>, Julien Grall <julien.grall@arm.com>, Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAxNiBKYW4gMjAxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4+IE9uIDE2LjAxLjE5
IGF0IDAwOjM2LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiBPbiBUdWUsIDE1
IEphbiAyMDE5LCBKYW4gQmV1bGljaCB3cm90ZToKPiA+PiBGaXJzdCBvZiBhbGwgd2Ugc2hvdWxk
IGV4cGxvcmUgd2hldGhlciB0aGUgdmFyaWFibGVzIGNvdWxkIGFsc28gYmUKPiA+PiBsaW5rZXIg
Z2VuZXJhdGVkLCBpbiBwYXJ0aWN1bGFyIHRvIGF2b2lkIHRoZSBjdXJyZW50IHN5bWJvbHMgdG8g
YmUKPiA+PiBnbG9iYWwgKHRodXMgbWFraW5nIGl0IGltcG9zc2libGUgdG8gYWNjZXNzIHRoZW0g
ZnJvbSBDIGZpbGVzIGluIHRoZQo+ID4+IGZpcnN0IHBsYWNlKS4KPiA+IAo+ID4gVGhhdCB3b3Vs
ZCBiZSBmYW50YXN0aWMuIEkgbG9va2VkIGFyb3VuZCwgSSBmb3VuZCBpbnRlcmVzdGluZyB0aGlu
Z3MKPiA+IGxpa2UgUFJPVklERSwgYnV0IEkgZG9uJ3QgdGhpbmsgd2hhdCB5b3UgZGVzY3JpYmUg
aXMgcG9zc2libGUuIFRoZQo+ID4gbGlua2VyIHNjcmlwdHMgb25seSBkZWZpbmUgc3ltYm9scywg
dGhleSBjYW5ub3Qgc2V0IG9yIGRlZmluZSB2YXJpYWJsZXMuCj4gCj4gWWVhaCwgaXQgZGlkbid0
IHNlZW0gdmVyeSBsaWtlbHkuIFRoZW4gYWdhaW4gSSB0aGluayB0aGUgbmV4dCBiZXN0Cj4gYXBw
cm9hY2ggd291bGQgc3RpbGwgYmUgdG8gdXNlIC5zdGFydG9mLiAvIC5zaXplb2YuLCBqdXN0IG5v
dCB0aGUKPiB3YXkgbXkgb3JpZ2luYWwgcGF0Y2ggZGlkLCBidXQgaW4geW91ciB2YXIuUyBmaWxl
KHMpLiBUaGUKPiBmdW5kYW1lbnRhbCBnb2FsIHN0aWxsIGJlaW5nIHRvIGF2b2lkIGV4cG9zdXJl
IG9mIHRoZSBzeW1ib2xzCj4gd2UgZG9uJ3Qgd2FudCB0byBiZSB1c2VkIGluIEMgYWx0b2dldGhl
ci4gKEFsbCBvZiB0aGlzIHByb3ZpZGVkCj4gd2UgbmVlZCB0byBnbyB0aGlzIGludGVybWVkaWF0
ZSB2YXJpYWJsZSByb3V0ZSBpbiB0aGUgZmlyc3QgcGxhY2UsCj4gd2hpY2ggSSBjb250aW51ZSB0
byBiZSB1bmNvbnZpbmNlZCBvZiwgZGVzcGl0ZSB5b3UgaGF2aW5nCj4gcG9zdGVkIGEgcmVzcGVj
dGl2ZSB2OCBvZiB5b3VyIHNlcmllcy4pCj4gCj4gPj4gRmFpbGluZyB0aGF0LCBJIGRvbid0IHRo
aW5rIGl0IG1hdHRlcnMgbXVjaCB3aGVyZSB0aGVzZQo+ID4+IGhlbHBlciBzeW1ib2xzIGxpdmUs
IGFuZCBoZW5jZSB5b3VyIGNob2ljZSBpcyBwcm9iYWJseSBmaW5lIChJJ2QKPiA+PiBwcmVmZXIg
dGhvdWdoIGlmLCBqdXN0IGxpa2Ugb24gQXJtLCB0aGUgeDg2IGZpbGUgZGlkbid0IGxpdmUgaW4g
dGhlCj4gPj4gYm9vdC8gc3ViZGlyZWN0b3J5OyBpbiB0aGUgZW5kIGl0IG1pZ2h0IGV2ZW4gYmUg
cG9zc2libGUgdG8gaGF2ZQo+ID4+IHNvbWUgb2YgdGhlbSBpbiB4ZW4vY29tbW9uL3Zhci5TKS4K
PiA+IAo+ID4gT0ssIEknbGwgbW92ZSB0aGUgeDg2IHZhci5TIHRvIHhlbi9hcmNoL3g4Ni94ODZf
NjQuIEkgY2Fubm90IHNoYXJlIHZhci5TCj4gPiBiZWNhdXNlIGFybTMyIGlzIHVzaW5nIGxvbmcg
aW5zdGVhZCBvZiBxdWFkLgo+IAo+IEV4Y3VzZSBtZSwgYnV0IG5vLiBUaGlzIGlzIGV4dHJlbWVs
eSBlYXN5IHRvIGFic3RyYWN0IGF3YXkgLSBzZWUKPiB4ODYgTGludXgnZXMgX0FTTV9QVFIuCgpJ
IGFtIGhhcHB5IHRvIG1ha2UgdGhpcyBjaGFuZ2UgYW5kIGFsc28gd29yayBvbiB5b3VyIHN1Z2dl
c3Rpb24gYWJvdmUKYWJvdXQgdXNpbmcgLnN0YXJ0b2YuIC8gLnNpemVvZi4gaW4gdmFyLlMsIGlm
IHdlIGFncmVlIG9uIHRoaXMgYXBwcm9hY2guCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
