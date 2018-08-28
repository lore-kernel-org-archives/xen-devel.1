From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 16/23] x86/p2m/pod: make it build with
 !CONFIG_HVM
Date: Tue, 28 Aug 2018 05:32:46 -0600
Message-ID: <5B8532DE02000078001E28D1@prv1-mh.provo.novell.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
 <d4796499faf997d270ae74f82a4b0175663c20a8.1535285866.git-series.wei.liu2@citrix.com>
 <5B85285902000078001E286D@prv1-mh.provo.novell.com>
 <20180828105437.7wxrx4c4x2qvx2k7@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=k/hy=ll=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fucEu-0006Im-V3
 for xen-devel@lists.xenproject.org; Tue, 28 Aug 2018 11:32:52 +0000
In-Reply-To: <20180828105437.7wxrx4c4x2qvx2k7@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjA4LjE4IGF0IDEyOjU0LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gVHVlLCBBdWcgMjgsIDIwMTggYXQgMDQ6NDc6NTNBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAyNi4wOC4xOCBhdCAxNDoxOSwgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdy
b3RlOgo+PiA+ICtzdGF0aWMgaW5saW5lIGludCBwMm1fcG9kX3NldF9tZW1fdGFyZ2V0KHN0cnVj
dCBkb21haW4gKmQsIHVuc2lnbmVkIGxvbmcgdGFyZ2V0KQo+PiA+ICt7Cj4+ID4gKyAgICByZXR1
cm4gMDsKPj4gPiArfQo+PiAKPj4gVGhpcyBvbmUsIGF0IHRoZSB2ZXJ5IGxlYXN0LCBzaG91bGQg
bm90IGJlIG5lZWRlZDogVGhlIGNhc2UgYmxvY2sKPj4gaW4gYXJjaF9tZW1vcnlfb3AoKSBjb250
YWluaW5nIHRoZSBvbmx5IGNhbGwgc2hvdWxkIGFsdG9nZXRoZXIgYmUKPj4gZnJhbWVkIGJ5ICNp
ZmRlZiBDT05GSUdfSFZNLgo+IAo+IFRoZSB0b29sc3RhY2sgdW5jb25kaXRpb25hbGx5IHNldHMg
cG9kIHRhcmdldCB3aGVuIHNldHRpbmcgYSBkb21haW4ncwo+IG1lbW9yeSB0YXJnZXQuIEkgd2ls
bCBuZWVkIHRvIGNoYW5nZSBsaWJ4bCB0byBub3QgaXNzdWUgcG9kIGNhbGwgZm9yIFBWCj4gZ3Vl
c3RzIGluIHRoYXQgY2FzZS4KCkFoLCBJIHNlZS4gSSBhbHNvIGZvcmdvdCB0byBzYXkgdGhhdCB0
aGUgZW50aXJlIHBvZCBzdWItc3RydWN0dXJlCm9mIHN0cnVjdCBwMm1fZG9tYWluIHNob3VsZCBh
bHNvIGJlIGVuY2xvc2VkIGluICNpZmRlZiBDT05GSUdfSFZNLgoKSmFuCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
