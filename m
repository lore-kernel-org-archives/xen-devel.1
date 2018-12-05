From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.12 v2 17/17] xen/arm: Track page
 accessed between batch of Set/Way operations
Date: Wed, 05 Dec 2018 01:37:20 -0700
Message-ID: <5C078E40020000780020305C@prv1-mh.provo.novell.com>
References: <20181204202651.8836-1-julien.grall@arm.com>
 <20181204202651.8836-18-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=winm=oo=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gUSgQ-0005pe-85
 for xen-devel@lists.xenproject.org; Wed, 05 Dec 2018 08:37:26 +0000
In-Reply-To: <20181204202651.8836-18-julien.grall@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjEyLjE4IGF0IDIxOjI2LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IEF0IHRoZSBtb21lbnQsIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiBTZXQvV2F5IG9wZXJhdGlvbnMg
d2lsbCBnbyB0aHJvdWdoCj4gYWxsIHRoZSBlbnRyaWVzIG9mIHRoZSBndWVzdCBQMk0gYW5kIGZs
dXNoIHRoZW0uIEhvd2V2ZXIsIHRoaXMgaXMgdmVyeQo+IGV4cGVuc2l2ZSBhbmQgbWF5IHJlbmRl
ciB1bnVzYWJsZSBhIGd1ZXN0IE9TIHVzaW5nIHRoZW0uCj4gCj4gRm9yIGluc3RhbmNlLCBMaW51
eCAzMi1iaXQgd2lsbCB1c2UgU2V0L1dheSBvcGVyYXRpb25zIGR1cmluZyBzZWNvbmRhcnkKPiBD
UFUgYnJpbmctdXAuIEFzIHRoZSBpbXBsZW1lbnRhdGlvbiBpcyByZWFsbHkgZXhwZW5zaXZlLCBp
dCBtYXkgYmUgcG9zc2libGUKPiB0byBoaXQgdGhlIENQVSBicmluZy11cCB0aW1lb3V0Lgo+IAo+
IFRvIGxpbWl0IHRoZSBTZXQvV2F5IGltcGFjdCwgd2UgdHJhY2sgd2hhdCBwYWdlcyBoYXMgYmVl
biBvZiB0aGUgZ3Vlc3QKPiBoYXMgYmVlbiBhY2Nlc3NlZCBiZXR3ZWVuIGJhdGNoIG9mIFNldC9X
YXkgb3BlcmF0aW9ucy4gVGhpcyBpcyBkb25lCj4gdXNpbmcgYml0WzBdIChha2EgdmFsaWQgYml0
KSBvZiB0aGUgUDJNIGVudHJ5Lgo+IAo+IFRoaXMgcGF0Y2ggYWRkcyBhIG5ldyBwZXItYXJjaCBo
ZWxwZXIgaXMgaW50cm9kdWNlZCB0byBwZXJmb3JtIGFjdGlvbnMganVzdAo+IGJlZm9yZSB0aGUg
Z3Vlc3QgaXMgZmlyc3QgdW5wYXVzZWQuIFRoaXMgd2lsbCBiZSB1c2VkIHRvIGludmFsaWRhdGUg
dGhlCj4gUDJNIHRvIHRyYWNrIGFjY2VzcyBmcm9tIHRoZSBzdGFydCBvZiB0aGUgZ3Vlc3QuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiAK
PiAtLS0KPiAKPiBXaGlsZSB3ZSBjYW4gc3ByZWFkIGQtPmNyZWF0aW9uX2ZpbmlzaGVkIGFsbCBv
dmVyIHRoZSBjb2RlLCB0aGUgcGVyLWFyY2gKPiBoZWxwZXIgdG8gcGVyZm9ybSBhY3Rpb25zIGp1
c3QgYmVmb3JlIHRoZSBndWVzdCBpcyBmaXJzdCB1bnBhdXNlZCBjYW4KPiBicmluZyBhIGxvdCBv
ZiBiZW5lZml0IGZvciBib3RoIGFyY2hpdGVjdHVyZS4gRm9yIGluc3RhbmNlLCBvbiBBcm0sIHRo
ZQo+IGZsdXNoIHRvIHRoZSBpbnN0cnVjdGlvbiBjYWNoZSBjb3VsZCBiZSBkZWxheWVkIHVudGls
IHRoZSBkb21haW4gaXMKPiBmaXJzdCBydW4uIFRoaXMgd291bGQgaW1wcm92ZSBncmVhdGx5IHRo
ZSBwZXJmb3JtYW5jZSBvZiBjcmVhdGluZyBndWVzdC4KCkp1c3QgdGhlIG90aGVyIGRheSB3ZSBo
YWQgZm91bmQgYSBwb3RlbnRpYWwgdXNlIG9uIHg4NiBhcyB3ZWxsCihldmVuIGlmIEkgYWxyZWFk
eSBkb24ndCByZWNhbGwgYW55bW9yZSB3aGF0IGl0IHdhcyksIHNvIHRoZQphZGRpdGlvbiBpcyBj
ZXJ0YWlubHkgaGVscGZ1bC4gSXQgbWlnaHQgaGF2ZSBiZWVuIG5pY2UgdG8gc3BsaXQKaW50cm9k
dWN0aW9uIG9mIHRoZSBpbnRlcmZhY2UgZnJvbSB3aGF0IHlvdSBhY3R1YWxseSB3YW50IGl0IHRv
CmRvIG9uIEFybSwgYnV0IGlycmVzcGVjdGl2ZSBvZiB0aGF0ClJldmlld2VkLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CmZvciB0aGUgbm9uLUFybSBwaWVjZXMgaGVyZS4KCkph
bgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
