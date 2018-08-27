From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] xenforeignmemory: work around bug in older
 privcmd
Date: Mon, 27 Aug 2018 10:11:50 +0100
Message-ID: <20180827091150.sat5vd2h6r655xmj@citrix.com>
References: <20180824121626.27261-1-paul.durrant@citrix.com>
 <5B83BEB702000078001E20AA@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=l1z4=lk=citrix.com=prvs=770442350=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fuDYx-0005F5-DZ
 for xen-devel@lists.xenproject.org; Mon, 27 Aug 2018 09:11:55 +0000
Content-Disposition: inline
In-Reply-To: <5B83BEB702000078001E20AA@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBdWcgMjcsIDIwMTggYXQgMDM6MDQ6NTVBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI0LjA4LjE4IGF0IDE0OjE2LCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+
IHdyb3RlOgo+ID4gVmVyc2lvbnMgb2YgbGludXggcHJpdmNtZCBwcmlvciB0byBjb21taXQgZGM5
ZWFiNmZkOTRkICgicmV0dXJuIC1FTk9UVFkKPiA+IGZvciB1bmltcGxlbWVudGVkIElPQ1RMcyIp
IHdpbGwgcmV0dXJuIC1FSU5WQUwgcmF0aGVyIHRoYW4gdGhlIGNvbnZlbnRpb25hbAo+ID4gLUVO
T1RUWSBmb3IgdW5pbXBsZW1lbnRlZCBjb2Rlcy4gVGhpcyBicmVha3MgdGhlIGVycm9yIHBhdGgg
aW4KPiA+IGxpYnhlbmZvcmVpZ25tZW1vcnkgcmVzb3VyY2UgbWFwcGluZywgd2hpY2ggb25seSB0
cmFuc2xhdGVzIEVOT1RUWSBpbnRvCj4gPiBFT1BOT1RTVVBQIHRvIGluZm9ybSBjYWxsZXJzIG9m
IHRoZSBuZWVkIHRvIHVzZSBhbiBhbHRlcm5hdGl2ZSAobGVnYWN5KQo+ID4gbWVjaGFuaXNtLgo+
ID4gCj4gPiBUaGlzIHBhdGNoIGFkZHMgYSBuZXcgJ3VuaW1wbGVtZW50ZWQnIFsxXSBpb2N0bCBj
b2RlIGludG8gdGhlIGxvY2FsCj4gPiBwcml2Y21kIGhlYWRlciB3aGljaCBpcyB0aGVuIHVzZWQg
dG8gcHJvYmUgZm9yIHRoZSBhcHByb3ByaWF0ZSBlcnJubyB0bwo+ID4gdHJhbnNsYXRlIGluIHRo
ZSByZXNvdXJjZSBtYXBwaW5nIGVycm9yIHBhdGgKPiA+IAo+ID4gWzFdIHRoaXMgaXMgYSBjb2Rl
IHRoYXQgaGFzLCBzbyBmYXIsIG5ldmVyIGJlZW4gdXNlZCBpbiBhbnkgdmVyc2lvbiBvZgo+ID4g
ICAgIHByaXZjbWQgYW5kIHdpbGwgYmUgYWRkZWQgdG8gZnV0dXJlIHZlcnNpb25zIG9mIHRoZSBo
ZWFkZXIgaW4gdGhlCj4gPiAgICAgbGludXggc291cmNlLCB0byBtYWtlIHN1cmUgaXQgc3RheXMg
dW5pbXBsZW1lbnRlZC4KPiAKPiBTaG91bGRuJ3QgdGhpcyBhZGRpdGlvbiBoYXBwZW4gYmVmb3Jl
IHRoZSBYZW4gdG9vbHMgc2lkZSBjaGFuZ2UgZ29lcwo+IGluPwoKSXQgZG9lc24ndCByZWFsbHkg
bWFrZSBhbnkgZGlmZmVyZW5jZSBmcm9tIGEgcHJhY3RpY2FsIFBvVi4gQXBwbHlpbmcKdGhpcyBw
YXRjaCByaWdodCBhd2F5IGhlbHBzIHVuYmxvY2tpbmcgdmFyaW91cyBMaW51eCBicmFuY2hlcy4K
CldlaS4KCj4gCj4gSmFuCj4gCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
