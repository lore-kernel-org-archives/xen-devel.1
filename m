From: "Jan Beulich" <JBeulich@suse.com>
Subject: Ping: [PATCH] x86: use VMLOAD for PV context switch
Date: Wed, 29 Aug 2018 01:06:40 -0600
Message-ID: <5B86460002000078001E2D95@prv1-mh.provo.novell.com>
References: <5B4486F302000078001D290A@prv1-mh.provo.novell.com>
 <20180816220408.GC9630@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=lc6w=lm=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fuuYu-0003b2-JB
 for xen-devel@lists.xenproject.org; Wed, 29 Aug 2018 07:06:44 +0000
In-Reply-To: <20180816220408.GC9630@amd.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjA4LjE4IGF0IDAwOjA0LCA8YnJpYW4ud29vZHNAYW1kLmNvbT4gd3JvdGU6Cj4g
T24gVHVlLCBKdWwgMTAsIDIwMTggYXQgMDQ6MTQ6MTFBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+IEhhdmluZyBub3RpY2VkIHRoYXQgVk1MT0FEIGFsb25lIGlzIGFib3V0IGFzIGZhc3Qg
YXMgYSBzaW5nbGUgb2YgdGhlCj4+IGludm9sdmVkIFdSTVNScywgSSB0aG91Z2h0IGl0IG1pZ2h0
IGJlIGEgcmVhc29uYWJsZSBpZGVhIHRvIGFsc28gdXNlIGl0Cj4+IGZvciBQVi4gTWVhc3VyZW1l
bnRzLCBob3dldmVyLCBoYXZlIHNob3duIHRoYXQgYW4gYWN0dWFsIGltcHJvdmVtZW50IGNhbgo+
PiBiZSBhY2hpZXZlZCBvbmx5IHdpdGggYW4gZWFybHkgcHJlZmV0Y2ggb2YgdGhlIFZNQ0IgKHRo
YW5rcyB0byBBbmRyZXcKPj4gZm9yIHN1Z2dlc3RpbmcgdG8gdHJ5IHRoaXMpLCB3aGljaCBJIGhh
dmUgdG8gYWRtaXQgSSBjYW4ndCByZWFsbHkKPj4gZXhwbGFpbi4gVGhpcyB3YXkgb24gbXkgRmFt
MTUgYm94IGNvbnRleHQgc3dpdGNoIHRha2VzIG92ZXIgMTAwIGNsb2Nrcwo+PiBsZXNzIG9uIGF2
ZXJhZ2UgKHRoZSBtZWFzdXJlZCB2YWx1ZXMgYXJlIGhlYXZpbHkgdmFyeWluZyBpbiBhbGwgY2Fz
ZXMsCj4+IHRob3VnaCkuCj4+IAo+PiBUaGlzIGlzIGludGVudGlvbmFsbHkgbm90IHVzaW5nIGEg
bmV3IGh2bV9mdW5jcyBob29rOiBGb3Igb25lLCB0aGlzIGlzCj4+IGFsbCBhYm91dCBQViwgYW5k
IHNvbWV0aGluZyBzaW1pbGFyIGNhbiBoYXJkbHkgYmUgZG9uZSBmb3IgVk1YLgo+PiBGdXJ0aGVy
bW9yZSB0aGUgaW5kaXJlY3QgdG8gZGlyZWN0IGNhbGwgcGF0Y2hpbmcgdGhhdCBpcyBtZWFudCB0
byBiZQo+PiBhcHBsaWVkIHRvIG1vc3QgaHZtX2Z1bmNzIGhvb2tzIHdvdWxkIGJlIHVnbHkgdG8g
bWFrZSB3b3JrIHdpdGgKPj4gZnVuY3Rpb25zIGhhdmluZyBtb3JlIHRoYW4gNiBwYXJhbWV0ZXJz
Lgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+
IAo+IEkgaGF2ZSBjb25maXJtZWQgaXQgd2l0aCBhIHNlbmlvciBoYXJkd2FyZSBlbmdpbmVlciBh
bmQgdXNpbmcgdm1sb2FkIGluCj4gdGhpcyBmYXNoaW9uIGlzIHNhZmUgYW5kIHJlY29tbWVuZGVk
IGZvciBwZXJmb3JtYW5jZS4gIEFzIGZhciBhcyB1c2luZwo+IHZtbG9hZCB3aXRoIFBWLgo+IAo+
IEFja2VkLWJ5OiBCcmlhbiBXb29kcyA8YnJpYW4ud29vZHNAYW1kLmNvbT4KClRoYW5rcy4gQW5k
cmV3PwoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
