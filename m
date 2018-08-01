From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 2/4] iommu: generalize
 iommu_inclusive_mapping
Date: Wed, 1 Aug 2018 10:47:31 +0200
Message-ID: <20180801084731.cuvtwcwtv5wrle6a@mac>
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
 <srs0=jtvh=kq=citrix.com=prvs=7445e0bd4=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fkmnL-0007BL-VR
 for xen-devel@lists.xenproject.org; Wed, 01 Aug 2018 08:47:48 +0000
Content-Disposition: inline
In-Reply-To: <5B616D5402000078001D9BFE@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBBdWcgMDEsIDIwMTggYXQgMDI6MjA6MzZBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDMxLjA3LjE4IGF0IDE3OjMzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gVHVlLCBKdWwgMzEsIDIwMTggYXQgMDg6Mzk6MjJBTSAtMDYwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gPj4+IE9uIDI3LjA3LjE4IGF0IDE3OjMxLCA8cm9nZXIucGF1QGNp
dHJpeC5jb20+IHdyb3RlOgo+ID4+ID4gSW50cm9kdWNlIGEgbmV3IGlvbW11PWluY2x1c2l2ZSBn
ZW5lcmljIG9wdGlvbiB0aGF0IHN1cGVyc2VkZXMKPiA+PiA+IGlvbW11X2luY2x1c2l2ZV9tYXBw
aW5nLiBUaGlzIHNob3VsZCBiZSBhIG5vbi1mdW5jdGlvbmFsIGNoYW5nZSBvbgo+ID4+ID4gSW50
ZWwgaGFyZHdhcmUsIHdoaWxlIEFNRCBoYXJkd2FyZSB3aWxsIGdhaW4gdGhlIHNhbWUgZnVuY3Rp
b25hbGl0eSBvZgo+ID4+ID4gbWFwcGluZyBhbG1vc3QgZXZlcnl0aGluZyBiZWxvdyB0aGUgNEdC
IGJvdW5kYXJ5Lgo+ID4+IAo+ID4+IFNvIGZpcnN0IG9mIGFsbCAtIHdoYXQncyB0aGUgbW90aXZh
dGlvbiBiZWhpbmQgdGhpcyBjaGFuZ2U/IFNvIGZhciB3ZQo+ID4+IGhhZCBubyBuZWVkIGZvciBo
YWNrcyBsaW5lIHRoZSBWVC1kIHNpZGUgb25lIG9uIEFNRC4gSSBkb24ndCB0aGluawo+ID4+IHRo
aXMgc2hvdWxkIGJlIHdpZGVuZWQgd2l0aG91dCB0aGVyZSBiZWluZyBpbmRpY2F0aW9uIG9mIGEg
cHJvYmxlbQo+ID4+IHdpdGggbm9uLW5pY2hlIEFNRCBzeXN0ZW1zLgo+ID4gCj4gPiBPSywgSSBj
YW4gbGVhdmUgdGhlIGRlZmF1bHQgb24gZm9yIEludGVsIGFuZCBvZmYgZm9yIGV2ZXJ5dGhpbmcg
ZWxzZSwKPiA+IGJ1dCBJIHdpbGwgaW50cm9kdWNlIHRoZSBnZW5lcmljIGRvbTAtaW9tbXU9IG9w
dGlvbiBhbnl3YXkuCj4gCj4gSG1tLCBJJ3ZlIGFsd2F5cyBiZWVuIHdpc2hpbmcgd2UnZCBjaGFu
Z2UgdG8gYSBkZWZhdWx0IG9mIG9mZiBmb3IKPiBWVC1kIGFzIHdlbGwgLSBpbW8gd2Ugc2hvdWxk
bid0IGJ5IGRlZmF1bHQgYXNzdW1lIGJyb2tlbiBmaXJtd2FyZS4KPiBLZXZpbj8KCkknbSBhbGwg
Zm9yIGl0LCBidXQgZXZlbiBpbiBuZXdpc2ggc3lzdGVtcyAoYXMgcmVjZW50bHkgcmVwb3J0ZWQg
YnkKcGVvcGxlIHRyeWluZyBQVkggRG9tMCkgUk1SUiBlbnRyaWVzIGFyZSBtaXNzaW5nIGFuZCB3
aWxsIG1ha2Ugc29tZQpkZXZpY2VzIHVudXNhYmxlLgoKPiBBcyB0byBBTUQgLSB5b3Ugc3RpbGwg
ZG9uJ3QgcmVhbGx5IHNheSB3aHkgdGhpcyB3b3VsZCBiZSBuZWVkZWQKPiB0aGVyZS4gSSdtIG5v
dCBpbiBmYXZvciBvZiB3b3JrYXJvdW5kcyB3aGVuIHRoZXJlJ3Mgbm90aGluZyB0bwo+IHdvcmsg
YXJvdW5kLiBJT1cgLSBpZiB0aGUgbG9naWMgaXNuJ3QgbmVlZGVkIG9uIEFNRCwgZG8gd2UgbmVl
ZAo+IHRoaXMgY29kZSBtb3ZlbWVudCBpbiB0aGUgZmlyc3QgcGxhY2U/CgpUaGVyZSdzIG5vdGhp
bmcgVlRkIHNwZWNpZmljIGluIHRoaXMgY29kZSBhdCBhbGwsIEkgY291bGQgc2VlIGl0Cmxpdmlu
ZyBpbiBhIFZUZCBzcGVjaWZpYyBmaWxlIGlmIGl0IGhhZCBxdWlya3Mgc3BlY2lmaWMgdG8gVlRk
LCBidXQgSQp0aGluayB0aGUgY29kZSBpcyBnZW5lcmljIGVub3VnaCB0aGF0IGl0IHdhcnJhbnRz
IGJlaW5nIHNoYXJlZCwgc28KdGhhdCBwZW9wbGUgcnVubmluZyBvbiBBTUQgaHcgY2FuIGFsc28g
ZW5hYmxlIGl0IGlmIHJlcXVpcmVkLgoKQXMgcmVxdWVzdGVkIEkndmUgbGVmdCB0aGlzIG9mZiBm
b3IgQU1EIGFuZCBvbiBieSBkZWZhdWx0IG9uIEludGVsLCBzbwp0aGUgZGVmYXVsdCBmdW5jdGlv
bmFsaXR5IGlzIG5vdCBjaGFuZ2VkIGF0IGFsbC4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
