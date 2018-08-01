From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/4] iommu: generalize
 iommu_inclusive_mapping
Date: Wed, 01 Aug 2018 02:20:36 -0600
Message-ID: <5B616D5402000078001D9BFE@prv1-mh.provo.novell.com>
References: <20180727153149.25094-1-roger.pau@citrix.com>
 <20180727153149.25094-3-roger.pau@citrix.com>
 <5B60749A02000078001D9886@prv1-mh.provo.novell.com>
 <20180731153317.kryord4hezdukfgy@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=qz6i=kq=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fkmN8-0004u5-PI
 for xen-devel@lists.xenproject.org; Wed, 01 Aug 2018 08:20:42 +0000
In-Reply-To: <20180731153317.kryord4hezdukfgy@mac>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMxLjA3LjE4IGF0IDE3OjMzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFR1ZSwgSnVsIDMxLCAyMDE4IGF0IDA4OjM5OjIyQU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMjcuMDcuMTggYXQgMTc6MzEsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gSW50cm9kdWNlIGEgbmV3IGlvbW11PWluY2x1c2l2ZSBnZW5lcmljIG9wdGlv
biB0aGF0IHN1cGVyc2VkZXMKPj4gPiBpb21tdV9pbmNsdXNpdmVfbWFwcGluZy4gVGhpcyBzaG91
bGQgYmUgYSBub24tZnVuY3Rpb25hbCBjaGFuZ2Ugb24KPj4gPiBJbnRlbCBoYXJkd2FyZSwgd2hp
bGUgQU1EIGhhcmR3YXJlIHdpbGwgZ2FpbiB0aGUgc2FtZSBmdW5jdGlvbmFsaXR5IG9mCj4+ID4g
bWFwcGluZyBhbG1vc3QgZXZlcnl0aGluZyBiZWxvdyB0aGUgNEdCIGJvdW5kYXJ5Lgo+PiAKPj4g
U28gZmlyc3Qgb2YgYWxsIC0gd2hhdCdzIHRoZSBtb3RpdmF0aW9uIGJlaGluZCB0aGlzIGNoYW5n
ZT8gU28gZmFyIHdlCj4+IGhhZCBubyBuZWVkIGZvciBoYWNrcyBsaW5lIHRoZSBWVC1kIHNpZGUg
b25lIG9uIEFNRC4gSSBkb24ndCB0aGluawo+PiB0aGlzIHNob3VsZCBiZSB3aWRlbmVkIHdpdGhv
dXQgdGhlcmUgYmVpbmcgaW5kaWNhdGlvbiBvZiBhIHByb2JsZW0KPj4gd2l0aCBub24tbmljaGUg
QU1EIHN5c3RlbXMuCj4gCj4gT0ssIEkgY2FuIGxlYXZlIHRoZSBkZWZhdWx0IG9uIGZvciBJbnRl
bCBhbmQgb2ZmIGZvciBldmVyeXRoaW5nIGVsc2UsCj4gYnV0IEkgd2lsbCBpbnRyb2R1Y2UgdGhl
IGdlbmVyaWMgZG9tMC1pb21tdT0gb3B0aW9uIGFueXdheS4KCkhtbSwgSSd2ZSBhbHdheXMgYmVl
biB3aXNoaW5nIHdlJ2QgY2hhbmdlIHRvIGEgZGVmYXVsdCBvZiBvZmYgZm9yClZULWQgYXMgd2Vs
bCAtIGltbyB3ZSBzaG91bGRuJ3QgYnkgZGVmYXVsdCBhc3N1bWUgYnJva2VuIGZpcm13YXJlLgpL
ZXZpbj8KCkFzIHRvIEFNRCAtIHlvdSBzdGlsbCBkb24ndCByZWFsbHkgc2F5IHdoeSB0aGlzIHdv
dWxkIGJlIG5lZWRlZAp0aGVyZS4gSSdtIG5vdCBpbiBmYXZvciBvZiB3b3JrYXJvdW5kcyB3aGVu
IHRoZXJlJ3Mgbm90aGluZyB0bwp3b3JrIGFyb3VuZC4gSU9XIC0gaWYgdGhlIGxvZ2ljIGlzbid0
IG5lZWRlZCBvbiBBTUQsIGRvIHdlIG5lZWQKdGhpcyBjb2RlIG1vdmVtZW50IGluIHRoZSBmaXJz
dCBwbGFjZT8KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
