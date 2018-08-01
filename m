From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/4] iommu: generalize
 iommu_inclusive_mapping
Date: Wed, 1 Aug 2018 09:32:14 +0100
Message-ID: <b3a008c7-bb58-21f3-45d1-afbd2d08ce9d@citrix.com>
References: <20180727153149.25094-1-roger.pau@citrix.com>
 <20180727153149.25094-3-roger.pau@citrix.com>
 <5B60749A02000078001D9886@prv1-mh.provo.novell.com>
 <20180731153317.kryord4hezdukfgy@mac>
 <5B616D5402000078001D9BFE@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=bzmx=kq=citrix.com=prvs=744b97e16=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fkmYO-0005tf-Rz
 for xen-devel@lists.xenproject.org; Wed, 01 Aug 2018 08:32:20 +0000
In-Reply-To: <5B616D5402000078001D9BFE@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDgvMjAxOCAwOToyMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMzEuMDcuMTgg
YXQgMTc6MzMsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIFR1ZSwgSnVsIDMx
LCAyMDE4IGF0IDA4OjM5OjIyQU0gLTA2MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24g
MjcuMDcuMTggYXQgMTc6MzEsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4+Pj4gSW50
cm9kdWNlIGEgbmV3IGlvbW11PWluY2x1c2l2ZSBnZW5lcmljIG9wdGlvbiB0aGF0IHN1cGVyc2Vk
ZXMKPj4+PiBpb21tdV9pbmNsdXNpdmVfbWFwcGluZy4gVGhpcyBzaG91bGQgYmUgYSBub24tZnVu
Y3Rpb25hbCBjaGFuZ2Ugb24KPj4+PiBJbnRlbCBoYXJkd2FyZSwgd2hpbGUgQU1EIGhhcmR3YXJl
IHdpbGwgZ2FpbiB0aGUgc2FtZSBmdW5jdGlvbmFsaXR5IG9mCj4+Pj4gbWFwcGluZyBhbG1vc3Qg
ZXZlcnl0aGluZyBiZWxvdyB0aGUgNEdCIGJvdW5kYXJ5Lgo+Pj4gU28gZmlyc3Qgb2YgYWxsIC0g
d2hhdCdzIHRoZSBtb3RpdmF0aW9uIGJlaGluZCB0aGlzIGNoYW5nZT8gU28gZmFyIHdlCj4+PiBo
YWQgbm8gbmVlZCBmb3IgaGFja3MgbGluZSB0aGUgVlQtZCBzaWRlIG9uZSBvbiBBTUQuIEkgZG9u
J3QgdGhpbmsKPj4+IHRoaXMgc2hvdWxkIGJlIHdpZGVuZWQgd2l0aG91dCB0aGVyZSBiZWluZyBp
bmRpY2F0aW9uIG9mIGEgcHJvYmxlbQo+Pj4gd2l0aCBub24tbmljaGUgQU1EIHN5c3RlbXMuCj4+
IE9LLCBJIGNhbiBsZWF2ZSB0aGUgZGVmYXVsdCBvbiBmb3IgSW50ZWwgYW5kIG9mZiBmb3IgZXZl
cnl0aGluZyBlbHNlLAo+PiBidXQgSSB3aWxsIGludHJvZHVjZSB0aGUgZ2VuZXJpYyBkb20wLWlv
bW11PSBvcHRpb24gYW55d2F5Lgo+IEhtbSwgSSd2ZSBhbHdheXMgYmVlbiB3aXNoaW5nIHdlJ2Qg
Y2hhbmdlIHRvIGEgZGVmYXVsdCBvZiBvZmYgZm9yCj4gVlQtZCBhcyB3ZWxsIC0gaW1vIHdlIHNo
b3VsZG4ndCBieSBkZWZhdWx0IGFzc3VtZSBicm9rZW4gZmlybXdhcmUuCj4gS2V2aW4/Cj4KPiBB
cyB0byBBTUQgLSB5b3Ugc3RpbGwgZG9uJ3QgcmVhbGx5IHNheSB3aHkgdGhpcyB3b3VsZCBiZSBu
ZWVkZWQKPiB0aGVyZS4gSSdtIG5vdCBpbiBmYXZvciBvZiB3b3JrYXJvdW5kcyB3aGVuIHRoZXJl
J3Mgbm90aGluZyB0bwo+IHdvcmsgYXJvdW5kLiBJT1cgLSBpZiB0aGUgbG9naWMgaXNuJ3QgbmVl
ZGVkIG9uIEFNRCwgZG8gd2UgbmVlZAo+IHRoaXMgY29kZSBtb3ZlbWVudCBpbiB0aGUgZmlyc3Qg
cGxhY2U/CgpUaGlzIGlzIHN1ZmZpY2llbnRseSBicm9rZW4gb24gQU1EIGFzIHdlbGwuwqAgVGFr
ZSBhIGxvb2sgYXQgYWxsIHRoZQpJVlJTL0lWSFQgcmVwb3J0cyB3ZSd2ZSBoYWQgb24geGVuLWRl
dmVsLgoKRnVydGhlcm1vcmUsIG9uIGJ5IGRlZmF1bHQgaXMgdGhlIG9ubHkgcmVhc29uYWJsZSBv
cHRpb24uwqAgRG9tMCBpcwpzcGVjaWZpY2FsbHkgZ2l2ZW4gY3B1IG1hcHBpbmdzIG9mIHRoZSBy
ZXNlcnZlZCByZWdpb25zLCB0aGVyZWZvcmUgaXQKc2hvdWxkIGhhdmUgbWF0Y2hpbmcgSU9NTVUg
bWFwcGluZ3MuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
